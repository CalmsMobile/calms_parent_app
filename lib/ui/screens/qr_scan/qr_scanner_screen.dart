import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../common/alert_dialog.dart';
import '../../../common/app_settings.dart';
import '../../../common/crypto_enc.dart';
import '../../../provider/rest_api.dart';
import '../scan_qr_registration/account_mapping.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool _scanned = false;
  bool _loading = false; // Add this flag

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan QR Code')),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (BarcodeCapture capture) {
              if (_scanned || _loading) return;
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final String? code = barcodes.first.rawValue;
                if (code != null) {
                  setState(() {
                    _scanned = true;
                  });
                  processQRCode(code, context);
                }
              }
            },
          ),
          if (_loading)
            Container(
              color: Colors.black45,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  void processQRCode(String qrData, BuildContext context) {
    String decryptdata =
        CryptoEncryption(AppSettings.commonCryptoKey).decryption(qrData);
    print("DECRYPT: " + decryptdata);
    if (decryptdata != "") {
      try {
        Map<String, dynamic> qrJson = jsonDecode(decryptdata);
        var data = {
          "Authorize": null,
          "Param": {"MAppDevSeqId": qrJson["MAppSeqId"]}
        };

        if (qrJson['MAppId'] == "PARENTAPP") {
          setState(() {
            _loading = true; // Show loader
          });
          Future<Map<String, dynamic>> res = RestApiProvider().postNewData(
              data,
              qrJson["ApiUrl"],
              AppSettings.GetQRInfo,
              context,
              false,
              false);
          res
              .then((value) => {
                    handleApiResponse(
                        value, decryptdata, qrJson["ApiUrl"], context)
                  })
              .onError((error, stackTrace) =>
                  {qrProcessError(error, context)});
        } else {
          showError(context, "Invalid QR code");
        }
      } catch (e) {
        showError(context, "Invalid QR code format");
      }
    } else {
      showError(context, "Invalid QR code");
    }
  }

  void showError(BuildContext context, String message) {
    setState(() {
      _loading = false; // Hide loader
    });
    MyCustomAlertDialog().showCustomAlert(
      context,
      "Notification",
      message,
      true,
      () {
        Navigator.of(context, rootNavigator: true).pop();
        setState(() {
          _scanned = false;
        });
      },
      null,
      "Ok",
      "",
    );
  }

  void qrProcessError(error, BuildContext context) {
    setState(() {
      _loading = false; // Hide loader
    });
    print(error.toString());
    MyCustomAlertDialog().showCustomAlert(
      context,
      "Notification",
      error.toString(),
      true,
      () {
        Navigator.of(context, rootNavigator: true).pop();
        setState(() {
          _scanned = false;
        });
      },
      null,
      "Ok",
      "",
    );
  }

  void handleApiResponse(Map<String, dynamic> response, decryptdata,
      String baseUrl, BuildContext context) async {
    setState(() {
      _loading = false; // Hide loader
    });
    print('response >>' + jsonEncode(response));
    if (response.containsKey("code") && response['code'] > 10) {
      print("Error in response");
      showError(context, response["Description"]);
    } else {
      baseUrl = baseUrl.replaceAll("/api/", "/FS/");
      String? DeviceId = await PlatformDeviceId.getDeviceId;
      String DevicePlatform = "";
      if (defaultTargetPlatform == TargetPlatform.android) {
        DevicePlatform = "Android";
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        DevicePlatform = "iOS";
      } else {
        DevicePlatform = "Web";
      }
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AccountMapping(
                  baseUrl: baseUrl,
                  dataResponseModel: response['Table1'][0],
                  decryptdata: decryptdata,
                  DeviceId: DeviceId,
                  DevicePlatform: DevicePlatform,
                )),
      ).then((_) {
        setState(() {
          _scanned = false;
        });
      });
    }
  }
}
