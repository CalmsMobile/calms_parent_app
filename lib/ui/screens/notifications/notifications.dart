import 'dart:convert';
import 'package:provider/provider.dart';

import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/app_settings.dart';
import 'package:calms_parent/common/common_api.dart';
import 'package:calms_parent/common/date_util.dart';
import 'package:calms_parent/common/listener/settings_listener.dart';
import 'package:calms_parent/common/my_shared_pref.dart';
import 'package:calms_parent/provider/rest_api.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late ScrollController controller;
  var appSettings_;
  var studentImageURL;
  int startPosition = 0;
  var notificationList = [];
  var notificationListClone = [];
  @override
  void initState() {
    super.initState();
    initValues();
  }

  @override
  void dispose() {
    // controller.removeListener(_scrollListener);
    super.dispose();
  }

  Future<void> initValues() async {
    String appSettings =
        await MySharedPref().getData(AppSettings.parentAppSettings);

    if (appSettings != "") {
      var appSett = jsonDecode(appSettings);
      appSettings_ = jsonDecode(appSett["Table1"][0]["SettingDetail"]);
      print(appSettings_);

      String qrData = await MySharedPref().getData(AppSettings.qrCodeData);
      Map<String, dynamic> qrJson = jsonDecode(qrData);
      String apiURL = qrJson['ApiUrl'];
      // controller = ScrollController()..addListener(_scrollListener);
      setState(() {
        studentImageURL =
            apiURL.split("/api")[0] + AppSettings.studentImageHandler;
        print(studentImageURL);
      });

      CommonUtil().getAllNotification(context, startPosition);
    } else {
      List list = [
        {
          "Data": {
            "Table": [
              {"Code": 10}
            ],
            "Table1": [
              {"TotalRowsFound": 18}
            ],
            "Table2": [
              {
                "PNHistory": 659.0,
                "RefPushSeqId": 672.0,
                "RefUserSeqId": null,
                "IsRead": false,
                "isDeleted": false,
                "StudentId": null,
                "RefDriverSeqId": 101.0,
                "PushSeqId": 672.0,
                "Title": "General notification",
                "HtmlContent": "Hi parent, tomorrow will be holiday",
                "image": "https://randomuser.me/api/portraits/women/11.jpg",
                "NotificationType": 10,
                "CreatedBy": 100043.0,
                "CreatedOn": "2022-04-25T11:54:46.483",
                "MAppId": null,
                "ReaderName": null,
                "IsAlarmStopped": false,
                "RowRank": 1
              },
              {
                "PNHistory": 655.0,
                "RefPushSeqId": 668.0,
                "RefUserSeqId": null,
                "IsRead": false,
                "isDeleted": false,
                "StudentId": null,
                "RefDriverSeqId": 101.0,
                "PushSeqId": 668.0,
                "image": "https://randomuser.me/api/portraits/men/1.jpg",
                "Title": "Purchase transaction",
                "HtmlContent": "Your product has been purchased for 5.00 MYR",
                "NotificationType": 10,
                "CreatedBy": 100043.0,
                "CreatedOn": "2022-04-15T20:57:01.23",
                "MAppId": null,
                "ReaderName": null,
                "IsAlarmStopped": false,
                "RowRank": 2
              },
              {
                "PNHistory": 652.0,
                "RefPushSeqId": 668.0,
                "RefUserSeqId": null,
                "IsRead": false,
                "isDeleted": false,
                "StudentId": null,
                "RefDriverSeqId": 101.0,
                "PushSeqId": 668.0,
                "image": "https://randomuser.me/api/portraits/men/2.jpg",
                "Title": "Wallet transaction",
                "HtmlContent": "Your product has been purchased for 5.00 MYR",
                "NotificationType": 10,
                "CreatedBy": 100043.0,
                "CreatedOn": "2022-04-15T20:57:01.23",
                "MAppId": null,
                "ReaderName": null,
                "IsAlarmStopped": false,
                "RowRank": 2
              },
              {
                "PNHistory": 652.0,
                "RefPushSeqId": 668.0,
                "RefUserSeqId": null,
                "IsRead": false,
                "isDeleted": false,
                "StudentId": null,
                "RefDriverSeqId": 101.0,
                "PushSeqId": 668.0,
                "image": "https://randomuser.me/api/portraits/women/8.jpg",
                "Title": "Low balance alert",
                "HtmlContent": "Your balance is very low. please topup",
                "NotificationType": 10,
                "CreatedBy": 100043.0,
                "CreatedOn": "2022-04-15T20:57:01.23",
                "MAppId": null,
                "ReaderName": null,
                "IsAlarmStopped": false,
                "RowRank": 2
              },
              {
                "PNHistory": 659.0,
                "RefPushSeqId": 672.0,
                "RefUserSeqId": null,
                "IsRead": false,
                "isDeleted": false,
                "StudentId": null,
                "RefDriverSeqId": 101.0,
                "PushSeqId": 672.0,
                "Title": "General notification",
                "image": "https://randomuser.me/api/portraits/men/1.jpg",
                "HtmlContent": "Hi parent, tomorrow will be holiday",
                "NotificationType": 10,
                "CreatedBy": 100043.0,
                "CreatedOn": "2022-04-25T11:54:46.483",
                "MAppId": null,
                "ReaderName": null,
                "IsAlarmStopped": false,
                "RowRank": 1
              },
              {
                "PNHistory": 655.0,
                "RefPushSeqId": 668.0,
                "RefUserSeqId": null,
                "IsRead": false,
                "isDeleted": false,
                "StudentId": null,
                "RefDriverSeqId": 101.0,
                "PushSeqId": 668.0,
                "image": "https://randomuser.me/api/portraits/men/2.jpg",
                "Title": "Purchase transaction",
                "HtmlContent": "Your product has been purchased for 5.00 MYR",
                "NotificationType": 10,
                "CreatedBy": 100043.0,
                "CreatedOn": "2022-04-15T20:57:01.23",
                "MAppId": null,
                "ReaderName": null,
                "IsAlarmStopped": false,
                "RowRank": 2
              },
              {
                "PNHistory": 652.0,
                "RefPushSeqId": 668.0,
                "RefUserSeqId": null,
                "IsRead": false,
                "isDeleted": false,
                "StudentId": null,
                "RefDriverSeqId": 101.0,
                "PushSeqId": 668.0,
                "image": "https://randomuser.me/api/portraits/men/6.jpg",
                "Title": "Wallet transaction",
                "HtmlContent": "Your product has been purchased for 5.00 MYR",
                "NotificationType": 10,
                "CreatedBy": 100043.0,
                "CreatedOn": "2022-04-15T20:57:01.23",
                "MAppId": null,
                "ReaderName": null,
                "IsAlarmStopped": false,
                "RowRank": 2
              },
              {
                "PNHistory": 652.0,
                "RefPushSeqId": 668.0,
                "RefUserSeqId": null,
                "IsRead": false,
                "isDeleted": false,
                "StudentId": null,
                "RefDriverSeqId": 101.0,
                "PushSeqId": 668.0,
                "Title": "Low balance alert",
                "image": "https://randomuser.me/api/portraits/men/1.jpg",
                "HtmlContent": "Your balance is very low. please topup",
                "NotificationType": 10,
                "CreatedBy": 100043.0,
                "CreatedOn": "2022-04-15T20:57:01.23",
                "MAppId": null,
                "ReaderName": null,
                "IsAlarmStopped": false,
                "RowRank": 2
              }
            ]
          }
        }
      ];
      context
          .read<MySettingsListener>()
          .updateNotifiactionList(list[0]["Data"]["Table2"], startPosition);
    }
  }

  deleteNotification(var notifiation) {
    var data = {
      "PNHistory": notifiation["PNHistory"],
    };

    Future<Map<String, dynamic>> res = RestApiProvider().postMethod(
        data, '', AppSettings.deleteNotification, context, true, true);
    res
        .then((value) => {handleApiResponse(value, notifiation["PNHistory"])})
        .onError((error, stackTrace) => {handleApiError(error)});
  }

  handleApiResponse(response, pnHistory) {
    if (response.containsKey("Code") && response['Code'] > 10) {
      print("Error in response");
      MyCustomAlertDialog().showCustomAlert(
          context, "Notification", response["Description"], true, () {
        Navigator.pop(context);
      }, null);
    } else {
      MyCustomAlertDialog()
          .showToast(context, "Notification deleted successfully");
      context.read<MySettingsListener>().removeNotification(pnHistory);
    }
  }

  handleApiError(error) {
    print(error);
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
    }, null);
  }

  @override
  Widget build(BuildContext context) {
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
                  "Notifications",
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
        child: ScrollEdgeListener(
          // 400 is the default size of the Placeholder widget.
          edgeOffset: 100,
          listener: () {
            debugPrint('listener called');
            startPosition =
                context.read<MySettingsListener>().notificationList.length;
            // CommonUtil().getAllNotification(context, startPosition);
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Consumer<MySettingsListener>(
                          builder: (context, data, settingsDta) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.notificationList.length,
                            itemBuilder: (BuildContext context, int index1) {
                              return _makeCard(
                                  context, index1, data.notificationList);
                            });
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _makeCard(BuildContext context, int index1, List notificationList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Dismissible(
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                MyCustomAlertDialog().showCustomAlert(context, "Notification",
                    "Do you want to delete this notification?", false, () {
                  Navigator.pop(context);
                  deleteNotification(notificationList[index1]);
                }, () {
                  Navigator.pop(context);
                });

                return false;
              }
              return null;
            },
            key: Key("${notificationList[index1]["PNHistory"].toString()}"),
            direction: DismissDirection.endToStart,
            child: Container(
              // color: HexColor("#eaedf6"),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/NotificationView',
                    arguments: {
                      'pos': index1,
                      'passData': jsonEncode(notificationList[index1])
                    },
                  );
                },
                child: Card(
                  elevation: 2,
                  child: ClipPath(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      height: 80,
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            child: ListTile(
                              // horizontalTitleGap: 0,
                              minVerticalPadding: -4,
                              trailing: SizedBox(
                                width: 20,
                                height: 20,
                                child: ClipPath(
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Image.asset(notificationList[index1]
                                            ["IsRead"]
                                        ? "assets/images/read_message.png"
                                        : "assets/images/unread_message.png")),
                              ),
                              leading: SizedBox(
                                width: 45,
                                height: 45,
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Image.network(
                                      notificationList[index1]["image"]),
                                ),
                              ),
                              title: Text(
                                "${notificationList[index1]["Title"]}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  "${notificationList[index1]["HtmlContent"]}"),
                              // Html(
                              //   data:
                              //       "${notificationList[index1]["HtmlContent"]}",
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
                            ),
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
                                      text: notificationList[index1]
                                                  ["CreatedOn"] !=
                                              null
                                          ? DateUtil()
                                              .convertStringFromDateformat(
                                                  notificationList[index1]
                                                      ['CreatedOn'],
                                                  "dd MMM")
                                          : "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " at ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: notificationList[index1]
                                                  ["CreatedOn"] !=
                                              null
                                          ? DateUtil()
                                              .convertStringFromDateformat(
                                                  notificationList[index1]
                                                      ['CreatedOn'],
                                                  "hh:mm a")
                                          : "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                  color: notificationList[index1]["IsRead"]
                                      ? Colors.white
                                      : Colors.red,
                                  width: 5))),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3))),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
