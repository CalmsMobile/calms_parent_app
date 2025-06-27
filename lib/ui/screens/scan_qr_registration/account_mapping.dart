import 'dart:convert';

import 'package:calms_parent_latest/common/util/app_button.dart';
import 'package:calms_parent_latest/main.dart';

import '../../../common/crypto_enc.dart';
import '../../../common/util/common_funtions.dart';
import '/common/app_settings.dart';
import '/common/my_shared_pref.dart';
import '/common/util/linked_checkbox.dart';
import '../pin_lock/create_pin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../common/alert_dialog.dart';
import '../../../provider/rest_api.dart';

class AccountMapping extends StatefulWidget {
  const AccountMapping(
      {Key? key,
      required this.dataResponseModel,
      required this.baseUrl,
      required this.decryptdata,
      required this.DeviceId,
      required this.DevicePlatform})
      : super(key: key);
  // Declare a field that holds the Todo.
  final Map<String, dynamic> dataResponseModel;
  final String baseUrl;
  final String decryptdata;
  final String? DeviceId;
  final String DevicePlatform;
  @override
  State<AccountMapping> createState() => _AccountMappingState();
}

class _AccountMappingState extends State<AccountMapping> {
  bool isCheckBox1Selected = false;
  bool isCheckBox2Selected = false;
  bool isPressed = false;
  bool isDisableButton = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widget.dataResponseModel['Name'] == " +
        widget.dataResponseModel['Name']);
    print("UserImgPath" + widget.dataResponseModel["UserImgPath"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Scaffold(
          backgroundColor: Colors.transparent,
          /* appBar: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: Colors.transparent,
            //titleSpacing: -5,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image(
                    width: 50,
                    height: 50,
                    image: AssetImage("assets/images/ico_back.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
                // Your widgets here
              ],
            ),
          ),
          extendBodyBehindAppBar: false,
           */
          body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  //Color.fromARGB(255, 246, 249, 254),
                  Color.fromARGB(255, 246, 249, 254),
                  Color.fromARGB(255, 230, 231, 239),
                ],
              )),
              child: SingleChildScrollView(
                  child: Column(children: [
                Column(children: [
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      borderOnForeground: true,
                      margin: EdgeInsets.all(20),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          widget.dataResponseModel['BranchImg'] != null
                              ? CircleAvatar(
                                  radius: 40,
                                  backgroundImage: MemoryImage(
                                      CommonFunctions.getUnit8bytesFromB64(
                                          widget
                                              .dataResponseModel["BranchImg"])),
                                )
                              : CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.blue[700],
                                  child: Text(
                                    CommonFunctions.getInitials(widget
                                            .dataResponseModel['BranchName']
                                            .toString()
                                            .toUpperCase())
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.white,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.dataResponseModel['BranchName'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    widget.dataResponseModel["UserImgPath"] !=
                                            ""
                                        ? CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                widget.baseUrl +
                                                    widget.dataResponseModel[
                                                        "UserImgPath"]),
                                            radius: 40,
                                          )
                                        : CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.blue[700],
                                            child: Text(
                                              CommonFunctions.getInitials(widget
                                                      .dataResponseModel['Name']
                                                      .toString()
                                                      .toUpperCase())
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 22.0,
                                                  color: Colors.white,
                                                  letterSpacing: 2.0,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: Text(
                                        widget.dataResponseModel["Name"]!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/ico_id.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "ID",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            widget.dataResponseModel[
                                                            "MemberId"] !=
                                                        null &&
                                                    widget.dataResponseModel[
                                                            "MemberId"] !=
                                                        ""
                                                ? "" +
                                                    widget.dataResponseModel[
                                                        "MemberId"]!
                                                : "--",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/ico_email.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "Email",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            widget.dataResponseModel["Email"] !=
                                                        null &&
                                                    widget.dataResponseModel[
                                                            "Email"] !=
                                                        ""
                                                ? "" +
                                                    widget.dataResponseModel[
                                                        "Email"]!
                                                : "--",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/ico_contact.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "Contact",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            widget.dataResponseModel[
                                                            "ContactNo"] !=
                                                        null &&
                                                    widget.dataResponseModel[
                                                            "ContactNo"] !=
                                                        ""
                                                ? "" +
                                                    widget.dataResponseModel[
                                                        "ContactNo"]!
                                                : "--",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/ico_relatioship.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "Relationship",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            widget.dataResponseModel[
                                                            "RelationShip"] !=
                                                        null &&
                                                    widget.dataResponseModel[
                                                            "RelationShip"] !=
                                                        ""
                                                ? "" +
                                                    widget.dataResponseModel[
                                                        "RelationShip"]!
                                                : "--",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          LinkedLabelCheckbox(
                              label: 'Yes, above details are correct.',
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 0.0),
                              value: isCheckBox1Selected,
                              isDisableTextClick: true,
                              onChanged: (bool newValue) {
                                print(newValue);
                                setState(() {
                                  isCheckBox1Selected = newValue;
                                });
                              },
                              onTextClick: () {
                                debugPrint('Label has been tapped.');
                              }),
                          LinkedLabelCheckbox(
                            label: 'I, accept Terms and conditions',
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0),
                            value: isCheckBox2Selected,
                            isDisableTextClick: true,
                            onChanged: (bool newValue) {
                              print(newValue);
                              setState(() {
                                isCheckBox2Selected = newValue;
                              });
                            },
                            onTextClick: () {
                              print("open terms");
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ]),
                      )),
                  button("Register", isCheckBox1Selected, isCheckBox2Selected,
                      isPressed, () {
                    _onButtonPressed(
                        widget.dataResponseModel,
                        widget.decryptdata,
                        widget.DeviceId,
                        widget.DevicePlatform,
                        context);
                  }),
                  /* ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    onPressed: isCheckBox1Selected && isCheckBox2Selected
                        ? () {
                            _onButtonPressed(
                                widget.dataResponseModel,
                                widget.decryptdata,
                                widget.DeviceId,
                                widget.DevicePlatform);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 40),
                      backgroundColor: Color.fromARGB(255, 6, 105, 199),
                      elevation: 5,
                      textStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0)),
                    ),
                  ), */
                ]),
              ]))))
    ]));
  }

  _onButtonPressed(
      dataResponseModel, decryptdata, DeviceId, DevicePlatform, context) async {
    setState(() {
      isPressed = true;
    });
    print(dataResponseModel);
    print(decryptdata);
    print("DeviceId " + DeviceId);
    if (kDebugMode) {
      //DeviceId = "Test333";
    }
    //String gg = await MySharedPref().getData(AppSettings.fcmId);
    String FCMToken = await MySharedPref().getData(AppSettings.fcmId);
    print("fcmId :  " + FCMToken);
    

    /*  var parentDetails = {
      "name": "SITI KHALIDA",
      "category": "PARENT",
      "desc": "",
      "balance": "50",
      "familtid": "FMY0001",
      "email": "calms.rnd@gmail.com",
      "image": "https://randomuser.me/api/portraits/women/11.jpg"
    };
    MySharedPref()
        .saveData(jsonEncode(parentDetails), AppSettings.parentDetails); */

    Map<String, dynamic> qrJson = jsonDecode(decryptdata);
    /*  {
"Data":{
"Authorize":{"AuMAppDevSeqId":"0L1yJ8WKCFjSLrRTvuyOCQ==","AuDeviceUID":"","Token":"","AuRefUserSeqId":""},
"ParamData":{"MAppDevSeqId":"453","DeviceUID":"1234567890","DevicePlatform":"And","DeviceDetails":"verison 9","FCMToken":"","ForceToUpdate":"0"}
}
} */
    var paramData = {
      "MAppDevSeqId": qrJson['MAppSeqId'],
      "DeviceUID": DeviceId,
      "DevicePlatform": DevicePlatform,
      "DeviceDetails": "1",
      "FCMToken": FCMToken.isEmpty ? qrJson['MAppSeqId'] : FCMToken,
      "ForceToUpdate": 0
    };
    var paramData1 = {
      "MAppDevSeqId": qrJson['MAppSeqId'],
      "DeviceUID": DeviceId,
      "DevicePlatform": DevicePlatform,
      "DeviceDetails": "1",
      "FCMToken": FCMToken.isEmpty ? qrJson['MAppSeqId'] : FCMToken,
      "ForceToUpdate": 1
    };
    print('paramData -- ' + paramData.toString());
    print('paramData1 -- ' + paramData1.toString());
    String encParamData = CryptoEncryption(dataResponseModel['SecureKey'])
        .encryptMyData(json.encode(paramData));
    String encParamData1 = CryptoEncryption(dataResponseModel['SecureKey'])
        .encryptMyData(json.encode(paramData1));
    var payload = {
      "Authorize": {
        "AuMAppDevSeqId": qrJson['MAppSeqId'],
        "AuDeviceUID": "",
        "Token": "",
        "AuRefUserSeqId": ""
      },
      "ParamData": encParamData
    };
    var payload1 = {
      "Authorize": {
        "AuMAppDevSeqId": qrJson['MAppSeqId'],
        "AuDeviceUID": "",
        "Token": "",
        "AuRefUserSeqId": ""
      },
      "ParamData": encParamData1
    };
    print("Payload == > " + payload.toString());
    String encData = CryptoEncryption(AppSettings.commonCryptoKey)
        .encryptMyData(json.encode(payload));
    String encData1 = CryptoEncryption(AppSettings.commonCryptoKey)
        .encryptMyData(json.encode(payload1));
    var data = {"Data": encData};
    var forceToUpdateData = {"Data": encData1};
    /* var data = {
      'MAppDevSeqId': qrJson['MAppSeqId'],
      'RefUserSeqId': dataResponseModel['RefUserSeqId'],
      'DeviceUID': DeviceId,
      'DevicePlatform': DevicePlatform,
      'DeviceDetails': "",
      'FCMToken': FCMToken,
      'ForceToUpdate': 0
    };
    print(data); */
    Future<Map<String, dynamic>> res = RestApiProvider().postNewData(data,
        qrJson["ApiUrl"], AppSettings.RegisterParentApp, context, true, false);
    res
        .then((value) => {
              successResponse(value, decryptdata, forceToUpdateData,
                  qrJson["ApiUrl"], dataResponseModel, DeviceId)
            })
        .onError((error, stackTrace) => {responseError(error)});
  }

  responseError(error) {
    print(error.toString());
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
      //resetQRData();
    }, null, "Ok", "");
  }

  successResponse(Map<String, dynamic> res, decryptdata, forceToUpdateData,
      ApiUrl, profileData, DeviceId) {
    print(res);
    if (res['Table'][0]['code'] == 10) {
      MyCustomAlertDialog().showToast(context, res['Table'][0]['description']);
      MySharedPref()
          .saveData(jsonEncode(profileData), AppSettings.Sp_ProfileData);
      MySharedPref().saveData(decryptdata, AppSettings.Sp_QrCodeData);
      MySharedPref().saveData(
          AppSettings.appType_Notification, AppSettings.Sp_Key_AppType);
      MySharedPref().saveData(res['Table1'][0]['Token'], AppSettings.Sp_Token);
      MySharedPref().saveBooleanData(false, AppSettings.Sp_App_Verified);
      MySharedPref().saveData(DeviceId, AppSettings.Sp_DeviceId);
      /* Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CreatePin())); */
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreen()));
    } else if (res['Table'][0]['code'] == 40) {
      showAlert(context, res['Table'][0]['description'], forceToUpdateData,
          decryptdata, ApiUrl, profileData, DeviceId);
    } else if (res['Table'][0]['code'] == 21) {
      MyCustomAlertDialog().showCustomAlert(
          context,
          "Notification",
          'It appears that the app does not have full permission for notifications. Please close the app, relaunch it, and try again. If the issue persists, please uninstall and reinstall the app, then try once more',
          true, () {
        Navigator.pop(context);
        //resetQRData();
      }, null, "Ok", "");
    }else{
      MyCustomAlertDialog().showCustomAlert(
          context,
          "Notification",
          'Something went wrong, please try again later',
          true, () {
        Navigator.pop(context);
        //resetQRData();
      }, null, "Ok", "");
    }
  }

  showAlert(BuildContext buildContext, msg, forceToUpdateData, decryptdata,
      ApiUrl, profileData, DeviceId) {
    MyCustomAlertDialog()
        .showRegisterNewDeviceAlert(buildContext, "Alert!!", msg, false, () {
      print("reg==============");
      Future<Map<String, dynamic>> res = RestApiProvider().postNewData(
          forceToUpdateData,
          ApiUrl,
          AppSettings.RegisterParentApp,
          context,
          false,
          false);
      res
          .then((value) => {
                successResponse(value, decryptdata, forceToUpdateData, ApiUrl,
                    profileData, DeviceId),
              })
          .onError((error, stackTrace) => {responseError(error)});
    }, () {
      Navigator.pop(context);
    });
  }
}
