import 'dart:convert';
import 'package:expendable_fab/expendable_fab.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/app_settings.dart';
import 'package:calms_parent/common/common_api.dart';
import 'package:calms_parent/common/date_util.dart';
import 'package:calms_parent/common/listener/settings_listener.dart';
import 'package:calms_parent/common/my_shared_pref.dart';
import 'package:calms_parent/common/HexColor.dart';
import 'package:calms_parent/provider/rest_api.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

import '../../../common/json_responses.dart';
import '../../../common/widgets/select_member.dart';
import '../settings/app_settings.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late ScrollController controller;
  var profileData_;
  var studentImageURL;
  int startPosition = 0;
  var notificationList = [];
  var notificationListClone = [];
  //List<Map> familyList = [];
  // List<Map> NotificationCategoryList = [];
  int senderIndex = 1;
  late String profileData;
  late String qrData;
  late String apiURL;
  late String imgBaseUrl;
  var appBarTitle = "Notifications";

  var filterMemberImagePath =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  @override
  void initState() {
    super.initState();
    initValues();
    //familyList = JsonResponses.familyList;
    //NotificationCategoryList = JsonResponses.notificationCategoryList;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //LocalNotificationService.display(message);
      print(message.toString());
      if (kDebugMode) {
        print('Handling a foreground message: ${message.messageId}');
        print('Message data: ${message.data}');
        print('Message notification: ${message.notification?.title}');
        print('Message notification: ${message.notification?.body}');
      }
      initValues();
      //_messageStreamController.sink.add(message);
    });
  }

  @override
  void dispose() {
    // controller.removeListener(_scrollListener);
    super.dispose();
  }

  Future<void> initValues() async {
    profileData = await MySharedPref().getData(AppSettings.profileData);

    if (profileData != "") {
      //var profileData = jsonDecode(profileData);
      //profileData_ = jsonDecode(profileData["Table1"][0]["SettingDetail"]);
      //print(profileData_);

      qrData = await MySharedPref().getData(AppSettings.qrCodeData);
      Map<String, dynamic> qrJson = jsonDecode(qrData);
      apiURL = qrJson['ApiUrl'];
      imgBaseUrl = apiURL.replaceAll("/api/", "/FS/");

      // controller = ScrollController()..addListener(_scrollListener);
      setState(() {
        studentImageURL =
            apiURL.split("/api")[0] + AppSettings.studentImageHandler;
        print(studentImageURL);
      });

      CommonUtil().getAllNotification(
          context, apiURL, startPosition, profileData, qrData);
    } else {
      /* List list = [
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
      context.read<MySettingsListener>().updateNotifiactionList(
          list[0]["Data"]["Table2"],
          startPosition,
          familyList,
          NotificationCategoryList); */
    }
  }

  deleteNotification(var notifiation) {
    var data = {
      "PNHistory": notifiation["PNHistory"],
    };

    Future<Map<String, dynamic>> res = RestApiProvider().postMethod(
        data, '', 'AppSettings.deleteNotification', context, true, true);
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

  late DateTime _selectedDate;
  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(2022),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //var familyList = context.read<MySettingsListener>().notificationMembersList;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
        elevation: 0,
        backgroundColor: HexColor("#cfe2f3"),
        //titleSpacing: -5,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          appBarTitle,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: Padding(
            padding: const EdgeInsets.all(2),
            child: InkWell(
                onTap: () {
                  openMemberBottomSheet(
                      context,
                      context
                          .read<MySettingsListener>()
                          .notificationMembersList,
                      imgBaseUrl, (index) {
                    Navigator.pop(context);
                    senderIndex = index;
                    setState(() {
                      if (context
                                  .read<MySettingsListener>()
                                  .notificationMembersList[senderIndex]
                              ['UserImgPath'] !=
                          null) {
                        filterMemberImagePath = imgBaseUrl +
                            context
                                    .read<MySettingsListener>()
                                    .notificationMembersList[senderIndex]
                                ['UserImgPath'];
                      }

                      CommonUtil().getMemberFilterNotification(
                          context,
                          apiURL,
                          startPosition,
                          profileData,
                          qrData,
                          context
                                  .read<MySettingsListener>()
                                  .notificationMembersList[senderIndex]
                              ['UserSeqId']);
                      // print(context.read<MySettingsListener>().notificationMembersList[senderIndex]['UserImgPath']);
                    });
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(filterMemberImagePath),
                        fit: BoxFit.fill),
                  ),
                ))),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.black54,
                ),
                //tooltip: 'Open shopping cart',
                onPressed: () {
                  // handle the press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppSettingsPage(),
                    ),
                  );
                },
              ))
        ],
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
                                  context,
                                  index1,
                                  data.notificationList,
                                  context
                                      .read<MySettingsListener>()
                                      .notificationCategoryList);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => openFilterCategoryBottomSheet(context,
            context.read<MySettingsListener>().notificationCategoryList,
            (index) {
          Navigator.pop(context);
          //senderIndex = index;
          setState(() {
            String categoryName = context
                .read<MySettingsListener>()
                .notificationCategoryList[index]["category"];
            int id = context
                .read<MySettingsListener>()
                .notificationCategoryList[index]["notificationtype"];
            print("++++++++" + id.toString());

            appBarTitle = categoryName;

            CommonUtil().getCtegoryFilterNotification(
                context, apiURL, startPosition, profileData, qrData, id);
          });
        }),
        child: const Icon(Icons.filter_alt),
      ),
      /* floatingActionButton: ExpendableFab(
        distance: 75.0,
        children: [
          ActionButton(
            onPressed: () =>
                openMemberBottomSheet(context, familyList, (index) {
              Navigator.pop(context);
              senderIndex = index;
              setState(() {});
            }),
            icon: const Icon(Icons.person_2_rounded),
          ),
          ActionButton(
            onPressed: () => openFilterCategoryBottomSheet(context, NotificationCategoryList, (index) {
              Navigator.pop(context);
              //senderIndex = index;
              setState(() {
                appBarTitle = NotificationCategoryList[index]["Name"];
              });
            }),
            icon: const Icon(Icons.category_rounded),
          ),
        ],
      ),
     */
    );
  }

  void openFilterCategoryBottomSheet(
      BuildContext buildContext, NotificationCategoryList, callback) {
    print("NotificationCategoryList" + NotificationCategoryList[0]["category"]);
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppBar(
                  title: Text(
                    "Filter Category",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  elevation: 1,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close_sharp, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: NotificationCategoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: <Widget>[
                        new Divider(
                          height: 0.1,
                        ),
                        ListTile(
                          title: new Text(
                              NotificationCategoryList[index]["category"]),
                          onTap: () {
                            callback(index);
                          },
                        ),
                      ]);
                    })
              ],
            ),
          );
        });
  }

  Widget _makeCard(BuildContext context, int index1, List notificationList,
      List categoryList) {
    String getCategoryById(NotificationType) {
      List data = categoryList
          .where((element) => element['notificationtype'] == NotificationType)
          .toList();
      //print(data[0]['category']);
      return data[0]['category'];
    }

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
            key: Key("${notificationList[index1]["PushSeqId"].toString()}"),
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
                      'passData': jsonEncode(notificationList[index1]),
                      'category': getCategoryById(
                          notificationList[index1]["NotificationType"]),
                      'imgBaseUrl': imgBaseUrl
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
                              /* trailing: SizedBox(
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
                              ), */
                              leading: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        notificationList[index1]
                                                    ["ImgPathUrl"] !=
                                                ""
                                            ? imgBaseUrl +
                                                notificationList[index1]
                                                    ["ImgPathUrl"]
                                            : AppSettings.avatarPlaceholder),
                                    radius: 20,
                                  ) /* ClipPath(
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  child: Image.network(notificationList[index1]
                                              ["ImgPathUrl"] !=
                                          null
                                      ? imgBaseUrl +
                                          notificationList[index1]["ImgPathUrl"]
                                      : AppSettings.avatarPlaceholder),
                                ), */
                                  ),
                              title: Text(
                                getCategoryById(notificationList[index1]
                                    ["NotificationType"]),
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
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: " at ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
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
                                  color: notificationList[index1]["IsRead"]
                                      ? Colors.white
                                      : Colors.red,
                                  width: 5))),
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
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
