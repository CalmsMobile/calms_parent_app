import 'package:calms_parent/model/_AppointmentDataSource.dart';
import 'package:calms_parent/ui/screens/widgets/HolidayCalendar.dart';
import 'package:flutter/material.dart';

class HolidayCalendar extends StatelessWidget {
  const HolidayCalendar(this.appointmentDataSource);

  final AppointmentDataSource appointmentDataSource;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Holiday Calendar"),
        ),
        body: getCalendarView(context, appointmentDataSource));
  }
}
