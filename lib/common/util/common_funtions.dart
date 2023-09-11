import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../listener/settings_listener.dart';

class CommonFunctions {
  static String getInitials(name) {
    List<String> names = name.split(" ");
    String initials = "";
    int numWords = 2;

    if (numWords < names.length) {
      numWords = names.length;
    }
    for (var i = 0; i < numWords; i++) {
      initials += '${names[i][0]}';
    }
    return initials;
  }

  static getActualTime(appointment) {
    var actualtime = appointment.notes;
    var appint = Map<String, String>.from(jsonDecode(actualtime));
    //print(appint['actual_start_time']);

    return DateFormat('hh:mm a')
        .format(DateTime.parse(appint['actual_start_time']!));
  }

  static getActualEndTime(appointment) {
    var actualtime = appointment.notes;
    var appint = Map<String, String>.from(jsonDecode(actualtime));
    //print(appint['actual_end_time']);

    return DateFormat('hh:mm a')
        .format(DateTime.parse(appint['actual_end_time']!));
  }

  static String getImageUrlUsingUsingSeqId(userId, userList) {
    return "";
  }

  static int getChildIndexFromFamily(List familyList) {
    for (int i = 0; familyList.length > 0; i++) {
      if (familyList[i]['MemberType'] == "Student") ;
      return i;
    }
    return 0;
  }

  static String getPoCartData(UserSeqId, POTypeConfigSeqId, PackageSeqId) {
    return "PO_${UserSeqId}_-0_1900-01-01_0_0_${POTypeConfigSeqId}_${PackageSeqId}_";
  }

  static String getPoMealCartData(
      UserSeqId, ItemSeqId, ViewDate, ItemType, POTypeConfigSeqId) {
    //PO_100108_1001_2023-09-10_101_0_10000__
    return "PO_${UserSeqId}_${ItemSeqId}_${ViewDate}_${ItemType}_0_${POTypeConfigSeqId}__";
  }

  static String getMealImageUrl(baseUrl, imgPath) {
    baseUrl = baseUrl.toString().replaceAll("/FS/", "");
    return "${baseUrl}/Handler/ImagePathHandler.ashx?ImagePath=${imgPath}&Default=10&PROUrl=${baseUrl}/&StoreageUrl=${baseUrl}/FS/";
  }

  static String getDailyMealsInCart(cartList) {
    List mealsList = [];
    if (cartList.length > 0) {
      for (var item in cartList) {
        mealsList.add(
            "${item.split("_")[2]}_${item.split("_")[3]}_${item.split("_")[6]}");
      }

      print(mealsList.join(","));
    }
    return (mealsList.join(","));
  }

  static String getTermMealsInCart(cartList) {
    List mealsList = [];
    if (cartList.length > 0) {
      for (var item in cartList) {
        if(item.split("_")[7]!="")
        mealsList.add("${item.split("_")[7]}");
      }

      print(mealsList.join(","));
    }
    return mealsList.join(",");
  }
}
