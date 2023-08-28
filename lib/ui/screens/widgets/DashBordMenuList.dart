import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../model/_AppointmentDataSource.dart';
import '../calendar/calendar_page.dart';
import '../home/Home.dart';

Widget menuList(
    BuildContext context, int index, List menu, List familyList, imgBaseUrl) {
  return Container(
    width: 90.0,
    child: InkWell(
        onTap: () => {
              if (menu[index]['MenuId'] == 2017.0)
                Navigator.of(context).pushNamed('/MealOrder', arguments: {
                  "familyList": familyList,
                  "imgBaseUrl": imgBaseUrl
                }),
              if (menu[index]['MenuId'] == 2019.0)
                Navigator.of(context).pushNamed('/TopupPage'),
              if (menu[index]['MenuId'] == 2022.0)
                Navigator.of(context).pushNamed('/InvoicePayment'),
              if (menu[index]['MenuId'] == 1.0)
                Navigator.of(context).pushNamed('/calendarTransactions',
                    arguments: {
                      "familyList": familyList,
                      "imgBaseUrl": imgBaseUrl
                    }),
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
