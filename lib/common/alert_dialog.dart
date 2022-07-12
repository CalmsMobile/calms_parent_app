import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyCustomAlertDialog {
  bool isShowingAlready = false;
  void showCustomAlert(BuildContext buildContext, String title,
      String description, bool isError, _okPress, _cancelPress) {
    // if (isShowingAlready) {
    //   return;
    // }
    // isShowingAlready = true;
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60.0))),
      context: buildContext,
      enableDrag: false,
      isScrollControlled: false,
      builder: (context) {
        return SizedBox(
          height: _okPress == null ? 100 : 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getBottomSheetActionBar(context, title, true),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 0),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "$description",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            height: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (_okPress != null)
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        _okPress();
                      },
                      child: Text(
                        "Proceed",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.pinkAccent,
                    ),
                  ),
                )
            ],
          ),
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
