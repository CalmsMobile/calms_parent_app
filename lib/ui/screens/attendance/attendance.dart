import 'package:calms_parent/model/_AppointmentDataSource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance")),
      body: Center(
          child: Container(
        height: 500,
        padding: EdgeInsets.all(0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: SfCalendar(
                  view: CalendarView.month,
                  showDatePickerButton: true,
                  monthViewSettings: MonthViewSettings(showAgenda: true),
                  dataSource: _getCalendarDataSource(),
                )),
              ],
            ),
          ),
        ),
      )),
    );
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
    ));
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes: 10)),
      subject: 'School Holiday',
      color: Colors.red,
      startTimeZone: '',
      endTimeZone: '',
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1)),
      subject: 'School Holiday',
      color: Colors.red,
      startTimeZone: '',
      endTimeZone: '',
    ));

    return AppointmentDataSource(appointments);
  }
}
