import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../../common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/app_settings.dart';
import '/common/date_util.dart';
import '/common/listener/settings_listener.dart';
import '/provider/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class NotificationView extends StatefulWidget {
  const NotificationView(
      {super.key,
      this.pos,
      this.passData,
      this.category,
      this.imgBaseUrl,
      this.apiURL});
  final pos;
  final passData;
  final category;
  final imgBaseUrl;
  final apiURL;
  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.pos);
    print(widget.passData);
    print(widget.category);
    print(widget.imgBaseUrl);
    print(widget.apiURL);
    super.initState();
    updateReadStatus(widget.passData, context, widget.pos, widget.apiURL);
  }

  @override
  Widget build(BuildContext context) {
    /*  final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    //print(arguments['passData']);
    Map<String, dynamic> passData = jsonDecode(arguments['passData']);
    int pos = arguments['pos'];
    String category = arguments['category'];
    String imgBaseUrl = arguments['imgBaseUrl']; */

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: HexColor("#023047"),
          //titleSpacing: -5,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/ico_back.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Message",
                  style: TextStyle(
                      color: Colors.white,
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
              Color.fromARGB(255, 246, 249, 254),
              Color.fromARGB(255, 230, 231, 239),
            ],
          )),
          child: SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.all(10),
            //padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Container(
                // color: HexColor("#eaedf6"),
                width: double.infinity,
                //margin: EdgeInsets.only(top: 20),
                child: ClipPath(
                  child: Container(
                    //padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.passData["HtmlContent"],
                              style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
                            )),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5, right: 10),
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: widget.passData["CreatedOn"] != null
                                        ? DateUtil()
                                            .convertStringFromDateformat(
                                                widget.passData['CreatedOn'],
                                                "dd-MM-yyyy")
                                        : "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: HexColor("#023047")),
                                  ),
                                  TextSpan(
                                    text: "  ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: HexColor("#023047")),
                                  ),
                                  TextSpan(
                                    text: widget.passData["CreatedOn"] != null
                                        ? DateUtil()
                                            .convertStringFromDateformat(
                                                widget.passData['CreatedOn'],
                                                "hh:mm a")
                                        : "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: HexColor("#023047")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*  decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: widget.passData["IsRead"]
                                      ? Colors.white
                                      : Colors.white,
                                  width: 5))), */
                  ),
                  clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3))),
                ),
              ),
            ]),
          )),
        ));
  }
}

Future<void> updateReadStatus(
    passData, BuildContext context, int pos, apiURL) async {
  print("updateReadStatus");
  if (!passData["IsRead"]) {
    var data = {
      "PNHistory": passData["PNHistory"],
    };

    Future<Map<String, dynamic>> res = RestApiProvider().postData(data, apiURL,
        AppSettings.UpdateReadNotificationStatus, context, false, false);
    res
        .then((value) => {handleApiResponse(value, context, pos)})
        .onError((error, stackTrace) => {handleApiError(error, context)});
  }
}

handleApiResponse(response, BuildContext context, int pos) {
  if (response.containsKey("Code") && response['Code'] > 10) {
    print("Error in response");
    MyCustomAlertDialog().showCustomAlert(
        context, "Notification", response["Description"], true, () {
      Navigator.pop(context);
    }, null, "Ok", "");
  } else {
    context.read<MySettingsListener>().updateNotifiactionItem(pos);
  }
}

handleApiError(error, BuildContext context) {
  print(error);
  MyCustomAlertDialog()
      .showCustomAlert(context, "Notification", error.toString(), true, () {
    Navigator.pop(context);
  }, null, "Ok", "");
}
