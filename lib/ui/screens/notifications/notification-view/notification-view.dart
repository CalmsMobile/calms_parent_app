import 'dart:convert';

import '/common/alert_dialog.dart';
import '/common/app_settings.dart';
import '/common/date_util.dart';
import '/common/listener/settings_listener.dart';
import '/provider/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
                  "Details",
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
              Color.fromARGB(255, 246, 249, 254),
              Color.fromARGB(255, 230, 231, 239),
            ],
          )),
          child:
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
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
                                              BorderRadius.circular(60))),
                                  child: Image.network(
                                      passData["ImgPathUrl"] != null
                                          ? imgBaseUrl + passData["ImgPathUrl"]
                                          : AppSettings.avatarPlaceholder),
                                ),
                              ),
                              title: Text(
                                category,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: HtmlWidget(
                                    "${passData["HtmlContent"]}") 
                                ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 5, right: 10),
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: passData["CreatedOn"] != null
                                            ? DateUtil()
                                                .convertStringFromDateformat(
                                                    passData['CreatedOn'],
                                                    "dd-MM-yyyy")
                                            : "",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                      TextSpan(
                                        text: "  ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      TextSpan(
                                        text: passData["CreatedOn"] != null
                                            ? DateUtil()
                                                .convertStringFromDateformat(
                                                    passData['CreatedOn'],
                                                    "hh:mm a")
                                            : "",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
        ));
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
