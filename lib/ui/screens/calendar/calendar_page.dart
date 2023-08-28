import '/common/widgets/select_member.dart';
import '/model/_AppointmentDataSource.dart';
import '/ui/screens/widgets/HolidayCalendar.dart';
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
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getMyAppbar(context,"School Calendar", []),
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
