import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '/common/alert_dialog.dart';
import '/common/app_settings.dart';
import '/common/crypto_enc.dart';
import '/common/my_shared_pref.dart';
import '/provider/rest_api.dart';
import '/ui/screens/scan_qr_registration/account_mapping.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class QRRegistration extends StatefulWidget {
  const QRRegistration({Key? key}) : super(key: key);

  @override
  _QRRegistrationState createState() => _QRRegistrationState();
}

class _QRRegistrationState extends State<QRRegistration> {
  bool isQrView = false;
  String qrCodeResult = '';
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (kDebugMode) _onBackPressed();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (isQrView) {
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      }
      controller!.resumeCamera();
    }
  }

  void stopListening() {}

  Future<bool> _onBackPressed() {
    if (isQrView) {
      setState(() {
        isQrView = false;
      });
      if (kDebugMode) {
        print("QR: start");
        //store tester account - 1001
        //var qrdata = "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+a0ENSxKwKvGgdAg7wsIh62QJIMYRk74tBLpCytINKDGfH2IgcCp08LVhD6OEkWBFBWCoLHBsv0C2RptNGLGIp0R8+Jzsh612VXMk+kLirn+JgMg/p9/ZDM2TAjzGQaETHhUuOUptJYcbOQAYPXZRgb";
        //nizam-parent - rnd
        var qrdata =
            "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+YDCq3ZKz2ctrqZBVSRFc5dbHg+7ZKbpZlMkh8NNQatNf83hsXcToACqmlZ+8Tlabb0D0cC211BmzymayoQ3yB9E2U0E7NfkX/TdTmQJdBhG5DFY0LKgT1iYiGytP6PWP4EQbAa+rn7FQx+kyNHA82z";
        //nizam-parent - 2008
        // var qrdata = "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+bKsLCI7GP2EMDb8/1tHG/vkPFFxV/ebxiJkiU/wVqVOC7dkd76icciFv3SgUJiIBCpdQ2oQIgBdXE0rSyFVEfiCAA9rSZ9QBMCONEr18fv7Q==";
        //var qrdata = "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+bKsLCI7GP2EMDb8/1tHG/vkPFFxV/ebxiJkiU/wVqVOC7dkd76icciFv3SgUJiIBCpdQ2oQIgBdXE0rSyFVEfiCAA9rSZ9QBMCONEr18fv7Q==";
        /*  DECRYPT: {"MAppId":"PARENTAPP","MAppSeqId":"106","RefUserSeqId":"100004","RefBranchSeqId":"11001","ApiUrl":""}
js_primitives.dart:30 {MAppDevSeqId: 106} */
        // qrdata ="D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+adrrhq0g3nvj3JeZ84JEqfdmMP7QHPtWgIVGBvita/v0pMqyQadCbws1wx4G6khHxrjJ2tlmJcGlUKWo0lnjpyU3XhnsQeYjLgb93luli+oPzUaEQJvhIL2JJh4xmaYZYN+4S/GjPGoj0ZL7Z8yPxj";
        processQRCode(qrdata);
      }
      // String inputdata =
      //     "{\"ApiUrl\":\"http://124.217.235.107:1001/api/\",\"CompanyId\":\"0\",\"HostId\":\"VijayCalms\", \"AppId\":\"1\", \"MAppId\":\"TAMSAPP\"}";
      // String encryptdata = CryptoEncryption().encryptMyData(inputdata);
      // if (kDebugMode) {
      //   print("ENC: " + encryptdata);
      // }
      //Thila 2008
      //var qrdata = '42Fcpk4wSQVW7uqmY3NPk5DhtVO+so0aZHgC+vkcvvzmHQwiU3DwLspssruFDNXeqq0bXjI9oA6VRH/wkdfs0Urnm79vDh8QtFFnxlIXlmJUAnqy7wrh6jxtbga1ChdBcaH3r6RIOelf2nqOCaHwoF3/t3eAiXzoHJHxRzz7NAGDTydXLCgNowFgcS3hrwv6';
      //Izza 2008
      // var qrdata =
      //     '42Fcpk4wSQVW7uqmY3NPk5DhtVO+so0aZHgC+vkcvvwDSk2Xauc+GM9g2WoeS1MxYja1e6OHKdykTx1IK+zxI8pZJvcEgiTMWb0zUr5FSkKVnnyb4663l6C8EQHXXjesb+wz1SQGErkJGvDHukrb+AVoQDdPWsZ/Job4nK8s4dsWDC/RWjjPwrmG5e9K4XB5';
      //Siva
      // var qrdata =
      //     "42Fcpk4wSQVW7uqmY3NPk5DhtVO+so0aZHgC+vkcvvzoiOlTwStG5SP1L7poLtlzGXOP1D3+nUTzUcrojygQd4SLPDdyAHscm39Bx/zau3iW6M100/9jhJCskTeb86CS8YeKkzmNX0mGndmnAMFqae+iraFeRJ1VK0Kxtht1Hb0R4nqLo5t4wOwd5qcOp+O0";

      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  void processQRCode(String qrData) {
    print("qrCodeResult>> $qrCodeResult");
    print(qrCodeResult);
    if (qrCodeResult == "") {
      qrCodeResult = qrData;
      print("qrCodeResult inside >> $qrCodeResult  >> $qrData");
      String decryptdata =
          CryptoEncryption(AppSettings.commonCryptoKey).decryption(qrData);
      if (kDebugMode) {
        print("DECRYPT: " + decryptdata);
        //decryptdata ='{"MAppId":"PARENTAPP","MAppSeqId":"447","ApiUrl":"http://103.6.163.49:1001/api/","LocalApiUrl":"http://103.6.163.49:1001/api/"}';
      }
      if (decryptdata != "") {
        Map<String, dynamic> qrJson = jsonDecode(decryptdata);
        //var MAppDevSeqId = {'MAppDevSeqId': qrJson["MAppDevSeqId"]};
        //qrJson['MAppSeqId'] = '0L1yJ8WKCFjSLrRTvuyOCQ==';
        var data = {
          "Authorize": null,
          "Param": {"MAppDevSeqId": qrJson["MAppSeqId"]}
        };

        if (qrJson['MAppId'] == "PARENTAPP") {
          Future<Map<String, dynamic>> res = RestApiProvider().postNewData(data,
              qrJson["ApiUrl"], AppSettings.GetQRInfo, context, true, false);
          res
              .then((value) =>
                  {handleApiResponse(value, decryptdata, qrJson["ApiUrl"])})
              .onError((error, stackTrace) => {qrProcessError(error)});
        } else {
          MyCustomAlertDialog().showCustomAlert(
              context, "Notification", "Invalid QR code", true, () {
            Navigator.pop(context);
            resetQRData();
          }, null);
        }
      } else {
        MyCustomAlertDialog().showCustomAlert(
            context, "Notification", "Invalid QR code", true, () {
          Navigator.pop(context);
          resetQRData();
        }, null);
      }
    }
  }

  void qrProcessError(error) {
    print(error.toString());
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
      //resetQRData();
    }, null);
  }

  void handleApiResponse(
      Map<String, dynamic> response, decryptdata, String baseUrl) async {
    print('response >>' + jsonEncode(response));
    if (response.containsKey("code") && response['code'] > 10) {
      print("Error in response");
      MyCustomAlertDialog().showCustomAlert(
          context, "Notification", response["Description"], true, () {
        Navigator.pop(context);
        resetQRData();
      }, null);
    } else {
      //MySharedPref().saveData(jsonEncode(response), AppSettings.deviceDetails);
      //print(response['Table1'][0]);
      //MySharedPref().saveData(jsonEncode(response['Table1'][0]), AppSettings.profileData);
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
      );
      //Navigator.pushReplacement(context,
      //   MaterialPageRoute(builder: (context) => new AccountMapping()));
      // resetQRData();
    }

    // apiURL = qrJson['ApiUrl'];
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/app_bg.png"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (isQrView)
                  Expanded(
                    flex: 4,
                    child: _buildQrView(context),
                  )
                else
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image(
                              width: 130,
                              height: 130,
                              image: AssetImage('assets/images/logo.png')),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Scan QR Code from \n the button below",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              print("tapped");
                              //barcode scanner
                              setState(() {
                                isQrView = !isQrView;
                                //   Navigator.pushReplacement(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               new LoginScreen()));
                              });
                            },
                            child: Image(
                                width: 130,
                                height: 130,
                                image: AssetImage('assets/images/qrcode.png')),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Image(
                              width: 200,
                              height: 200,
                              alignment: Alignment.bottomCenter,
                              image: AssetImage(
                                  'assets/images/welcome_bottom_img.png')),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (result != null) {
        if (result!.code != null && result!.code != "") {
          processQRCode(result!.code as String);
        }
      }
    });
  }

  void resetQRData() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        qrCodeResult = "";
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      if (kDebugMode) {
        _onBackPressed();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(content: Text(AppLocalizations.of(context)!.noPermission)),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
