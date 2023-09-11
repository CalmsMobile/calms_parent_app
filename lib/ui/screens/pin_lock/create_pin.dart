import 'package:flutter/foundation.dart';

import '/common/app_settings.dart';
import '/common/my_shared_pref.dart';
import '/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../notifications/notifications.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  TextEditingController pinController = TextEditingController();
  TextEditingController confirmpinController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    initValues();
    super.initState();
  }

  initValues() async {
    String auth =
        await MySharedPref().getData(AppSettings.Sp_Payload_Authorize);
    String apiUrl = await MySharedPref().getData(AppSettings.Sp_Api_Url);
    
   kDebugMode? _onButtonPressed():(){};
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
                  "Create Your Passcode",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
              // Your widgets here
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/ico_option.png")),
            )
          ],
        ),
        extendBodyBehindAppBar: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 246, 249, 254),
              Color.fromARGB(255, 230, 231, 239),
            ],
          )),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Image(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/passcode.png")),
                      ),
                      Padding(
                          padding: EdgeInsets.all(60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Please create your 6 digit code to secure your wallet account.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Enter new PIN",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              TextField(
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                controller: pinController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (text) {
                                  if (pinController.text.length > 6)
                                    pinController.text =
                                        pinController.text.substring(0, 6);
                                  pinController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: pinController.text.length));

                                  setState(() {});
                                },
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: '',
                                    labelText: '',
                                    focusColor: Colors.black,
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    suffixText: '',
                                    errorText:
                                        validatePassword(pinController.text),
                                    suffixStyle:
                                        const TextStyle(color: Colors.green)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Confirm new PIN",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              TextField(
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                controller: confirmpinController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (text) {
                                  if (confirmpinController.text.length > 6)
                                    confirmpinController.text =
                                        confirmpinController.text
                                            .substring(0, 6);
                                  setState(() {});
                                },
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: '',
                                    labelText: '',
                                    focusColor: Colors.black,
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    prefixText: ' ',
                                    suffixText: '',
                                    errorText: validateConfirmPassword(
                                        confirmpinController.text),
                                    suffixStyle:
                                        const TextStyle(color: Colors.green)),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(
                            width: 150,
                            height: 45,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Create",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.arrow_forward)
                                ],
                              ),
                              onPressed: pinController.text.length == 6 &&
                                      confirmpinController.text ==
                                          pinController.text
                                  ? _onButtonPressed
                                  : null,
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                shadowColor: Colors.black,
                                backgroundColor:
                                    Color.fromARGB(255, 6, 105, 199),
                                textStyle: TextStyle(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0)),
                              ),
                            )),
                      )
                    ],
                  ))
            ]),
          ),
        ),
      )
    ]));
  }

  _onButtonPressed() async {
    if(kDebugMode)
    MySharedPref().saveData("123456", AppSettings.Sp_AppPIN);
    else
    MySharedPref().saveData(pinController.text, AppSettings.Sp_AppPIN);
    bool appVerified =
        await MySharedPref().getBooleanData(AppSettings.Sp_App_Verified);
    if (appVerified) {
     
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreen()));
    }
  }

  validatePassword(pinText) {
    if (pinText == null || pinText.length == 0) {
      return null;
    } else if (pinText.length < 6) {
      return "new PIN should be 6 digit";
    }
    return null;
  }

  validateConfirmPassword(pinText) {
    if (pinText == null || pinText.length == 0) {
      return null;
    } else if (pinText.length < 6) {
      return "Confirm PIN should be 6 digit";
    } else if (confirmpinController.text != pinController.text) {
      return "Confirm PIN should match new PIN";
    }
    return null;
  }
}
