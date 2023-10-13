import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../listener/settings_listener.dart';

class CommonFunctions {
  static String getInitials(name) {
    List<String> names = name.split(" ");
    if (names.length == 1)
      return names[0].toString()[0] + names[0].toString()[names[0].length - 1];
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

  static List getChildListFromFamilyList(List familyList) {
    List studentList = [];
    for (var member in familyList) {
      if (member['MemberType'] == "Student") studentList.add(member);
    }

    print("========" + studentList.toString());

    return studentList;
  }

  static String getPoTermCartData(UserSeqId, POTypeConfigSeqId, PackageSeqId) {
    return "PO_${UserSeqId.toInt()}_-0_1900-01-01_0_0_${POTypeConfigSeqId.toInt()}_${PackageSeqId.toInt()}_";
  }

  static String getPoDailyMealCartData(
      UserSeqId, ItemSeqId, ViewDate, ItemType, POTypeConfigSeqId) {
    //PO_100108_1001_2023-09-10_101_0_10000__
    return "PO_${UserSeqId.toInt()}_${ItemSeqId.toInt()}_${ViewDate}_${ItemType}_0_${POTypeConfigSeqId.toInt()}__";
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
            "${item.split("_")[1]}_${item.split("_")[2]}_${item.split("_")[3]}_${item.split("_")[6]}");
      }

      print(mealsList.join(","));
    }
    return (mealsList.join(","));
  }

  static String getTermMealsInCart(cartList) {
    List mealsList = [];
    if (cartList.length > 0) {
      for (var item in cartList) {
        if (item.split("_")[7] != "")
          mealsList.add("${item.split("_")[1]}_${item.split("_")[7]}");
      }

      print(mealsList.join(","));
    }
    return mealsList.join(",");
  }

  static Uint8List getUnit8bytesFromB64(String _base64) {
    return base64Decode(
        _base64.replaceAll(RegExp(r'^data:image\/[a-z]+;base64,'), ''));
  }

  static getProRatedAmount(psPackageSeqId, psConfigJSON, psPerdayAmt, psAmount,
      List GoProRatedPackageDays) {
    var lnAmount = psAmount, psProDays = 0;
    if (psConfigJSON != "") {
      psConfigJSON = jsonDecode(psConfigJSON);
    }
    print(psConfigJSON['ProRatedCutoff']);
    if (int.parse(psConfigJSON['ProRatedCutoff']) == 1) {
      //print(GoProRatedPackageDays.length);
      psProDays = psConfigJSON['ProRateCutoffNoofDays'];
      if (GoProRatedPackageDays.length > 0) {
        var loobj = GoProRatedPackageDays.singleWhere(
            (item) => item['PackageSeqId'] == psPackageSeqId);
        print("==============");
        print(loobj);
        if (loobj.length > 0) {
          var lsDays = loobj['TotalDays'];
          var lsPassedDays = loobj['PassedDays'];
          var lsPerdayAmt = loobj['DayAmount'];
          if (psProDays < lsPassedDays) {
            lnAmount = lsDays * lsPerdayAmt;
          }
        }
      }
    }
    return lnAmount;
  }

  /*  static getPOConfigDetails(poConfig, CurrentDateTime, TermDate, TermEndDate, CutoffStartTime, IsClickFrom) {
            var lsFromDate = "", lsToDate = "", lsCurrentDateTime = "", lsCancelFromDate = "", lsChangeFromDate = "", lsgFromDate = "", lsProRatedDays=0;
            var loConfig = { "purchase": datesplittocomma(""), "cancel": datesplittocomma("") };
            var lbCancelAllowed = false;
            var lsCutoffStart = CutoffStartTime;
            if (poConfig != null && poConfig != "") {
                var loConfigJSON = poConfig;
                lsCurrentDateTime = CurrentDateTime;
                lsFromDate = kendo.toString(datesplittocomma(TermDate), "yyyy-MM-dd") + " " + CutoffStartTime;
                lsToDate = kendo.toString(datesplittocomma(TermEndDate), "yyyy-MM-dd") + " " + CutoffStartTime;
                var lsF = datesplittocomma(lsFromDate);
                var lsC = datesplittocomma(lsCurrentDateTime);
                if (lsC > lsF) {
                    lsFromDate = kendo.toString(datesplittocomma(lsCurrentDateTime), "yyyy-MM-dd") + " " + CutoffStartTime;
                }
                /*Cancel Cutoff date*/
                //if (loConfigJSON.Cancellation=="1" && loConfigJSON.CancelCutoff == "1") {
                if (loConfigJSON.Cancellation == "1") {
                    loConfigJSON.CancelCutoffDays = (loConfigJSON.CancelCutoffDays == "" ? 0 : loConfigJSON.CancelCutoffDays);
                    loConfigJSON.CancelCutoffHours = (loConfigJSON.CancelCutoffHours == "" ? "00:00" : kendo.toString(loConfigJSON.CancelCutoffHours, "HH:mm"));
                    var lsCancelDay = parseInt(loConfigJSON.CancelCutoffDays);
                    var lsCancelHourSplit = (loConfigJSON.CancelCutoffHours).split(":");
                    var lsDate = datesplittocomma(lsCurrentDateTime);
                    lsDate.addDays(lsCancelDay);
                    var lsCancelNow = datesplittocomma(lsDate.getFullYear() + '-' + (lsDate.getMonth() + 1) + '-' + (lsDate.getDate()) + 'T' + (lsDate.getHours() + parseInt(lsCancelHourSplit[0])) + ':' + (lsDate.getMinutes() + parseInt(lsCancelHourSplit[1])));
                    //if (lsCancelNow > datesplittocomma(TermDate))
                    //    lsCancelFromDate = kendo.toString(datesplittocomma(lsCancelNow), "yyyy-MM-dd HH:mm");
                    //else
                    //    lsCancelFromDate = kendo.toString(datesplittocomma(TermDate), "yyyy-MM-dd HH:mm");
                    lsCancelFromDate = kendo.toString(datesplittocomma(lsCancelNow), "yyyy-MM-dd HH:mm");
                }
                else {
                    if (loConfigJSON.CancelWholeTermMeal == "1" && !IsClickFrom) {
                        loConfigJSON.CancelCutoffDays = (loConfigJSON.CancelCutoffDays == "" ? 0 : loConfigJSON.CancelCutoffDays);
                        loConfigJSON.CancelCutoffHours = (loConfigJSON.CancelCutoffHours == "" ? "00:00" : kendo.toString(loConfigJSON.CancelCutoffHours, "HH:mm"));
                        var lsCancelDay = parseInt(loConfigJSON.CancelCutoffDays);
                        var lsCancelHourSplit = (loConfigJSON.CancelCutoffHours).split(":");
                        var lsDate = datesplittocomma(lsCurrentDateTime);
                        lsDate.addDays(lsCancelDay);
                        var lsCancelNow = datesplittocomma(lsDate.getFullYear() + '-' + (lsDate.getMonth() + 1) + '-' + (lsDate.getDate()) + 'T' + (lsDate.getHours() + parseInt(lsCancelHourSplit[0])) + ':' + (lsDate.getMinutes() + parseInt(lsCancelHourSplit[1])));
                        lsCancelFromDate = kendo.toString(datesplittocomma(lsCancelNow), "yyyy-MM-dd HH:mm");
                    }
                    else {
                        if (IsClickFrom) {
                            var lsNewTermEnd = datesplittocomma(TermEndDate);
                            lsNewTermEnd.addDays(1);
                            lsCancelFromDate = kendo.toString(datesplittocomma(lsNewTermEnd), "yyyy-MM-dd") + " " + lsCutoffStart;
                        }
                        else {
                            lsCancelFromDate = kendo.toString(datesplittocomma(lsCurrentDateTime), "yyyy-MM-dd") + " " + lsCutoffStart;
                        }
                    }
                }

 

                lbCancelAllowed = loConfigJSON.Cancellation == '1' ? true : false;
                if (!lbCancelAllowed)
                    lbCancelAllowed = loConfigJSON.CancelWholeTermMeal == '1' ? true : false;

 

                /*End Cancel Cutoff date*/
                /*Change Cutoff date*/
                if (loConfigJSON.MenuChangeCutoff == "1") {
                    loConfigJSON.MenuChangeCutoffDays = (loConfigJSON.MenuChangeCutoffDays == "" ? 0 : loConfigJSON.MenuChangeCutoffDays);
                    loConfigJSON.MenuChangeCutoffHours = (loConfigJSON.MenuChangeCutoffHours == "" ? "00:00" : kendo.toString(loConfigJSON.MenuChangeCutoffHours, "HH:mm"));
                    var lsChangeDay = parseInt(loConfigJSON.MenuChangeCutoffDays);
                    var lsChangeHourSplit = (loConfigJSON.MenuChangeCutoffHours).split(":");
                    var lsDate = datesplittocomma(lsCurrentDateTime);
                    lsDate.addDays(parseInt(loConfigJSON.MenuChangeCutoffDays));
                    var lsChangeNow = datesplittocomma(lsDate.getFullYear() + '-' + (lsDate.getMonth() + 1) + '-' + (lsDate.getDate()) + 'T' + (lsDate.getHours() + parseInt(lsChangeHourSplit[0])) + ':' + (lsDate.getMinutes() + parseInt(lsChangeHourSplit[1])));
                    lsChangeFromDate = kendo.toString(datesplittocomma(lsChangeNow), "yyyy-MM-dd HH:mm");
                }
                else {
                    lsChangeFromDate = kendo.toString(datesplittocomma(lsCurrentDateTime), "yyyy-MM-dd") + " " + lsCutoffStart;
                }
                /*End Change Cutoff date*/
                if (loConfigJSON.BPurchaseCutoff == "1") {
                    loConfigJSON.BPurchaseCutoffDays = (loConfigJSON.BPurchaseCutoffDays == "" ? 0 : loConfigJSON.BPurchaseCutoffDays);
                    loConfigJSON.BPurchaseCutoffHours = (loConfigJSON.BPurchaseCutoffHours == "" ? "00:00" : kendo.toString(loConfigJSON.BPurchaseCutoffHours, "HH:mm"));
                    var lsHourSplit = (loConfigJSON.BPurchaseCutoffHours).split(":");
                    var lsDate = datesplittocomma(lsCurrentDateTime);
                    lsDate.addDays(parseInt(loConfigJSON.BPurchaseCutoffDays));
                    var lsNow = datesplittocomma(lsDate.getFullYear() + '-' + (lsDate.getMonth() + 1) + '-' + (lsDate.getDate()) + 'T' + (lsDate.getHours() + parseInt(lsHourSplit[0])) + ':' + (lsDate.getMinutes() + parseInt(lsHourSplit[1])));
                    lsgFromDate = kendo.toString(datesplittocomma(lsNow), "yyyy-MM-dd HH:mm");
                }
                else{
                    lsgFromDate = kendo.toString(datesplittocomma(lsCurrentDateTime), "yyyy-MM-dd HH:mm");
                    if (loConfigJSON.ProRatedCutoff == "1") {
                        lsProRatedDays = parseInt((loConfigJSON.ProRateCutoffNoofDays == "" || loConfigJSON.ProRateCutoffNoofDays == "null" || loConfigJSON.ProRateCutoffNoofDays == null ? "0" : loConfigJSON.ProRateCutoffNoofDays));
                    }
                }
                loConfig.FromDateTime = lsFromDate;
                loConfig.ToDateTime = lsToDate;
                loConfig.purchase = lsgFromDate;
                loConfig.cancel = lsCancelFromDate;
                loConfig.change = lsChangeFromDate;
                loConfig.proRatedDays = lsProRatedDays;
                loConfig.isCancelAllowed = lbCancelAllowed;
                loConfig.CancelCutoff = loConfigJSON.CancelCutoff;
                loConfig.CancelWholeTermMeal = loConfigJSON.CancelWholeTermMeal;
                loConfig.BPurchaseCutoff = loConfigJSON.BPurchaseCutoff;
                loConfig.CancelAfterTermStart = loConfigJSON.CancelAfterTermStart;
            }
            return loConfig;
        }
       

 datesplittocomma(psDate) {

        try{

            var lsDate = "";

            var lsDateOnly = "", lsDateTimeOnly = "";

            if (typeof (psDate) == "undefined") {

                psDate = new DateT();

            }

            else if (psDate == "" || psDate == "null" || psDate==null) {

                psDate = new Date();

            }

            if (typeof (psDate) == "object") {

                psDate = kendo.toString(psDate,"yyyy-MM-dd HH:mm:ss");

            }

            if (psDate.indexOf("T")>=0) {

                lsDate = psDate.split("T");

            }

            else if (psDate.indexOf(" ") >= 0) {

                lsDate = psDate.split(" ");

            }

            else {

                lsDate = psDate.split(" ");

            }

            var lsYear = 0, lsMonth = 0, lsDay = 0, lsHours = 0, lsMins = 0, lsSec = 0;

            lsDateOnly = lsDate[0];

            if (lsDate.length > 1) {

                lsDateTimeOnly = (lsDate[1]).split(":");

                lsHours = (lsDateTimeOnly[0] != undefined && lsDateTimeOnly[0] != "" ? lsDateTimeOnly[0] : 0);

                lsMins = (lsDateTimeOnly[1] != undefined && lsDateTimeOnly[1] != "" ? lsDateTimeOnly[1] : 0);

                lsSec = (lsDateTimeOnly[2] != undefined && lsDateTimeOnly[2] != "" ? lsDateTimeOnly[2] : 0);

            }

            var lsDateSplit = lsDateOnly.split("-");

            lsYear = (lsDateSplit[0] != undefined && lsDateSplit[0] != "" ? lsDateSplit[0] : 0);

            lsMonth = (lsDateSplit[1] != undefined && lsDateSplit[1] != "" ? lsDateSplit[1] : 0);

            lsDay = (lsDateSplit[2] != undefined && lsDateSplit[2] != "" ? lsDateSplit[2] : 0);

            return new Date(lsYear, lsMonth-1, lsDay, lsHours, lsMins, lsSec);

        }

        catch (ex) {

            //console.log("Date Formmat "+ex.toString());

        }

    }
 */
}
