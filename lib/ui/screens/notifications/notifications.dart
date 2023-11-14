import 'dart:convert';
import 'package:calms_parent_latest/ui/screens/notifications/notification-view/notification-view.dart';
import 'package:expendable_fab/expendable_fab.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../../common/util/common_funtions.dart';
import '../home/Home.dart';
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
import '../../../common/widgets/common.dart';
import '../settings/app_settings.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key, this.NotifyOnly, this.categoryList});
  final NotifyOnly;
  final categoryList;

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  late ScrollController controller;
  var profileData_;
  var studentImageURL;
  int startPosition = 0;
  var notificationList = [];
  var notificationListClone = [];
  List familyList = [];
  // List<Map> NotificationCategoryList = [];
  int senderIndex = 1;
  late String profileData;
  late String qrData;
  late Map<String, dynamic> qrJson;
  late String apiURL;
  late String imgBaseUrl;
  var appBarTitle = "All Notifications";
  int selectedtypeIndex = 0;
  bool filtered = false;
  var filterMemberImagePath = null;
  late TabController _tabController;
  late DateTime date;

  @override
  void initState() {
    super.initState();
    initValues();
    _tabController =
        new TabController(vsync: this, length: widget.categoryList.length);
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
    _tabController.dispose();
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

      print("++++++++" + selectedtypeIndex.toString());
      //appBarTitle = categoryName;
      //selectedtypeIndex = selectedtypeIndex;
      CommonUtil().getCtegoryFilterNotification(
          context,
          apiURL,
          startPosition,
          profileData,
          qrData,
          widget.categoryList[selectedtypeIndex]["notificationtype"],
          "");
    }
  }

  deleteNotification(var notifiation, BuildContext context) {
    var payLoad = {
      //"Authorize": {"AuMAppDevSeqId": qrJson['MAppSeqId'], "AuDeviceUID": ""},
      "PNHistory": notifiation["PNHistory"]
    };
    print(payLoad);
    Future<Map<String, dynamic>> res = RestApiProvider().postData(payLoad,
        apiURL, AppSettings.RemovePushNotification, context, false, false);
    res
        .then((value) =>
            {handleApiResponse(value, notifiation["PNHistory"], context)})
        .onError((error, stackTrace) => {handleApiError(error)});
  }

  handleApiResponse(response, pnHistory,BuildContext context) {
    if (response.containsKey("Code") && response['Code'] > 10) {
      print("Error in response");
      MyCustomAlertDialog().showCustomAlert(
          context, "Notification", response["Description"], true, () {
        Navigator.pop(context);
      }, null, "Ok", "");
    } else {
      print("removeNotification");
      MyCustomAlertDialog().showToast(context, "Notification deleted successfully");
      context.read<MySettingsListener>().removeNotification(pnHistory);
    }
  }

  handleApiError(error) {
    print(error);
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
    }, null, "Ok", "");
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
    return MaterialApp(
      home: DefaultTabController(
          length: widget.categoryList.length,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2000, 1, 1),
                    maxTime: DateTime.now(),
                    theme: DatePickerTheme(
                        headerColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.white,
                        itemStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        cancelStyle:
                            TextStyle(color: Colors.white, fontSize: 16),
                        doneStyle:
                            TextStyle(color: Colors.white, fontSize: 16)),
                    onChanged: (date) {}, onConfirm: (date) {
                  print('confirm $date');
                  setState(() {
                    appBarTitle = DateFormat("dd-MM-yyyy").format(date);
                    filtered = true;
                  });

                  CommonUtil().getCtegoryFilterNotification(
                      context,
                      apiURL,
                      startPosition,
                      profileData,
                      qrData,
                      widget.categoryList[selectedtypeIndex]
                          ['notificationtype'],
                      DateFormat("yyyy-MM-dd").format(date));
                }, currentTime: DateTime.now(), locale: LocaleType.en)
              },
              child: const Icon(Icons.calendar_month),
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              
                bottom: TabBar(

                    onTap: (value) {
                      setState(() {
                        appBarTitle = "All Notifications";
                        filtered = false;
                        String categoryName =
                            widget.categoryList[value]["category"];
                        int id = widget.categoryList[value]["notificationtype"];
                        print("++++++++" + id.toString());
                        //appBarTitle = categoryName;
                        selectedtypeIndex = value;
                        CommonUtil().getCtegoryFilterNotification(context,
                            apiURL, startPosition, profileData, qrData, id, "");
                      });
                    },
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      for (int i = 0; i < widget.categoryList.length; i++)
                        Tab(text: widget.categoryList[i]['category'])
                    ],
                    controller: _tabController),
                toolbarHeight: 70,
                elevation: 0,
                backgroundColor: Colors.white,
                //titleSpacing: -5,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!widget.NotifyOnly)
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
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
                  if (filtered)
                    IconButton(
                      icon: Icon(Icons.close_sharp, color: Colors.black),
                      onPressed: () {
                        //Navigator.pop(context);
                        setState(() {
                          appBarTitle = "All Notifications";
                          filtered = false;
                        });
                        CommonUtil().getCtegoryFilterNotification(
                            context,
                            apiURL,
                            startPosition,
                            profileData,
                            qrData,
                            widget.categoryList[selectedtypeIndex]
                                ['notificationtype'],
                            "");
                      },
                    ),
                  // Navigate to the Search Screen
                  /* Container(
                    height: 30,
                    width: 80,
                    //margin: EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: ListTile(
                            horizontalTitleGap: 2,
                            contentPadding: EdgeInsets.zero,
                            onTap: () => {
                              openMemberBottomSheet(
                                  context,
                                  context
                                      .read<MySettingsListener>()
                                      .notificationMembersList,
                                  imgBaseUrl, (index) {
                                Navigator.pop(context);
                                senderIndex = index;
                                setState(() {
                                  filterMemberImagePath = null;
                                  if (context
                                              .read<MySettingsListener>()
                                              .notificationMembersList[
                                          senderIndex]['UserImgPath'] !=
                                      null) {
                                    filterMemberImagePath = imgBaseUrl +
                                        context
                                                .read<MySettingsListener>()
                                                .notificationMembersList[
                                            senderIndex]['UserImgPath'];
                                  }
                                  String name = context
                                          .read<MySettingsListener>()
                                          .notificationMembersList[senderIndex]
                                      ["Name"];
                                  appBarTitle = name;
                                  CommonUtil().getMemberFilterNotification(
                                      context,
                                      apiURL,
                                      startPosition,
                                      profileData,
                                      qrData,
                                      context
                                              .read<MySettingsListener>()
                                              .notificationMembersList[
                                          senderIndex]['UserSeqId']);
                                });
                              })
                            },
                            trailing: filterMemberImagePath != null
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(filterMemberImagePath),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.blue[700],
                                    child: Text(
                                      CommonFunctions.getInitials(appBarTitle),
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.white,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
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
                                        .notificationCategoryList[index]
                                    ["category"];
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
                                    id,
                                    "");
                              });
                            })),
                  ),
                 */
                ]),
            extendBodyBehindAppBar: false,
            body: new TabBarView(
              controller: _tabController,
              children: List.generate(
                widget.categoryList.length,
                (index) => Container(
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
                ),
              ),
            ),
          )),
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

  Widget _makeCard(
      context, int index1, List notificationList, List categoryList) {
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
                /*  MyCustomAlertDialog().showCustomAlert(context, "Notification",
                    "Do you want to delete this notification?", false, () {
                  
                  deleteNotification(notificationList[index1],context);
                }, () {
                  debugPrint("deleteNotification");
                  Navigator.pop(context);
                 
                }, "Yes", "No");
 */
                showDeleteAlert(
                    context,
                    "Alert!",
                    "Do you want to delete this notification?",
                    false,
                    notificationList[index1]);
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
                  print("object");
                  /* Navigator.pushNamed(
                    context,
                    '/NotificationView',
                    arguments: {
                      'pos': index1,
                      'passData': jsonEncode(notificationList[index1]),
                      'category': getCategoryById(
                          notificationList[index1]["NotificationType"]),
                      'imgBaseUrl': imgBaseUrl
                    },
                  ); */
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationView(
                          pos: index1,
                          passData: notificationList[index1],
                          category: getCategoryById(
                              notificationList[index1]["NotificationType"]),
                          imgBaseUrl: imgBaseUrl,
                          apiURL: apiURL),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 2,
                  child: ClipPath(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      //height: 80,
                      child: Column(
                        children: [
                          Container(
                              //height: 60,
                              child: ListTile(
                            leading: SizedBox(
                                width: 45,
                                height: 45,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      notificationList[index1]["ImgPathUrl"] !=
                                              ""
                                          ? imgBaseUrl +
                                              notificationList[index1]
                                                  ["ImgPathUrl"]
                                          : AppSettings.avatarPlaceholder),
                                  radius: 20,
                                )),
                            title: Text(
                              notificationList[index1]["HtmlContent"],
                              style: TextStyle(
                                  fontWeight: notificationList[index1]["IsRead"]
                                      ? FontWeight.normal
                                      : FontWeight.bold),
                            ),
                            /* subtitle:Text(
                                    getCategoryById(notificationList[index1]
                                        ["HtmlContent"]),
                                    style: TextStyle(
                                        fontWeight: notificationList[index1]
                                                ["IsRead"]
                                            ? FontWeight.normal
                                            : FontWeight.bold),
                                  ) */
                          )),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 0, right: 10),
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
                                          fontWeight: notificationList[index1]
                                                  ["IsRead"]
                                              ? FontWeight.normal
                                              : FontWeight.bold,
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
                                          fontWeight: notificationList[index1]
                                                  ["IsRead"]
                                              ? FontWeight.normal
                                              : FontWeight.bold,
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

  void showDeleteAlert(BuildContext buildContext, String title,
      String description, bool isError, var notification) {
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
                          fontSize: 18, color: Color.fromARGB(255, 0, 92, 3)),
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
                            "Yes",
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
                        this.deleteNotification(notification, buildContext);
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
                            "No",
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
}
