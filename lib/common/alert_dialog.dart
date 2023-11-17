import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'widgets/common.dart';

class MyCustomAlertDialog {
  bool isShowingAlready = false;
  void showCustomAlert(
      BuildContext buildContext,
      String title,
      String description,
      bool isError,
      _okPress,
      _cancelPress,
      okBtnText,
      cancelBtnText) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60.0))),
      context: buildContext,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: false,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getBottomSheetActionBar(context, title, false, Colors.white),
            Container(
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                          fontSize: 18, color:isError?Colors.red: Color.fromARGB(255, 0, 0, 0)),
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            if (_okPress != null)
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              okBtnText,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold),
                            ),
                            //Icon(Icons.payment)
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          _okPress();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 6, 105, 199),
                          textStyle: TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0)),
                        ),
                      ))),
            if (_cancelPress != null)
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              cancelBtnText,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold),
                            ),
                            //Icon(Icons.payment)
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          _cancelPress();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 6, 105, 199),
                          textStyle: TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0)),
                        ),
                      ))),
          ],
        );
      },
    );
  }

  void showRegisterNewDeviceAlert(BuildContext buildContext, String title,
      String description, bool isError, _registerDevice, _cancel) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60.0))),
      context: buildContext,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: false,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getBottomSheetActionBar(context, title, false, Colors.white),
            Container(
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(10),
                child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Register this device",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                          //Icon(Icons.payment)
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _registerDevice();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 6, 105, 199),
                        textStyle: TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0)),
                      ),
                    ))),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(10),
                child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                          //Icon(Icons.payment)
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _cancel();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 6, 105, 199),
                        textStyle: TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0)),
                      ),
                    ))),
          ],
        );
      },
    );
  }

  void showVerificationAlert(BuildContext buildContext, String title,
      String description, bool isError, _verifyAgain, _reSend) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60.0))),
      context: buildContext,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: false,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getBottomSheetActionBar(context, title, false, Colors.white),
            Container(
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(10),
                child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Verify now",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                          //Icon(Icons.payment)
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _verifyAgain();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 6, 105, 199),
                        textStyle: TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0)),
                      ),
                    ))),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(10),
                child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Resend verification email",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                          //Icon(Icons.payment)
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _reSend();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 6, 105, 199),
                        textStyle: TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0)),
                      ),
                    ))),
          ],
        );
      },
    );
  }
 
  void showCustomInputAlert(BuildContext context, String title,
      TextEditingController searchController, _okPress, _cancelPress) {
    Alert(
        context: context,
        title: title,
        desc: "",
        content: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              textInputAction: TextInputAction.done,
              decoration: new InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFef8e87), width: 2.0),
                ),
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                  color: Colors.black,
                )),
                labelStyle: TextStyle(color: Color(0xFFef8e87)),
                hintText: 'Type here to search...',
                labelText: 'Search',
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Color(0xFFef8e87),
                ),
                prefixText: ' ',
                suffixText: '',
                suffixStyle: const TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: _cancelPress,
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: _okPress,
            color: Colors.black,
            child: Text(
              "Search",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  void showToast(context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }


}
