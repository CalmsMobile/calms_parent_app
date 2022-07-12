import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:calms_parent/model/_AppointmentDataSource.dart';
import 'package:calms_parent/ui/screens/widgets/HolidayCalendar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HolidayCalendar extends StatefulWidget {
  const HolidayCalendar(this.appointmentDataSource);

  final AppointmentDataSource appointmentDataSource;

  @override
  State<HolidayCalendar> createState() => _HolidayCalendarState();
}

class _HolidayCalendarState extends State<HolidayCalendar> {
  CalendarController _controller = CalendarController();
  List<Appointment> _appointmentDetails = <Appointment>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getMyAppbar("School Calendar", []),
        body: getCalendarView(context, widget.appointmentDataSource,
            calendarTapped, _appointmentDetails));
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      setState(() {
        _appointmentDetails =
            calendarTapDetails.appointments!.cast<Appointment>();
      });
    }
  }
}
