import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/app_settings.dart';
import 'package:calms_parent/common/crypto_enc.dart';
import 'package:calms_parent/common/my_shared_pref.dart';
import 'package:calms_parent/provider/rest_api.dart';
import 'package:calms_parent/ui/screens/scan_qr_registration/account_mapping.dart';
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
        print("ENC: start");
        var qrdata =
            "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+ZdYEMAODR6p8LO+xtwCb40mDM1KuLMvZxu7dYHbnj4vz2xIA0UFUraTm0CeyJet7mcA0J13k2dSiQDJPtLlTDk5kYp0xT+l6pIB8TI0DpuRDQzczYlTdoFpt0NJ+Rx0fB4RdyfSpYEDuvUaZ3W4egr";
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
      String decryptdata = CryptoEncryption().decryption(qrData);
      if (kDebugMode) {
        print("DECRYPT: " + decryptdata);
        //decryptdata ='{"MAppId":"PARENTAPP","MAppSeqId":"447","ApiUrl":"http://103.6.163.49:1001/api/","LocalApiUrl":"http://103.6.163.49:1001/api/"}';
      }
      if (decryptdata != "") {
        Map<String, dynamic> qrJson = jsonDecode(decryptdata);
        var data = {'MAppDevSeqId': qrJson["MAppSeqId"]};
        print(data);
        if (qrJson['MAppId'] == "PARENTAPP") {
          Future<Map<String, dynamic>> res = RestApiProvider().postData(data,
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
    //print('response >>' + jsonEncode(response));
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
      MySharedPref()
          .saveData(jsonEncode(response['Table1'][0]), AppSettings.profileData);
      baseUrl = baseUrl.replaceAll("/api/", "/FS/");
      String? DeviceId = await PlatformDeviceId.getDeviceId;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AccountMapping(
                  baseUrl: baseUrl,
                  dataResponseModel: response['Table1'][0],
                  decryptdata: decryptdata,
                  DeviceId: DeviceId,
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
          body: new Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/app_bg.png"),
                    fit: BoxFit.cover)),
            child: new Column(
              children: [
                if (isQrView)
                  Expanded(
                    flex: 4,
                    child: _buildQrView(context),
                    // child: Stack(
                    //   alignment: Alignment.bottomCenter,
                    //   children: [
                    //     Expanded(flex: 4, child: _buildQrView(context)),
                    // if (result != null)
                    //   Text(
                    //       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                    // else
                    //   const Text('Scan a code'),
                    // Container(
                    //   color: Colors.orange,
                    //   padding:
                    //       EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    //   margin: const EdgeInsets.only(bottom: 100),
                    //   child: Text(
                    //     AppLocalizations.of(context)!.scanYourQrcode,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 18,
                    //         color: Colors.white),
                    //   ),
                    // ),
                    // ],
                    // ),
                  )
                else
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image(
                              width: 120,
                              height: 120,
                              image: AssetImage('assets/images/logo.png')),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Scan QR Code from the button below",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            elevation: 15,
                            shadowColor: Colors.grey,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: InkWell(
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
                                  width: 95,
                                  height: 95,
                                  image:
                                      AssetImage('assets/images/qrcode.png')),
                            ),
                          ),
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
