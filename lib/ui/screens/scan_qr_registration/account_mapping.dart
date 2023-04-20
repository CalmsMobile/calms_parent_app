import 'dart:convert';

import 'package:calms_parent/common/app_settings.dart';
import 'package:calms_parent/common/my_shared_pref.dart';
import 'package:calms_parent/common/util/linked_checkbox.dart';
import 'package:calms_parent/ui/screens/pin_lock/pin_lock.dart';
import 'package:flutter/material.dart';

class AccountMapping extends StatefulWidget {
  const AccountMapping(
      {Key? key, required this.dataResponseModel, required this.baseUrl})
      : super(key: key);
  // Declare a field that holds the Todo.
  final Map<String, dynamic> dataResponseModel;
  final String baseUrl;
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
      // appBar: AppBar(title: Text("Register")),
      backgroundColor: Colors.white,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/app_bg_main.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 45,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:
                  NetworkImage(widget.dataResponseModel["BranchImg"]!),
              radius: 52,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.dataResponseModel["BranchName"]!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(20),
              child: Container(
                // width: double.infinity,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(60),
                //     border: Border.all(color: Colors.black12, width: 0)),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(widget.baseUrl +
                          widget.dataResponseModel["UserImgPath"]!),
                      radius: 32,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.dataResponseModel["Name"]!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "MEMBER ID",
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.card_membership,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            text: widget.dataResponseModel["MemberId"] !=
                                        null &&
                                    widget.dataResponseModel["MemberId"] != ""
                                ? " " + widget.dataResponseModel["MemberId"]!
                                : " --",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "EMAIL",
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.email,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            text: widget.dataResponseModel["Email"] != null &&
                                    widget.dataResponseModel["Email"] != ""
                                ? " " + widget.dataResponseModel["Email"]!
                                : " --",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "CONTACT",
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.contact_page,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            text: widget.dataResponseModel["ContactNo"] !=
                                        null &&
                                    widget.dataResponseModel["ContactNo"] != ""
                                ? " " + widget.dataResponseModel["ContactNo"]!
                                : " --",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "RELATIONSHIP",
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.person_outline,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            text: widget.dataResponseModel["RelationShip"] !=
                                        null &&
                                    widget.dataResponseModel["RelationShip"] !=
                                        ""
                                ? " " +
                                    widget.dataResponseModel["RelationShip"]!
                                : " --",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            LinkedLabelCheckbox(
                label: 'Yes, above details are correct.',
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
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
              height: 40,
            ),
            SizedBox(
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
                      ? _onButtonPressed
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    textStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0)),
                  ),
                ) /* FlatButton(
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
                    ? _onButtonPressed
                    : null,
                textColor: Colors.white,
                color: Colors.blueAccent,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 1.0,
                        color: Colors.grey),
                    borderRadius: new BorderRadius.circular(20.0)),
              ), */
                ),
          ]),
        ),
      ),
    );
  }

  _onButtonPressed() {
    print("object");
    var parentDetails = {
      "name": "SITI KHALIDA",
      "category": "PARENT",
      "desc": "",
      "balance": "50",
      "familtid": "FMY0001",
      "email": "calms.rnd@gmail.com",
      "image": "https://randomuser.me/api/portraits/women/11.jpg"
    };
    MySharedPref()
        .saveData(jsonEncode(parentDetails), AppSettings.parentDetails);
    MySharedPref()
        .saveData(AppSettings.appType_Notification, AppSettings.Sp_Key_AppType);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PinLock()));
  }
}
