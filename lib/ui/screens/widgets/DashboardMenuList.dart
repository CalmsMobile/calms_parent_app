import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../model/_AppointmentDataSource.dart';
import '../calendar/calendar_page.dart';
import '../home/Home.dart';

Widget menuList(BuildContext context, int index, List menu) {
  return Container(
    width: 90.0,
    child: InkWell(
        onTap: () => {
              if (menu[index]['MenuId'] == 2017.0)
                Navigator.of(context).pushNamed('/MealOrder'),
              if (menu[index]['MenuId'] == 2019.0)
                Navigator.of(context).pushNamed('/MFPTopup'),
              if (menu[index]['MenuId'] == 1.0)
                Navigator.of(context).pushNamed('/StudentAttendance'),
            },
        child: Column(
          children: [
            if (menu[index]['MenuId'] == 2017.0)
              Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/ico_order.png")),
            if (menu[index]['MenuId'] == 2012.0)
              Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/ico_attendance.png")),
            if (menu[index]['MenuId'] == 2019.0)
              Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/ico_top_up.png")),
            if (menu[index]['MenuId'] == 1.0)
              Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/ico_schoolattendance.png")),
            if (menu[index]['MenuId'] == 2022.0)
              Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/ico_schoolattendance.png")),
            SizedBox(
              height: 10,
            ),
            Text(
              menu[index]['MenuName'],
              style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.black,
                  //letterSpacing: 2.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
  );
}

AppointmentDataSource _getCalendarDataSource() {
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
