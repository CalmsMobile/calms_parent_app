import 'dart:convert';
import '../../../common/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Widget getCalendarView(BuildContext buildContext, _appointmentDataSource,
    calendarTapped, _appointmentDetails) {
  return Container(
    height: double.infinity,
    color: Colors.white,
    child: Column(
      children: [
        SfCalendar(
          view: CalendarView.month,
          showDatePickerButton: true,
          dataSource: _appointmentDataSource,
          onTap: calendarTapped,
        ),
        Container(
          color: Colors.grey.shade200,
          margin: EdgeInsets.only(top: 0, bottom: 5),
          height: 45,
          child: customBottomSheetActionBar(buildContext, "Legends", false,
              Colors.grey.shade200, false, true, 14),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0, left: 4, right: 4),
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
                          padding: EdgeInsets.only(bottom: 0, left: 5),
                          child: Text(
                            "Public Holiday",
                            style: TextStyle(color: Colors.black, fontSize: 12),
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
                          padding: EdgeInsets.only(bottom: 0, left: 5),
                          child: Text(
                            "School Holiday",
                            style: TextStyle(color: Colors.black, fontSize: 12),
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
                          padding: EdgeInsets.only(bottom: 0, left: 5),
                          child: Text(
                            "Term Holiday",
                            style: TextStyle(color: Colors.black, fontSize: 12),
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
        Container(
          color: Colors.black,
          margin: EdgeInsets.only(top: 0, bottom: 0),
          height: 45,
          child: customBottomSheetActionBar(buildContext, "Summary", false,
              Colors.grey.shade200, false, true, 14),
        ),
        Container(
          height: 85,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          padding: EdgeInsets.only(top: 5),
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
                              "Total school days",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "Total holidays",
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
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "25",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "08",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
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
      ],
    ),
  );
}


