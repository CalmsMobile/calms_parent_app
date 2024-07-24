import 'dart:convert';

import 'package:calms_parent_latest/common/app_settings.dart';
import 'package:calms_parent_latest/common/widgets/no_data_card.dart';
import 'package:calms_parent_latest/ui/screens/widgets/AttendanceListView.dart';
import 'package:calms_parent_latest/ui/screens/widgets/HolidayListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../common/HexColor.dart';
import '../../../common/common_api.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/util/common_funtions.dart';
import '../../../common/widgets/common.dart';
import '../../../model/_AppointmentDataSource.dart';
import '../widgets/DashBordMenuList.dart';
import '../widgets/RecentTransactionListView.dart';
import '../widgets/TransactionSummery.dart';

class CalendarTransactionsPage extends StatefulWidget {
  final Map<String, dynamic> arg;
  CalendarTransactionsPage(this.arg);

  @override
  _CalendarTransactionsPageState createState() =>
      _CalendarTransactionsPageState();
}

class _CalendarTransactionsPageState extends State<CalendarTransactionsPage> {
  CalendarController _controller = CalendarController();
  //List<Appointment> _appointmentDetails = <Appointment>[];
  int senderIndex = 0;
  late double selectedUserSeqId;
  late String selectedRefBranchSeqId;
  late DateTime? selectedDateTime;

  bool veryFirst = true;

  bool hideBottomDetailsCards = false;

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    print(calendarTapDetails.targetElement);
    print(selectedUserSeqId);
    print(selectedRefBranchSeqId);
    if (calendarTapDetails.targetElement.name == "calendarCell") {
      setState(() {
        selectedDateTime = calendarTapDetails.date;
        getData(selectedUserSeqId, selectedRefBranchSeqId,
            DateFormat("yyyy-MM-dd").format(selectedDateTime!));
      });
    }
  }

  void viewChanged(ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance!.addPostFrameCallback((Duration duration) {
      //setState(() {
      /*   var _month = DateFormat('MMMM').format(viewChangedDetails
          .visibleDates[viewChangedDetails.visibleDates.length ~/ 2]).toString();
    var _year = DateFormat('yyyy').format(viewChangedDetails
          .visibleDates[viewChangedDetails.visibleDates.length ~/ 2]).toString(); */
      setState(() {
        hideBottomDetailsCards = true;
        if (veryFirst) {
          veryFirst = false;
          selectedDateTime = DateTime.now();
          getData(selectedUserSeqId, selectedRefBranchSeqId,
              DateFormat("yyyy-MM-dd").format(selectedDateTime!));
        } else {
          /* selectedDateTime = viewChangedDetails
            .visibleDates[viewChangedDetails.visibleDates.length ~/ 2];
        getData(
            selectedUserSeqId,
            selectedRefBranchSeqId,
            DateFormat("yyyy-MM-dd").format(
                DateTime(selectedDateTime!.year, selectedDateTime!.month, 1))); */
        }
        selectedDateTime = viewChangedDetails
            .visibleDates[viewChangedDetails.visibleDates.length ~/ 2];
        CommonUtil().getGetCalendarIndicationData(
            context,
            selectedUserSeqId,
            selectedRefBranchSeqId,
            DateFormat("yyyy-MM-dd").format(
                DateTime(selectedDateTime!.year, selectedDateTime!.month, 1)),
            DateFormat("yyyy-MM-dd").format(DateTime(
                selectedDateTime!.year, selectedDateTime!.month + 1, 0)));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //this.getData("106312.0","11001",2023, 08, 31);
    // final data = ModalRoute.of(context)?.settings.arguments as Map;

    if (widget.arg['familyList'] != [] || widget.arg['familyList'] != null) {
      print("initValues");
      selectedUserSeqId = widget.arg['familyList'][senderIndex]['UserSeqId'];
      selectedRefBranchSeqId =
          widget.arg['familyList'][senderIndex]['RefBranchSeqId'];
      /*  if (veryFirst) {
        getData(selectedUserSeqId, selectedRefBranchSeqId,
            DateFormat("yyyy-MM-dd").format(selectedDateTime!));
        CommonUtil().getGetCalendarIndicationData(
            context,
            selectedUserSeqId,
            selectedRefBranchSeqId,
            DateFormat("yyyy-MM-dd").format(
                DateTime(selectedDateTime!.year, selectedDateTime!.month, 1)),
            DateFormat("yyyy-MM-dd").format(DateTime(
                selectedDateTime!.year, selectedDateTime!.month + 1, 0)));
        veryFirst = false;
      } */
    }
  }

  Future<void> getData(RefUserSeqId, RefBranchSeqId, Date) async {
    hideBottomDetailsCards = false;
    CommonUtil()
        .getGetCalendarData(context, RefUserSeqId, RefBranchSeqId, Date);
  }

  selectMember(index) {
    setState(() {
      print("index" == index.toString());
      senderIndex = index;
      selectedUserSeqId = widget.arg['familyList'][senderIndex]['UserSeqId'];
      /* getData(selectedUserSeqId, selectedRefBranchSeqId,
          DateFormat("yyyy-MM-dd").format(selectedDateTime!)); */
      hideBottomDetailsCards = true;
      CommonUtil().getGetCalendarIndicationData(
          context,
          selectedUserSeqId,
          selectedRefBranchSeqId,
          DateFormat("yyyy-MM-dd").format(
              DateTime(selectedDateTime!.year, selectedDateTime!.month, 1)),
          DateFormat("yyyy-MM-dd").format(DateTime(
              selectedDateTime!.year, selectedDateTime!.month + 1, 0)));
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.arg['familyList'] != [] || widget.arg['familyList'] != null) {
      print("initValues");
      selectedUserSeqId = widget.arg['familyList'][senderIndex]['UserSeqId'];
      selectedRefBranchSeqId =
          widget.arg['familyList'][senderIndex]['RefBranchSeqId'];
      // setState(() {
      //getData(selectedUserSeqId, selectedRefBranchSeqId, DateTime.now().year,DateTime.now().month, DateTime.now().day);
      // });
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor:
              HexColor(widget.arg['AppTheme_']['SecondaryBgColor']),
          //titleSpacing: -5,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image(
                width: 50,
                height: 50,
                image: AssetImage("assets/images/ico_back.png"),
              ),
            ), */
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      //margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: HexColor(
                                widget.arg['AppTheme_']['SecondaryFrColor']),
                            width: 2),
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: HexColor(
                                widget.arg['AppTheme_']['SecondaryFrColor']),
                            size: 30,
                          )))),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Calendar",
                  style: TextStyle(
                      color:
                          HexColor(widget.arg['AppTheme_']['SecondaryFrColor']),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
              // Your widgets here
            ],
          ),
          actions: [
            // Navigate to the Search Screen
            if (widget.arg['familyList'].length > 0 && senderIndex > -1)
              Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: ListTile(
                        horizontalTitleGap: 2,
                        contentPadding: EdgeInsets.zero,
                        onTap: () => {
                          openMemberBottomSheet(
                              context,
                              widget.arg['familyList'],
                              widget.arg['imgBaseUrl'],
                              selectMember)
                        },
                        trailing: widget.arg['familyList'][senderIndex]
                                    ['UserImgPath'] !=
                                null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(
                                    widget.arg['imgBaseUrl'] +
                                        widget.arg['familyList'][senderIndex]
                                            ["UserImgPath"]),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.blue[700],
                                child: Text(
                                  CommonFunctions.getInitials(
                                          widget.arg['familyList'][senderIndex]
                                              ['Name'])
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                HexColor(widget.arg['AppTheme_']['PrimaryBgColor']),
                HexColor(widget.arg['AppTheme_']['PrimaryBgColor']),
              ],
            )),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(children: [
                      Consumer<MySettingsListener>(
                          builder: (context, data, settingsDta) {
                        return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 10,
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            margin: EdgeInsets.only(
                                top: 20, bottom: 0, left: 20, right: 20),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: SfCalendar(
                                view: CalendarView.month,
                                showDatePickerButton: true,
                                //dataSource: _getCalendarDataSource(),
                                dataSource: AppointmentDataSource(
                                    data.calendarIndicationDataList),
                                onTap: calendarTapped,
                                onViewChanged: viewChanged,
                              ),
                            ));
                      }),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        //color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 0, left: 4, right: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      WidgetSpan(
                                          child: Container(
                                        width: 15,
                                        height: 15,
                                        padding: EdgeInsets.only(top: 0),
                                        decoration: BoxDecoration(
                                            color: HexColor("#F3C416"),
                                            borderRadius:
                                                BorderRadius.circular(60.0)),
                                      )),
                                      WidgetSpan(
                                          child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 0, left: 5),
                                        child: Text(
                                          "Purchase",
                                          style: TextStyle(
                                              color: HexColor(widget.arg['AppTheme_']['PrimaryFrColor']),
                                              fontSize: 12),
                                        ),
                                      )),
                                    ]),
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      WidgetSpan(
                                          child: Container(
                                        width: 15,
                                        height: 15,
                                        padding: EdgeInsets.only(top: 0),
                                        decoration: BoxDecoration(
                                            color: HexColor("#2D3E50"),
                                            borderRadius:
                                                BorderRadius.circular(60.0)),
                                      )),
                                      WidgetSpan(
                                          child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 0, left: 5),
                                        child: Text(
                                          "Top-up",
                                          style: TextStyle(
                                              color: HexColor(widget.arg['AppTheme_']['PrimaryFrColor']),
                                              fontSize: 12),
                                        ),
                                      )),
                                    ]),
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      WidgetSpan(
                                          child: Container(
                                        width: 15,
                                        height: 15,
                                        padding: EdgeInsets.only(top: 0),
                                        decoration: BoxDecoration(
                                            color: HexColor("#E94D40"),
                                            borderRadius:
                                                BorderRadius.circular(60.0)),
                                      )),
                                      WidgetSpan(
                                          child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 0, left: 5),
                                        child: Text(
                                          "Holiday",
                                          style: TextStyle(
                                              color: HexColor(widget.arg['AppTheme_']['PrimaryFrColor']),
                                              fontSize: 12),
                                        ),
                                      )),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!hideBottomDetailsCards)
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
                                    title: Text("Transactions"),
                                    //trailing: Text("(Last 30 days)"),
                                    tileColor: HexColor(widget.arg['AppTheme_']
                                        ['SecondaryBgColor']),
                                    textColor: HexColor(widget.arg['AppTheme_']
                                        ['SecondaryFrColor']),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, right: 0, top: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (data
                                            .calendarTransactionList.isNotEmpty)
                                          RecentTransactionListView(
                                              data.calendarTransactionList,
                                              widget.arg['CurrencyCode'],
                                              widget.arg['AppTheme_'],
                                              data.calendarTransactionList
                                                          .length >
                                                      10
                                                  ? true
                                                  : false,
                                              "Transactions")
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
                                                    child: Image.asset(
                                                        AppSettings
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
                      if (!hideBottomDetailsCards)
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
                                    title: Text("Holiday"),
                                    //trailing: Text("(Last 30 days)"),
                                    tileColor: HexColor(widget.arg['AppTheme_']
                                        ['SecondaryBgColor']),
                                    textColor: HexColor(widget.arg['AppTheme_']
                                        ['SecondaryFrColor']),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, right: 0, top: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (data
                                            .calendarHolidaysList.isNotEmpty)
                                          HolidayListView(
                                              data.calendarHolidaysList)
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
                                                    child: Image.asset(
                                                        AppSettings
                                                            .imgAssetNoTxn)),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        }),

                      /*  Consumer<MySettingsListener>(
                          builder: (context, data, child) =>
                              data.calendarAttendanceList.length == 0 &&
                                      data.calendarHolidaysList.length == 0 &&
                                      data.calendarTransactionList.length == 0
                                  ? NoDataCard(
                                      AppSettings.imgAssetNoCalender,
                                      AppSettings.titleNoCalender,
                                      AppSettings.msgNoCalender,
                                      20)
                                  : SizedBox())
 */
                      /*  Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            borderOnForeground: true,
                            margin: EdgeInsets.only(
                                top: 5, bottom: 20, left: 20, right: 20),
                            child: Column(children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0, top: 10.0, bottom: 10.0),
                                    margin: EdgeInsets.zero,
                                    width: double.infinity,
                                    color: Colors.transparent,
                                    child: Text(
                                      "Summary",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  height: 180,
                                  margin: EdgeInsets.only(top: 0),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Image(
                                                width: 30,
                                                height: 30,
                                                image: AssetImage(
                                                    "assets/images/ico_schoolholiday.png")),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.all(3),
                                              child: Text(
                                                "Total School Holidays",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Text(
                                              "20",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        thickness: 0.5,
                                        indent: 2,
                                        endIndent: 2,
                                        color: Colors.grey,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Image(
                                                width: 30,
                                                height: 30,
                                                image: AssetImage(
                                                    "assets/images/ico_totalpresent.png")),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Text(
                                              "Total Present",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Text(
                                              "100",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        thickness: 0.5,
                                        indent: 2,
                                        endIndent: 2,
                                        color: Colors.grey,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Image(
                                                width: 30,
                                                height: 30,
                                                image: AssetImage(
                                                    "assets/images/ico_totalabsent.png")),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Text(
                                              "Total Absent",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Text(
                                              "45",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]))
                       */
                    ]),
                  ),
                ))));
  }

  AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(minutes: 10)),
        subject: 'Public Holiday',
        color: Colors.blue,
        startTimeZone: '',
        endTimeZone: '',
        notes: jsonEncode({
          "type": "Holiday",
          "actual_start_time":
              DateTime.now().add(Duration(hours: 1)).toString(),
          "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
          "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
          "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
        })));
    appointments.add(Appointment(
        startTime: DateTime.now().add(Duration(days: 1)),
        endTime: DateTime.now().add(Duration(days: 1)),
        subject: 'Present',
        color: Colors.greenAccent,
        startTimeZone: '',
        endTimeZone: '',
        notes: jsonEncode({
          "type": "Present",
          "actual_start_time":
              DateTime.now().add(Duration(hours: 1)).toString(),
          "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
          "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
          "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
        })));
    appointments.add(Appointment(
        startTime: DateTime.now().add(Duration(days: 5)),
        endTime: DateTime.now().add(Duration(days: 6)),
        subject: 'Absent',
        color: Colors.red,
        startTimeZone: '',
        endTimeZone: '',
        notes: jsonEncode({
          "type": "Absent",
          "actual_start_time":
              DateTime.now().add(Duration(hours: 1)).toString(),
          "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
          "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
          "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
        })));
    appointments.add(Appointment(
        startTime: DateTime.now().add(Duration(days: 3)),
        endTime: DateTime.now().add(Duration(days: 3)),
        subject: 'Late Entry',
        color: Colors.orangeAccent,
        startTimeZone: '',
        endTimeZone: '',
        notes: jsonEncode({
          "type": "LateEntry",
          "actual_start_time":
              DateTime.now().add(Duration(hours: 1)).toString(),
          "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
          "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
          "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
        })));
    appointments.add(Appointment(
        startTime: DateTime.now().add(Duration(days: 2)),
        endTime: DateTime.now().add(Duration(days: 2)),
        subject: 'Early Out',
        color: Colors.orangeAccent,
        startTimeZone: '',
        endTimeZone: '',
        notes: jsonEncode({
          "type": "EarlyOut",
          "actual_start_time":
              DateTime.now().add(Duration(hours: 1)).toString(),
          "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
          "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
          "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
        })));
//print(appointments);
    return AppointmentDataSource(appointments);
  }
}
