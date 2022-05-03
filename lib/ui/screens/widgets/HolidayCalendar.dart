import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Widget getCalendarView(BuildContext buildContext, _appointmentDataSource) {
  return Center(
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
              monthViewSettings: MonthViewSettings(showAgenda: true),
              dataSource: _appointmentDataSource,
            )),
          ],
        ),
      ),
    ),
  ));
}
