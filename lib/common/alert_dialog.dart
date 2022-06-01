import 'package:calms_parent/common/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyCustomAlertDialog {
  bool isShowingAlready = false;
  void showCustomAlert(BuildContext context, String title, String description,
      bool isError, _okPress, _cancelPress) {
    if (isShowingAlready) {
      return;
    }
    isShowingAlready = true;
    Alert(
      context: context,
      type: isError ? AlertType.error : AlertType.warning,
      title: title,
      desc: description,
      onWillPopActive: true,
      // closeFunction: _cancelPress != null ? _cancelPress : _okPress,
      buttons: [
        if (_cancelPress != null)
          DialogButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => _cancelPress(),
            width: 120,
            color: HexColor("#ef8e87"),
          ),
        if (_okPress != null)
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => _okPress(),
            width: 120,
            color: HexColor("#ef8e87"),
          )
      ],
    ).show().whenComplete(() => {isShowingAlready = false});
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

  void showToast(BuildContext context, String message) {
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
