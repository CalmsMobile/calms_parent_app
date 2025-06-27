import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../../../common/widgets/common.dart';
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
  TextEditingController codeController = TextEditingController();
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
    setState(() {
      isQrView = false;
    });
    return Future.value(true);
    /* qrCodeResult = "";
    if (isQrView) {
      setState(() {
        isQrView = false;
      });
      if (kDebugMode) {
        print("QR: start");
        //rnd
        var qrdata =
            "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+YDCq3ZKz2ctrqZBVSRFc5dbHg+7ZKbpZlMkh8NNQatNf83hsXcToACqmlZ+8Tlabb0D0cC211BmzymayoQ3yB9E2U0E7NfkX/TdTmQJdBhG5DFY0LKgT1iYiGytP6PWP4EQbAa+rn7FQx+kyNHA82z";
        //demosgl nizam
        qrdata = "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+bGMdB1tYpmlqbOdBjobyEQK/CCq8T0Wykezki2gLf2+a2slNXa94kS3RqHmwCHUpTzJce9n5KDdpveoXcXM5PCCYQYa/XDmG/Mk3ukf9IPT0K9GXyYA2cc28Sb1a01aHpilFXfzE2tGMS9V5LnvF5p";
        //demosgl mizan
        //qrdata = "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+Yc5/Y7f2TUSFOo7VPq1jRIHrC9FBaoetsbb8LnEb1/BRboz2De+zpCQSzgnHFD/YZlnox+4YAWdQlpvFHbx3LQjWfjt/favVdmcTu4Wu0tBRRUMuH4bMq45rZTyrukgFhC0Cy9iS8JtBgAfBUrZesP";
        // qrdata = "D5qpk1C3xkIxgAIPyzivIXAY1+BrXWHUlQKXDwvQA+ZkxQn8k67lSfDI8eaIj980DFCHnNdkOTJXCC4r/aQqRJ1f1Z6zvUdVo20kGKeRieyyphhuWC2RyVjkh9beB0C52Hswjv9iEbi/1yapUEtWEh0NM3FVbioW4IzFqvMnmC6uaryaBj969iYvXg9jxJGu";
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
    } */
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
              qrJson["ApiUrl"], AppSettings.GetQRInfo, context, false, false);
          res
              .then((value) =>
                  {handleApiResponse(value, decryptdata, qrJson["ApiUrl"])})
              .onError((error, stackTrace) => {qrProcessError(error)});
        } else {
          MyCustomAlertDialog().showCustomAlert(
              context, "Notification", "Invalid QR code", true, () {
            Navigator.pop(context);
            //resetQRData();
          }, null, "Ok", "");
        }
      } else {
        MyCustomAlertDialog().showCustomAlert(
            context, "Notification", "Invalid QR code", true, () {
          Navigator.pop(context);
          //resetQRData();
        }, null, "Ok", "");
      }
    }
  }

  void qrProcessError(error) {
    print(error.toString());
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
      //resetQRData();
    }, null, "Ok", "");
  }

  void handleApiResponse(
      Map<String, dynamic> response, decryptdata, String baseUrl) async {
    print('response >>' + jsonEncode(response));
    if (response.containsKey("code") && response['code'] > 10) {
      print("Error in response");
      MyCustomAlertDialog().showCustomAlert(
          context, "Notification", response["Description"], true, () {
        Navigator.pop(context);
        //resetQRData();
      }, null, "Ok", "");
    } else {
      //MySharedPref().saveData(jsonEncode(response), AppSettings.deviceDetails);
      //print(response['Table1'][0]);
      //MySharedPref().saveData(jsonEncode(response['Table1'][0]), AppSettings.profileData);
      baseUrl = baseUrl.replaceAll("/api/", "/FS/");
      String? DeviceId = await PlatformDeviceId.getDeviceId;
      print("device id --- "+DeviceId!);
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
                    flex: 1,
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
                            "How you like to register the app?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                                    image:
                                        AssetImage('assets/images/qrcode.png')),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(60.0))),
                                    context: context,
                                    enableDrag: false,
                                    isDismissible: false,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              getBottomSheetActionBar(
                                                  context,
                                                  'Manual Registration',
                                                  false,
                                                  Colors.white),
                                              Container(
                                                width: double.maxFinite,
                                                margin: EdgeInsets.only(
                                                    left: 12, bottom: 5),
                                                child: Text(
                                                  "  Registration Code",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 0),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  maxLines: 3,
                                                  decoration:
                                                      new InputDecoration(
                                                          border:
                                                              new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              const OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 2.0),
                                                          ),
                                                          focusedBorder:
                                                              const OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2.0),
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          hintText:
                                                              'Paste your registration code here',
                                                          labelText: '',
                                                          focusColor:
                                                              Colors.black,
                                                          prefixText: ' ',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                  onChanged: (text) {
                                                    print(text);
                                                  },
                                                  controller: codeController,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      margin:
                                                          EdgeInsets.all(10),
                                                      child: SizedBox(
                                                          height: 45,
                                                          child: ElevatedButton(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  "Proceed",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                //Icon(Icons.payment)
                                                              ],
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              qrCodeResult = "";
                                                              processQRCode(
                                                                  codeController
                                                                      .text);
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          6,
                                                                          105,
                                                                          199),
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60.0)),
                                                            ),
                                                          ))),
                                                  Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      margin:
                                                          EdgeInsets.all(10),
                                                      child: SizedBox(
                                                          height: 45,
                                                          child: ElevatedButton(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  "Cancel",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                //Icon(Icons.payment)
                                                              ],
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              // _reSend();
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          6,
                                                                          105,
                                                                          199),
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60.0)),
                                                            ),
                                                          ))),
                                                ],
                                              )
                                            ],
                                          ));
                                    },
                                  );
                                },
                                child: Image(
                                    width: 120,
                                    height: 120,
                                    image: AssetImage(
                                        'assets/images/keyboard.png')),
                              ),
                            ],
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
        ? 250.0
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
