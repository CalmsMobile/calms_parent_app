import 'dart:convert';

import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/app_settings.dart';
import 'package:calms_parent/common/date_util.dart';
import 'package:calms_parent/common/listener/settings_listener.dart';
import 'package:calms_parent/provider/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    print(arguments['passData']);
    Map<String, dynamic> passData = jsonDecode(arguments['passData']);
    int pos = arguments['pos'];
    String category = arguments['category'];
    String imgBaseUrl = arguments['imgBaseUrl'];
    // updateReadStatus(passData, context, pos);
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Align(
            alignment: Alignment(-1.2, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notification View",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: passData["CreatedOn"] != null
                                ? DateUtil().convertStringFromDateformat(
                                    passData['CreatedOn'], "dd MMM yyyy")
                                : "",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          TextSpan(
                            text: "   at  ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: passData["CreatedOn"] != null
                                ? DateUtil().convertStringFromDateformat(
                                    passData['CreatedOn'], "hh:mm a")
                                : "",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  // color: HexColor("#eaedf6"),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  child: Card(
                    elevation: 2,
                    child: ClipPath(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: SizedBox(
                                width: 45,
                                height: 45,
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Image.network(passData["ImgPathUrl"] != null?imgBaseUrl+passData["ImgPathUrl"]:AppSettings.avatarPlaceholder),
                                ),
                              ),
                              title: Text(category,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${passData["HtmlContent"]}",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        // Html(
                        //   data: "${passData["HtmlContent"]}",
                        //   style: {
                        //     "table": Style(
                        //       backgroundColor:
                        //           Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                        //     ),
                        //     "tr": Style(
                        //       border: Border(
                        //           bottom: BorderSide(color: Colors.grey)),
                        //     ),
                        //     "th": Style(
                        //       padding: EdgeInsets.all(6),
                        //       backgroundColor: Colors.grey,
                        //     ),
                        //     "td": Style(
                        //       padding: EdgeInsets.all(6),
                        //       alignment: Alignment.topLeft,
                        //     ),
                        //     'h5': Style(
                        //         maxLines: 2,
                        //         textOverflow: TextOverflow.ellipsis),
                        //   },
                        // ),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: passData["IsRead"]
                                        ? Colors.white
                                        : Colors.white,
                                    width: 5))),
                      ),
                      clipper: ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3))),
                    ),
                  ),
                ),
              ]),
            )),
          ],
        ),
      ),
    );
  }

  void updateReadStatus(
      Map<String, dynamic> passData, BuildContext context, int pos) {
    if (!passData["IsRead"]) {
      var data = {
        "PNHistory": passData["PNHistory"],
      };

      Future<Map<String, dynamic>> res = RestApiProvider().postMethod(data, '',
          'AppSettings.updateReadNotificationStatus', context, false, true);
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
      }, null);
    } else {
      context.read<MySettingsListener>().updateNotifiactionItem(pos);
    }
  }

  handleApiError(error, BuildContext context) {
    print(error);
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
    }, null);
  }
}
