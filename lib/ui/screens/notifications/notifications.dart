import 'dart:convert';
import 'package:expendable_fab/expendable_fab.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '/common/alert_dialog.dart';
import '/common/app_settings.dart';
import '/common/common_api.dart';
import '/common/date_util.dart';
import '/common/listener/settings_listener.dart';
import '/common/my_shared_pref.dart';
import '/common/HexColor.dart';
import '/provider/rest_api.dart';
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
  late Map<String, dynamic> qrJson;
  late String apiURL;
  late String imgBaseUrl;
  var appBarTitle = "All Notifications";

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
    profileData = await MySharedPref().getData(AppSettings.Sp_ProfileData);

    if (profileData != "") {
      //var profileData = jsonDecode(profileData);
      //profileData_ = jsonDecode(profileData["Table1"][0]["SettingDetail"]);
      //print(profileData_);

      qrData = await MySharedPref().getData(AppSettings.Sp_QrCodeData);
      qrJson = jsonDecode(qrData);
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
    }
  }

  deleteNotification(var notifiation) {
    var payLoad = {
      "Authorize": {"AuMAppDevSeqId": qrJson['MAppSeqId'], "AuDeviceUID": ""},
      "PNHistory": notifiation["PNHistory"]
    };
    print(payLoad);
    Future<Map<String, dynamic>> res = RestApiProvider().postData(payLoad,
        apiURL, AppSettings.RemovePushNotification, context, true, true);
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

    return Scaffold(
        body: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 70,
              elevation: 0,
              backgroundColor: Colors.transparent,
              //titleSpacing: -5,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
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
                            String name = context
                                .read<MySettingsListener>()
                                .notificationMembersList[senderIndex]["Name"];
                            appBarTitle = name;
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
                           
                          });
                        });
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(filterMemberImagePath),
                          radius: 20,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      appBarTitle,
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
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                      child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/ico_filter.png")),
                      onTap: () => openFilterCategoryBottomSheet(
                              context,
                              context
                                  .read<MySettingsListener>()
                                  .notificationCategoryList, (index) {
                            Navigator.pop(context);
                            //senderIndex = index;
                            setState(() {
                              String categoryName = context
                                  .read<MySettingsListener>()
                                  .notificationCategoryList[index]["category"];
                              int id = context
                                      .read<MySettingsListener>()
                                      .notificationCategoryList[index]
                                  ["notificationtype"];
                              print("++++++++" + id.toString());
                              appBarTitle = categoryName;
                              CommonUtil().getCtegoryFilterNotification(
                                  context,
                                  apiURL,
                                  startPosition,
                                  profileData,
                                  qrData,
                                  id);
                            });
                          })),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: InkWell(
                      child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/ico_setting.png")),
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppSettingsPage(),
                            ),
                          )),
                ),
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
              child: SafeArea(
                child: ScrollEdgeListener(
                  // 400 is the default size of the Placeholder widget.
                  edgeOffset: 100,
                  listener: () {
                    debugPrint('listener called');
                    startPosition = context
                        .read<MySettingsListener>()
                        .notificationList
                        .length;
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
                                    itemBuilder:
                                        (BuildContext context, int index1) {
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
              /* floatingActionButton: FloatingActionButton(
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
       */
            )));
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 2,
                  child: ClipPath(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      //height: 80,
                      child: Column(
                        children: [
                          Container(
                            //height: 60,
                            child: ListTile(
                              // horizontalTitleGap: 0,
                              //minVerticalPadding: -4,
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
                              subtitle: HtmlWidget(getContent(notificationList[
                                      index1][
                                  "HtmlContent"])) /* Text(
                                  "${notificationList[index1]["HtmlContent"]}") */
                              ,
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
                              margin: EdgeInsets.only(bottom: 0, right: 10),
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
                                                  "dd-MM-yyyy")
                                          : "",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 45, 112, 237)),
                                    ),
                                    TextSpan(
                                      text: "  ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 45, 112, 237)),
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
                                          color: Color.fromARGB(
                                              255, 45, 112, 237)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      /* decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: notificationList[index1]["IsRead"]
                                      ? Colors.white
                                      : Colors.red,
                                  width: 5))), */
                    ),
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getContent(listContent) {
    /*  print("length="+listContent.toString().length.toString());
    if(listContent.toString().length>100)
    return listContent.toString().substring(0,99);
    else */
    return listContent;
  }
}
