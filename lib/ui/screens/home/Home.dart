import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:calms_parent_latest/common/app_settings.dart';
import 'package:calms_parent_latest/common/common_api.dart';
import 'package:calms_parent_latest/common/my_shared_pref.dart';
import 'package:calms_parent_latest/ui/screens/notifications/notification-view/notification-view.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/listener/settings_listener.dart';
import '../../../common/util/common_funtions.dart';
import '../../../common/widgets/no_data_card.dart';
import '../widgets/DashBordMenuList.dart';
import '../widgets/RecentTransactionListView.dart';
import '/common/HexColor.dart';
import '/common/json_responses.dart';
import '/model/HolidayModel.dart';
import '/model/_AppointmentDataSource.dart';
import '/model/moduleModel.dart';
import '/ui/screens/calendar/calendar_page.dart';
import '/ui/screens/cart/cart.dart';
import '/ui/screens/notifications/notifications.dart';
import '/ui/screens/settings/app_settings.dart';
import '/ui/screens/widgets/HolidayCalendar.dart';
import '../widgets/TransactionSummery.dart';
import '/ui/screens/widgets/StoreItemListView.dart';
import '/ui/screens/widgets/TopupListView.dart';
import '/ui/screens/widgets/UpcomingActivityListView.dart';
import '/ui/screens/widgets/outstandingView.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  //HomePage(this.familyPos, this.familyList, this.pageSwiped);
  HomePage();

 final List<Map> storeItem = JsonResponses.storeItem;
  final List<Map> upcomingActivities = [
    {
      "acitivity_type": "EDU00001_EVENT_EVNT-1001",
      "_rev": "15-5f8395a893f523756908f0d48b073a03",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "receipt_no": "RCPT001-12111",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1001",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "School Music Festival 2019",
      "price": "100",
      "description":
          "46 PCS Color Set has a lot of fun features to keep your baby engaged. It has 42 pieces It contain 12 water color, 6 sketch color, a sharpner, an eraser, 10 crayons color, 8 oil pastel colors, a glue, a paper clip and a box. Very nice product for your kid It improves creative power of your dear ones. Improves visual skills, creative skills and coordination skills of your child Designed keeping safety of your child on priority basis Always choose Happiesta for your kids Happiness",
      "yeargroup": ["YEAR 4", "YEAR 1", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEh7oY40Jmp5SSbhKf-CEef3PiPaPXMn8GA&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/07/31",
      "modifieddate": "2019/09/22 04:45:04 PM",
      "attachmentlist": [
        {"id": "0", "type": "application/pdf", "name": "slip_AB489665.pdf"},
        {"id": "1", "type": "image/png", "name": "dollar-icon.png"}
      ]
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1003",
      "receipt_no": "RCPT001-12111",
      "_rev": "6-3ab176b0ae96039e73b0aabc39d56221",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1003",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Dancing Competition 2019",
      "price": "20",
      "description":
          "As dance teams head into competition season, when the pressure and excitement are at an all time high, everyone could use a little extra motivation and encouragement!  To inspire your team, here are our 10 favorite motivational quotes for dancers",
      "yeargroup": ["YEAR 4", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMc_d-ufS996dH12Hw1y421z3a8fVa26eEg&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1004",
      "receipt_no": "RCPT001-12111",
      "_rev": "16-72f60d2c9fa59caeab2b71da69342780",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1004",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Sing Loud",
      "price": "50",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg-kqVxSbcllyyg6BPkuUZGB9ib4Yo5WHJEg&usqp=CAU",
      "description":
          "I think music in itself is healing. It’s an explosive expression of humanity. It’s something we are all touched by. No matter what culture we’re from, everyone loves music.",
      "yeargroup": ["YEAR 4", "YEAR 3", "YEAR 1"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "startdate": "2019/07/02",
      "enddate": "2019/08/01",
      "modifieddate": "2019/08/04 09:50:10 PM"
    },
    {
      "acitivity_type": "EDU00001_EVENT_EVNT-1001",
      "receipt_no": "RCPT001-12111",
      "_rev": "15-5f8395a893f523756908f0d48b073a03",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1001",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "School Music Festival 2019",
      "price": "100",
      "description": "Music is life",
      "yeargroup": ["YEAR 4", "YEAR 1", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEh7oY40Jmp5SSbhKf-CEef3PiPaPXMn8GA&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/07/31",
      "category": "School Trip",
      "modifieddate": "2019/09/22 04:45:04 PM",
      "attachmentlist": [
        {"id": "0", "type": "application/pdf", "name": "slip_AB489665.pdf"},
        {"id": "1", "type": "image/png", "name": "dollar-icon.png"}
      ]
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1003",
      "receipt_no": "RCPT001-12111",
      "_rev": "6-3ab176b0ae96039e73b0aabc39d56221",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1003",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Dancing Competition 2019",
      "price": "20",
      "description":
          "As dance teams head into competition season, when the pressure and excitement are at an all time high, everyone could use a little extra motivation and encouragement!  To inspire your team, here are our 10 favorite motivational quotes for dancers",
      "yeargroup": ["YEAR 4", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMc_d-ufS996dH12Hw1y421z3a8fVa26eEg&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    }
  ];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool topupCollapse = true;
  bool purchaseCollapse = true;
  bool storeCollapse = true;
  bool activitiesCollapse = true;
  CalendarController _controller = CalendarController();
  late AnimationController controller;
  String imgBaseUrl = "";
  var profileData = {};
  List<Appointment> _appointmentDetails = <Appointment>[];

  var AppTheme_;

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      setState(() {
        _appointmentDetails =
            calendarTapDetails.appointments!.cast<Appointment>();
      });
    }
  }

  Future<void> getData(BuildContext context) async {
    imgBaseUrl = await MySharedPref().getData(AppSettings.Sp_Img_Base_Url);
    String profile = await MySharedPref().getData(AppSettings.Sp_ProfileData);
    profileData = jsonDecode(profile);
    print("profileData");
    print(profileData);
    CommonUtil().getEntryToDashboard(context, profileData['RefUserSeqId']);
  }
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
    getTheme();
    getData(context);
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.familyPos);
    // print(widget.familyList);
   
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: HexColor(AppTheme_['SecondaryBgColor']),
          //titleSpacing: -5,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: profileData['BranchImg'] != null
                ? CircleAvatar(
                    backgroundImage: MemoryImage(
                        CommonFunctions.getUnit8bytesFromB64(
                            profileData["BranchImg"])),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      CommonFunctions.getInitials(profileData['BranchName'])
                          .toUpperCase(),
                      style: TextStyle(
                          fontSize: 22.0,
                          color: HexColor(AppTheme_['SecondaryFrColor']),
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "",
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
            Container(
              height: 30,
              //width: 100,
              margin: EdgeInsets.only(right: 10),
              child: Row(children: [
                Consumer<MySettingsListener>(
                    builder: (context, data, settingsDta) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications(
                                      NotifyOnly: profileData['NotifyOnly'],
                                      categoryList:
                                          data.NotificationCategoryList,
                                      name: 'NotificationDashboard'
                                    )));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: HexColor(AppTheme_['SecondaryFrColor']),
                                width: 2),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(
                                Icons.notifications_outlined,
                                color: HexColor(AppTheme_['SecondaryFrColor']),
                                size: 30,
                              ))));
                }),
                Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CartPage(imgBaseUrl, profileData,AppTheme_),
                            ),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      HexColor(AppTheme_['SecondaryFrColor']),
                                  width: 2),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color:
                                      HexColor(AppTheme_['SecondaryFrColor']),
                                  size: 30,
                                )))),
                    Consumer<MySettingsListener>(
                        builder: (context, data, settingsDta) {
                      return Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            data.cartList != []
                                ? data.cartList.length.toString()
                                : "0",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      );
                    })
                  ],
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppSettingsPage(),
                        ),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: HexColor(AppTheme_['SecondaryFrColor']),
                              width: 2),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(
                              Icons.settings_outlined,
                              color: HexColor(AppTheme_['SecondaryFrColor']),
                              size: 30,
                            )))),
              ]),
            ),
          ],
        ),
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: false,
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                HexColor(AppTheme_['PrimaryBgColor']),
                HexColor(AppTheme_['PrimaryBgColor']),
              ],
            )),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          //height: 220,
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(left: 0, right: 0),
                          child: Consumer<MySettingsListener>(
                              builder: (context, data, settingsDta) {
                            if (data.familyList.isNotEmpty) {
                              return Column(children: [
                                SizedBox(
                                  height: 20,
                                ),
                                CarouselSlider(
                                  items: data.familyList
                                      .map((item) => InkWell(
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  if (data.familyList[data
                                                          .familyPos]['Name'] ==
                                                      item["Name"])
                                                    /* Image.asset(
                                                    "assets/images/swipe_left.png",
                                                    width: 25,
                                                  ) */

                                                    data.familyPos != 0
                                                        ? Icon(
                                                            Icons
                                                                .keyboard_double_arrow_left,
                                                            color: HexColor(
                                                                AppTheme_[
                                                                    'SecondaryBgColor']))
                                                        : SizedBox(
                                                            width: 24,
                                                          ),
                                                  Container(
                                                    width: (data.familyList[data
                                                                    .familyPos]
                                                                ['Name'] ==
                                                            item["Name"])
                                                        ? 90
                                                        : 60,
                                                    height: (data.familyList[data
                                                                    .familyPos]
                                                                ['Name'] ==
                                                            item["Name"])
                                                        ? 90
                                                        : 60,
                                                    child:
                                                        item['UserImgPath'] !=
                                                                null
                                                            ? CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        imgBaseUrl +
                                                                            item["UserImgPath"]),
                                                              )
                                                            : CircleAvatar(
                                                                backgroundColor:
                                                                    HexColor(
                                                                        AppTheme_[
                                                                            'PrimaryBgColor']),
                                                                child: Text(
                                                                  CommonFunctions
                                                                      .getInitials(
                                                                          item[
                                                                              'Name']),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          28.0,
                                                                      color: HexColor(
                                                                          AppTheme_[
                                                                              'SecondaryBgColor']),
                                                                      letterSpacing:
                                                                          2.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900),
                                                                ),
                                                              ),
                                                    decoration: BoxDecoration(
                                                      //DecprationImage
                                                      border: Border.all(
                                                          color: HexColor(AppTheme_[
                                                              'SecondaryBgColor']),
                                                          width: 4.0,
                                                          style: BorderStyle
                                                              .solid), //Border.all

                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                60.0),
                                                        topRight:
                                                            Radius.circular(
                                                                60.0),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                60.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                60.0),
                                                      ),
                                                      //BorderRadius.only
                                                      /************************************/
                                                      /* The BoxShadow widget  is here */
                                                      /************************************/
                                                    ),
                                                  ),
                                                  if (data.familyList[data
                                                          .familyPos]['Name'] ==
                                                      item["Name"])
                                                    /* Image.asset(
                                                    "assets/images/swipe_right.png",
                                                    width: 25,
                                                  ) */
                                                    data.familyPos !=
                                                            data.familyList
                                                                    .length -
                                                                1
                                                        ? Icon(
                                                            Icons
                                                                .keyboard_double_arrow_right,
                                                            size: 25,
                                                            color: HexColor(
                                                                AppTheme_[
                                                                    'SecondaryBgColor']))
                                                        : SizedBox(
                                                            width: 24,
                                                          ),
                                                ],
                                              ),
                                            ),
                                            onTap: () => {
                                              Navigator.of(context).pushNamed(
                                                  '/ProfileMain',
                                                  arguments: {
                                                    "profileData": item,
                                                    "CurrencyCode": profileData[
                                                        'CurrencyCode'],
                                                    "imgBaseUrl": imgBaseUrl,
                                                    "AppTheme_": AppTheme_,
                                                  })
                                            },
                                          ))
                                      .toList(),

                                  //Slider Container properties
                                  options: CarouselOptions(
                                      height: 100.0,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.scale,
                                      enlargeCenterPage: true,
                                      autoPlay: false,
                                      aspectRatio: 16 / 9,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enableInfiniteScroll: false,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      viewportFraction: 0.35,
                                      onPageChanged: (index, reason) {
                                        data.pageSwiped(index);
                                        CommonUtil().getDashboard(
                                            context,
                                            data.familyList[index]['UserSeqId'],
                                            data.familyList[index]
                                                ['RefBranchSeqId'],
                                            data.NotificationCategoryList);
                                      },
                                      initialPage: data.familyPos),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data.familyList[data.familyPos]['Name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color:
                                          HexColor(AppTheme_['PrimaryFrColor']),
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Wallet Ballance",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color:
                                          HexColor(AppTheme_['PrimaryFrColor']),
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '${profileData['CurrencyCode']} ${double.parse(data.familyList[data.familyPos]['Balance'].toString()).toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: HexColor(AppSettings.colorCurrencyCode),
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]);
                            } else {
                              return SizedBox(height: 100);
                            }
                          }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10,
                          shadowColor: Colors.black,
                          borderOnForeground: true,
                          margin: EdgeInsets.only(
                              top: 5, bottom: 20, left: 20, right: 20),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            height: 80.0,
                            child: Consumer<MySettingsListener>(
                                builder: (context, data, settingsDta) {
                              if (data.dashboardMenuList != []) {
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.dashboardMenuList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return menuList(
                                          context,
                                          index,
                                          data.dashboardMenuList,
                                          data.familyList,
                                          imgBaseUrl,
                                          profileData,
                                          data.familyListWithoutParent,
                                          AppTheme_,data.NotificationCategoryList);
                                    });
                              } else {
                                return SizedBox();
                              }
                            }),
                          ),
                        ),
                    
                        //RECENT TRANSACTION
                        Consumer<MySettingsListener>(
                            builder: (context, data, settingsDta) {
                          return Card(
                              /*  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ), */
                              elevation: 10,
                              shadowColor: Colors.black,
                              borderOnForeground: true,
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text("Recent Transaction"),
                                    trailing: Text("(Last 30 days)"),
                                    tileColor:
                                        HexColor(AppTheme_['SecondaryBgColor']),
                                    textColor:
                                        HexColor(AppTheme_['SecondaryFrColor']),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (data.dashboardRecentActivityList
                                            .isNotEmpty)
                                          RecentTransactionListView(
                                              data.dashboardRecentActivityList,
                                              profileData['CurrencyCode'])
                                        else
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        top: 10.0,
                                                        bottom: 10.0),
                                                    margin: EdgeInsets.zero,
                                                    height: 100,
                                                    color: Colors.transparent,
                                                    child: Image.asset(AppSettings
                                                        .imgAssetNoTxn)),
                                                /* Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 10),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ), */
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        }),
                        //TRANSACTION SUMMERY
                        Consumer<MySettingsListener>(
                            builder: (context, data, settingsDta) {
                         
                            return Card(
                                /*  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ), */
                                elevation: 10,
                                shadowColor: Colors.black,
                                borderOnForeground: true,
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text("Transaction Summery"),
                                      trailing: Text("(Last 30 days)"),
                                      tileColor: HexColor(
                                          AppTheme_['SecondaryBgColor']),
                                      textColor: HexColor(
                                          AppTheme_['SecondaryFrColor']),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                           if (data.dashboardSpendingList.isNotEmpty) 
                                          TransactionSummery(
                                              data.dashboardSpendingList,
                                              profileData['CurrencyCode'])
                                              else 
                                              Container(
                                            margin: EdgeInsets.all(10),
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        top: 10.0,
                                                        bottom: 10.0),
                                                    margin: EdgeInsets.zero,
                                                    height: 100,
                                                    color: Colors.transparent,
                                                    child: Image.asset(AppSettings
                                                        .imgAssetNoTxn)),
                                                /* Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 10),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ), */
                                              ],
                                            ),
                                          ),
                                      
                                        ],
                                      ),
                                    ),
                                  ],
                                ));
                          
                        }),
                        Consumer<MySettingsListener>(
                            builder: (context, data, settingsDta) {
                           
                            return Card(
                              /* shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ), */
                              elevation: 10,
                              shadowColor: Colors.black,
                              borderOnForeground: true,
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Container(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text("Outstanding"),
                                      //trailing: Text("(Last 30 days)"),
                                      tileColor: HexColor(
                                          AppTheme_['SecondaryBgColor']),
                                      textColor: HexColor(
                                          AppTheme_['SecondaryFrColor']),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        if(data.dashboardOutStandingList.isNotEmpty)
                                        Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.zero,
                                          child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              itemCount: data
                                                  .dashboardOutStandingList
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return outStandingList(
                                                    context,
                                                    index,
                                                    data
                                                        .dashboardOutStandingList,
                                                    profileData[
                                                        'CurrencyCode']);
                                              }),
                                        )
                                      else
                                      Container(
                                            margin: EdgeInsets.all(10),
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        top: 10.0,
                                                        bottom: 10.0),
                                                    margin: EdgeInsets.zero,
                                                    height: 100,
                                                    color: Colors.transparent,
                                                    child: Image.asset(AppSettings
                                                        .imgAssetNoTxn)),
                                                /* Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 10),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ), */
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          
                        }),

                        /* Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 10.0, bottom: 10.0),
                              width: double.infinity,
                              color: Colors.grey.shade200,
                              child: Text(
                                "PURCHASE SUGGESTION",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                        ), */
                        /*Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        borderOnForeground: true,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0,
                                        top: 10.0,
                                        bottom: 10.0,
                                        right: 20),
                                    width: double.infinity,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "STORE ITEM(S)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(storeCollapse
                                            ? Icons.arrow_drop_down
                                            : Icons.arrow_drop_up)
                                      ],
                                    )),
                                onTap: () {
                                  storeCollapse = !storeCollapse;
                                  setState(() {});
                                },
                              ),
                            ),
                            if (storeCollapse)
                              StoreItemListView(widget.storeItem),
                             Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10.0, right: 20),
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "UPCOMING ACTIVITIES",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(activitiesCollapse
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            )),
                        onTap: () {
                          activitiesCollapse = !activitiesCollapse;
                          setState(() {});
                        },
                      ),
                    ),
                    if (activitiesCollapse)
                      UpcomingActivityListView(widget.upcomingActivities),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          margin: EdgeInsets.zero,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Text(
                            "RECENT ACITIVITIES",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10.0, right: 20),
                            margin: EdgeInsets.zero,
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "TOPUP",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(topupCollapse
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            )),
                        onTap: () {
                          topupCollapse = !topupCollapse;
                          setState(() {});
                        },
                      ),
                    ),
                    if (topupCollapse) TopupListView(widget.topupList),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10.0, right: 20),
                            margin: EdgeInsets.zero,
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PURCHASE",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(purchaseCollapse
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            )),
                        onTap: () {
                          purchaseCollapse = !purchaseCollapse;
                          setState(() {});
                        },
                      ),
                    ),
                    if (purchaseCollapse) PurchaseListView(widget.purchaseList), 
                          ]),
                        ),
                      ),*/
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    /* Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          margin: EdgeInsets.zero,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Text(
                            "PHOTO GALLERY",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.pinimg.com/originals/4b/92/28/4b92281a7861003034b632b4ab5ed741.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.adsttc.com/media/images/615a/fa1e/1248/3401/6477/b865/newsletter/tali-hankou-library-083.jpg?1633352237"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.7,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Text(
                            "SCHOOL CALENDAR",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      height: 525,
                      child: getCalendarView(
                          context,
                          new RandomColorModel()._getCalendarDataSource(),
                          calendarTapped,
                          _appointmentDetails),
                    ),
                  ],
                ),
               */
                  ],
                )))),
      );
  }

  Future<void> getTheme() async {
    String AppTheme = await MySharedPref().getData(AppSettings.Sp_AppTheme);
    this.AppTheme_ = jsonDecode(AppTheme);
    print(AppTheme_);
    AppSettings.colorCurrencyCode = this.AppTheme_['SecondaryBgColor'];
  }
}

/* AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes: 10)),
      subject: 'Public Holiday',
      color: Colors.greenAccent,
      startTimeZone: '',
      endTimeZone: '',
      notes: jsonEncode({
        "type": "Holiday",
        "actual_start_time": DateTime.now().add(Duration(hours: 1)).toString(),
        "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
        "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
        "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
      })));
  appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1)),
      subject: 'School Holiday',
      color: Colors.redAccent,
      startTimeZone: '',
      endTimeZone: '',
      notes: jsonEncode({
        "type": "Holiday",
        "actual_start_time": DateTime.now().add(Duration(hours: 1)).toString(),
        "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
        "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
        "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
      })));
  appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 5)),
      endTime: DateTime.now().add(Duration(days: 6)),
      subject: 'Term Holiday',
      color: Colors.orangeAccent,
      startTimeZone: '',
      endTimeZone: '',
      notes: jsonEncode({
        "type": "Holiday",
        "actual_start_time": DateTime.now().add(Duration(hours: 1)).toString(),
        "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
        "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
        "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
      })));

  return AppointmentDataSource(appointments);
}

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }

  Color _getColorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  List<ModuleModel> getModuleList() {
    // ignore: deprecated_member_use
    List<ModuleModel> monitorList = [];

    monitorList.add(new ModuleModel('OrderMeal', _getColorFromHex("#40E0D0"),
        true, 'Order Meal', Icons.fastfood_outlined));
    // monitorList.add(new ModuleModel('Store', _getColorFromHex("#DE3163"), true,
    //  'Store', Icons.shopping_bag_outlined));
    //monitorList.add(new ModuleModel('MyInvoice', _getColorFromHex("#35438e"),
    //  true, 'My invoice', Icons.cloud_upload_outlined));
    //monitorList.add(new ModuleModel('Activities', _getColorFromHex("#34495E"),
    //  true, 'Activities', Icons.pedal_bike_outlined));
    monitorList.add(new ModuleModel(
        'StudentAttendance',
        _getColorFromHex("#008080"),
        true,
        'Attendance',
        Icons.fact_check_outlined));
    monitorList.add(new ModuleModel('Topup', _getColorFromHex("#FF7F50"), true,
        'Topup', Icons.phone_android_outlined));
    /*  monitorList.add(new ModuleModel(
        'TransferMoney',
        _getColorFromHex("#CB4335"),
        true,
        'Transfer money',
        Icons.attach_money));
    monitorList.add(new ModuleModel('MFPTopup', _getColorFromHex("#2980B9"),
        true, 'MFP Topup', Icons.print));
    monitorList.add(new ModuleModel('Donation', _getColorFromHex("#008080"),
        true, 'Donation', Icons.money));
    monitorList.add(new ModuleModel('ParentPickup', _getColorFromHex("#8E44AD"),
        true, 'Student Pickup', Icons.directions_walk)); */
    // monitorList.add(new ModuleModel(
    //     'IDCardRequest',
    //     _getColorFromHex("#2874A6"),
    //     true,
    //     'ID card request',
    //     Icons.card_travel));
    // monitorList.add(new ModuleModel('StudentTracking',
    //   _getColorFromHex("#34495E"), true, 'Student tracking', Icons.map));
    monitorList.add(new ModuleModel(
        'HolidayCalendar',
        _getColorFromHex("#8E44AD"),
        true,
        'School Calendar',
        Icons.calendar_today));
    return monitorList;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<HolidayModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
 */