import 'dart:convert';

import 'package:calms_parent_latest/ui/screens/meals/MealOrder.dart';
import 'package:calms_parent_latest/ui/screens/topup/TopupPage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../common/HexColor.dart';
import '../../../model/_AppointmentDataSource.dart';
import '../calendar/calendar_page.dart';
import '../home/Home.dart';
import '../notifications/notifications.dart';

Widget menuList(BuildContext context, int index, List menu, List familyList,
    imgBaseUrl, profileData, List familyListWithoutParent,AppTheme_,List NotificationCategoryList) {
  return Container(
    width: 90.0,
    child: InkWell(
        onTap: () => {
              if (menu[index]['MenuId'] == 2017.0)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MealOrder({
                              "familyList": familyListWithoutParent,
                              "profileData": profileData,
                              "imgBaseUrl": imgBaseUrl,
                              "selectedMemberIndex": 1
                            },AppTheme_))),
              if (menu[index]['MenuId'] == 2019.0)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopupPage({
                              "profileData": profileData,
                              "imgBaseUrl": imgBaseUrl,
                            },AppTheme_))),
              if (menu[index]['MenuId'] == 2022.0)
                Navigator.of(context).pushNamed('/InvoicePayment'),
              if (menu[index]['MenuId'] == 1.0)
                Navigator.of(context)
                    .pushNamed('/calendarTransactions', arguments: {
                  "familyList": familyList,
                  "imgBaseUrl": imgBaseUrl,
                  "CurrencyCode": profileData['CurrencyCode'],
                  "AppTheme_": AppTheme_
                }),
                if(menu[index]['MenuId'] == 2.0)
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications(
                                      NotifyOnly: profileData['NotifyOnly'],
                                      categoryList:
                                          NotificationCategoryList,
                                      name: 'NotificationDashboard',
                                    )))
            },
        child: Column(
          children: [
            if (menu[index]['MenuId'] == 2017.0)
              Icon(
                Icons.restaurant_menu_outlined,
                color: HexColor(AppTheme_['SecondaryBgColor']),
                size: 50,
              ),
            if (menu[index]['MenuId'] == 2012.0)
              Icon(
                Icons.transfer_within_a_station_outlined,
                color: HexColor(AppTheme_['SecondaryBgColor']),
                size: 50,
              ),
            if (menu[index]['MenuId'] == 2019.0)
              Icon(
                Icons.wallet_outlined,
                color: HexColor(AppTheme_['SecondaryBgColor']),
                size: 50,
              ),
            if (menu[index]['MenuId'] == 1.0)
              Icon(
                Icons.calendar_month_outlined,
                color: HexColor(AppTheme_['SecondaryBgColor']),
                size: 50,
              ),
            if (menu[index]['MenuId'] == 2.0)
             Icon(
                Icons.notifications_outlined,
                color: HexColor(AppTheme_['SecondaryBgColor']),
                size: 50,
              ),
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
