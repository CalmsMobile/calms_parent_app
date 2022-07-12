import 'package:calms_parent/common/app_settings.dart';
import 'package:calms_parent/common/my_shared_pref.dart';
import 'package:calms_parent/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinLock extends StatefulWidget {
  const PinLock({Key? key}) : super(key: key);

  @override
  State<PinLock> createState() => _PinLockState();
}

class _PinLockState extends State<PinLock> {
  TextEditingController pinController = TextEditingController();
  TextEditingController confirmpinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Create your passcode",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Please create your 6 digit passcode to secure your app account.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter new PIN",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(top: 5.0, left: 0, right: 25),
                  child: TextField(
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    controller: pinController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) {
                      if (pinController.text.length > 6)
                        pinController.text = pinController.text.substring(0, 6);
                      pinController.selection = TextSelection.fromPosition(
                          TextPosition(offset: pinController.text.length));

                      setState(() {});
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: '',
                        labelText: '',
                        focusColor: Colors.black,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        prefixText: ' ',
                        suffixText: '',
                        errorText: validatePassword(pinController.text),
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm new PIN",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(top: 5.0, left: 0, right: 25),
                  child: TextField(
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
                            confirmpinController.text.substring(0, 6);
                      setState(() {});
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: '',
                        labelText: '',
                        focusColor: Colors.black,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        prefixText: ' ',
                        suffixText: '',
                        errorText:
                            validateConfirmPassword(confirmpinController.text),
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 220,
                height: 45,
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Create passcode",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                  onPressed: pinController.text.length == 6 &&
                          confirmpinController.text == pinController.text
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
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                  text: "Skip",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      MySharedPref().saveData("", AppSettings.parentAppPIN);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  _onButtonPressed() {
    MySharedPref().saveData(pinController.text, AppSettings.parentAppPIN);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyApp()));
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
