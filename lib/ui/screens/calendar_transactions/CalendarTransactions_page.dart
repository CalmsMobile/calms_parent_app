import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../common/common_api.dart';
import '../../../common/util/common_funtions.dart';
import '../../../common/widgets/select_member.dart';
import '../../../model/_AppointmentDataSource.dart';

class CalendarTransactionsPage extends StatefulWidget {
  static const String routeName = '/calendarTransactions';

  @override
  _CalendarTransactionsPageState createState() =>
      _CalendarTransactionsPageState();
}

class _CalendarTransactionsPageState extends State<CalendarTransactionsPage> {
  CalendarController _controller = CalendarController();
  List<Appointment> _appointmentDetails = <Appointment>[];
  int senderIndex = 0;
 late int selectedUserSeqId;
 late String selectedRefBranchSeqId;

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    print(calendarTapDetails.date);
    print(selectedUserSeqId);
    print(selectedRefBranchSeqId);
    getData(selectedUserSeqId,selectedRefBranchSeqId,calendarTapDetails.date?.year,calendarTapDetails.date?.month,calendarTapDetails.date?.day);
    /* if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      setState(() {
        _appointmentDetails =
            calendarTapDetails.appointments!.cast<Appointment>();
      });
    } */
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.initValues("106312.0","11001",2023, 08, 22);
  }

  Future<void> getData(
      RefUserSeqId, RefBranchSeqId, Year, Month, Date) async {
    CommonUtil().getGetCalendarData(
        context, RefUserSeqId, RefBranchSeqId, Year, Month, Date);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    final familyList = data['familyList'];
    final imgBaseUrl = data['imgBaseUrl'];
    if (familyList != [] || familyList != null) {
      print("initValues");
      selectedUserSeqId = familyList[senderIndex]['UserSeqId'];
      selectedRefBranchSeqId = familyList[senderIndex]['RefBranchSeqId'];
      getData(selectedUserSeqId,selectedRefBranchSeqId,DateTime.now().year ,DateTime.now().month, DateTime.now().day);
    }

    return Scaffold(
        appBar: getMyAppbar("Calendar", [
          // Navigate to the Search Screen
          Container(
            height: 30,
            width: 150,
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Flexible(
                  child: ListTile(
                    horizontalTitleGap: 2,
                    contentPadding: EdgeInsets.zero,
                    onTap: () => {
                      openMemberBottomSheet(context, familyList, imgBaseUrl,
                          (index) {
                        Navigator.pop(context);
                        senderIndex = index;
                        setState(() {});
                      })
                    },
                    trailing: familyList[senderIndex]['UserImgPath'] != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(imgBaseUrl +
                                familyList[senderIndex]["UserImgPath"]),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.blue[700],
                            child: Text(
                              CommonFunctions.getInitials(
                                  familyList[senderIndex]['Name']),
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
        ]),
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
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          borderOnForeground: true,
                          margin: EdgeInsets.only(
                              top: 5, bottom: 20, left: 20, right: 20),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: SfCalendar(
                              view: CalendarView.month,
                              showDatePickerButton: true,
                             // dataSource: _getCalendarDataSource(),
                              onTap: calendarTapped,
                            ),
                          ),
                        ),
                        Card(
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
                                      "Holidays",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Container(
                                height: 180,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                child: ListView.separated(
                                  itemCount: _appointmentDetails.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        padding: EdgeInsets.all(2),
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(3),
                                                  child: Image(
                                                      width: 30,
                                                      height: 30,
                                                      image: AssetImage(
                                                          "assets/images/ico_classtime.png")),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.all(3),
                                                    child: Text(
                                                      "Class time",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )),
                                                Padding(
                                                  padding: EdgeInsets.all(3),
                                                  child: Text(
                                                    "${DateFormat('hh:mm a').format(_appointmentDetails[index].startTime)} - ${DateFormat('hh:mm a').format(_appointmentDetails[index].endTime)}",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blue.shade900,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(3),
                                                  child: Image(
                                                      width: 30,
                                                      height: 30,
                                                      image: AssetImage(
                                                          "assets/images/ico_schedule.png")),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(3),
                                                  child: Text(
                                                    "Schedule time",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(3),
                                                  child: Text(
                                                    "${CommonFunctions.getActualTime(_appointmentDetails[index])} - ${CommonFunctions.getActualEndTime(_appointmentDetails[index])}",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blue.shade900,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(3),
                                                  child: Image(
                                                      width: 30,
                                                      height: 30,
                                                      image: AssetImage(
                                                          "assets/images/ico_time.png")),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(3),
                                                  child: Text(
                                                    "Clock time",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(3),
                                                  child: Text(
                                                    "${CommonFunctions.getActualTime(_appointmentDetails[index])} - ${CommonFunctions.getActualEndTime(_appointmentDetails[index])}",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blue.shade900,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(
                                    height: 5,
                                  ),
                                ),
                              ),
                            ])),
                        Card(
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
                      ],
                    ),
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

    return AppointmentDataSource(appointments);
  }
}
