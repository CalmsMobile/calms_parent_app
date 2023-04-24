import 'dart:convert';

import '/common/widgets/select_member.dart';
import '/model/_AppointmentDataSource.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  CalendarController _controller = CalendarController();
  List<Appointment> _appointmentDetails = <Appointment>[];

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      setState(() {
        _appointmentDetails =
            calendarTapDetails.appointments!.cast<Appointment>();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getMyAppbar("Attendance", []),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SfCalendar(
                  view: CalendarView.month,
                  showDatePickerButton: true,
                  dataSource: _getCalendarDataSource(),
                  onTap: calendarTapped,
                ),
                Container(
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  height: 30,
                  child: customBottomSheetActionBar(context, "Legends", false,
                      Colors.grey.shade200, false, true, 14),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3),
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(top: 3, left: 0, right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(60.0)),
                            )),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "Present",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
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
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(60.0)),
                            )),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "Absent",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
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
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(60.0)),
                            )),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "Holiday",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
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
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(60.0)),
                            )),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "Late Entry",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
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
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(60.0)),
                            )),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "Early Out",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  height: 30,
                  child: customBottomSheetActionBar(context, "Attendance",
                      false, Colors.grey.shade200, false, true, 14),
                ),
                Container(
                  height: 85,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: ListView.separated(
                    itemCount: _appointmentDetails.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(2),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      "Class time",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      "Schedule time",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      "Clock time",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "${DateFormat('hh:mm a').format(_appointmentDetails[index].startTime)} - ${DateFormat('hh:mm a').format(_appointmentDetails[index].endTime)}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "${getActualTime(_appointmentDetails[index])} - ${getActualEndTime(_appointmentDetails[index])}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "${getActualTime(_appointmentDetails[index])} - ${getActualEndTime(_appointmentDetails[index])}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      height: 5,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  height: 30,
                  child: customBottomSheetActionBar(context, "Summary", false,
                      Colors.grey.shade200, false, true, 14),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 0),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total school days",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total present",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total absent",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total late in days",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total early out days",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "25",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "05",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "07",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
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

  getActualTime(appointment) {
    var actualtime = appointment.notes;
    var appint = Map<String, String>.from(jsonDecode(actualtime));
    print(appint['actual_start_time']);

    return DateFormat('hh:mm a')
        .format(DateTime.parse(appint['actual_start_time']!));
  }

  getActualEndTime(appointment) {
    var actualtime = appointment.notes;
    var appint = Map<String, String>.from(jsonDecode(actualtime));
    print(appint['actual_end_time']);

    return DateFormat('hh:mm a')
        .format(DateTime.parse(appint['actual_end_time']!));
  }
}
