import 'dart:convert';

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
      required this.DeviceId})
      : super(key: key);
  // Declare a field that holds the Todo.
  final Map<String, dynamic> dataResponseModel;
  final String baseUrl;
  final String decryptdata;
  final String? DeviceId;
  @override
  State<AccountMapping> createState() => _AccountMappingState();
}

class _AccountMappingState extends State<AccountMapping> {
  bool isCheckBox1Selected = false;
  bool isCheckBox2Selected = false;
  bool isDisableButton = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widget.dataResponseModel['Name'] == " +
        widget.dataResponseModel['Name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
                        // width: double.infinity,
                        margin: EdgeInsets.all(10),
                        //padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(60),
                        //     border: Border.all(color: Colors.black12, width: 0)),
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                widget.dataResponseModel["BranchImg"]!),
                            radius: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.dataResponseModel["BranchName"]!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                          widget.baseUrl +
                                              widget.dataResponseModel[
                                                  "UserImgPath"]!),
                                      radius: 40,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      widget.dataResponseModel["Name"]!,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
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
                            isDisableTextClick: false,
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
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
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
                                      context,
                                      widget.dataResponseModel,
                                      widget.decryptdata,
                                      widget.DeviceId);
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 6, 105, 199),
                            textStyle: TextStyle(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0)),
                          ),
                        ),
                      )),
                ]),
              ]))))
    ]));
  }

  _onButtonPressed(context, dataResponseModel, decryptdata, DeviceId) async {
    print(dataResponseModel);
    print(decryptdata);
    print("DeviceId " + DeviceId);
    if (kDebugMode) {
      DeviceId = "Test12345";
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
    var data = {
      'MAppDevSeqId': qrJson['MAppSeqId'],
      'RefUserSeqId': dataResponseModel['RefUserSeqId'],
      'DeviceUID': DeviceId,
      'DevicePlatform': "Android",
      'DeviceDetails': "",
      'FCMToken': FCMToken,
      'ForceToUpdate': 0
    };
    print(data);
    Future<Map<String, dynamic>> res = RestApiProvider().postData(data,
        qrJson["ApiUrl"], AppSettings.RegisterParentApp, context, true, false);
    res
        .then((value) => {
              successResponse(
                  value, decryptdata, data, qrJson["ApiUrl"], dataResponseModel)
            })
        .onError((error, stackTrace) => {responseError(error)});
  }

  responseError(error) {
    print(error.toString());
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
      //resetQRData();
    }, null);
  }

  successResponse(
      Map<String, dynamic> res, decryptdata, inputData, ApiUrl, profileData) {
    print(res);
    if (res['Table'][0]['code'] == 10) {
      MyCustomAlertDialog().showToast(context, res['Table'][0]['description']);
      MySharedPref().saveData(jsonEncode(profileData), AppSettings.profileData);
      MySharedPref().saveData(decryptdata, AppSettings.qrCodeData);
      MySharedPref().saveData(
          AppSettings.appType_Notification, AppSettings.Sp_Key_AppType);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PinLock()));
    } else if (res['Table'][0]['code'] == 40) {
      showAlert(context, res['Table'][0]['description'], inputData, decryptdata,
          ApiUrl, profileData);
    }
  }

  showAlert(BuildContext buildContext, msg, inputData, decryptdata, ApiUrl,
      profileData) {
    MyCustomAlertDialog().showCustomAlert(context, "Confirmation", msg, false,
        () {
      Navigator.pop(context);
      //MyCustomAlertDialog().showToast(context, "");
      //Navigator.of(context).pop();
      inputData['ForceToUpdate'] = 1;
      Future<Map<String, dynamic>> res = RestApiProvider().postData(inputData,
          ApiUrl, AppSettings.RegisterParentApp, context, true, false);
      res
          .then((value) => {
                successResponse(
                    value, decryptdata, inputData, ApiUrl, profileData)
              })
          .onError((error, stackTrace) => {responseError(error)});
    }, () {
      Navigator.pop(context);
    });
  }
}
