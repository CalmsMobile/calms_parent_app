import 'dart:convert';
import 'dart:developer';
import '/common/alert_dialog.dart';
import '/common/app_settings.dart';
import '/common/listener/settings_listener.dart';
import '/common/my_shared_pref.dart';
import '/provider/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonUtil {
  var profileData_;
  var driverData_;

  updateSettings(var settings, BuildContext context) {
    context.read<MySettingsListener>().updateSettings(settings);
  }

  updateDriverDetailsSettings(var driverDetails, BuildContext context) {
    context.read<MySettingsListener>().updateDriverDetails(driverDetails);
  }

  Future<void> getAllNotification(BuildContext context, String apiURL,
      int startPosition, profileData, decryptdata) async {
    if (profileData != "") {
      var profileData_ = jsonDecode(profileData);
      print(profileData_);
      Map<String, dynamic> qrJson = jsonDecode(decryptdata);
      var payLoad = {
        "Authorize": {"AuMAppDevSeqId": qrJson['MAppSeqId'], "AuDeviceUID": ""},
        "FamilyId": profileData_['FamilyId'],
        "Offset": 0,
        "Rows": 100
      };
      //debugger();
      print(payLoad.toString());
      Future<Map<String, dynamic>> res = RestApiProvider().postData(
          payLoad,
          qrJson["ApiUrl"],
          AppSettings.GetNotificationList,
          context,
          true,
          false);
      res
          .then(
              (value) => {handleApiResponse(value, context, startPosition, "")})
          .onError((error, stackTrace) => {handleNotiApiError(error, context)});

      /* Future<Map<String, dynamic>> res = RestApiProvider().postMethod(
            payLoad,
            '',
            AppSettings.getAllNotification,
            context,
            startPosition == 0 ? true : false,
            true);
        res
            .then((value) => {handleApiResponse(value, context, startPosition)})
            .onError(
                (error, stackTrace) => {handleNotiApiError(error, context)}); */
    }
  }

  Future<void> getMemberFilterNotification(BuildContext context, String apiURL,
      int startPosition, profileData, decryptdata, userId) async {
    if (profileData != "") {
      var profileData_ = jsonDecode(profileData);
      print(profileData_);
      Map<String, dynamic> qrJson = jsonDecode(decryptdata);
      String familyId = profileData_['FamilyId'];
      //if (userId == 0) {familyId = profileData_['FamilyId'];}

      var payLoad = {
        "Authorize": {"AuMAppDevSeqId": qrJson['MAppSeqId'], "AuDeviceUID": ""},
        "RefUserSeqId": userId,
        "FamilyId": familyId,
        "NotificationType": "",
        "Offset": 0,
        "Rows": 100
      };
      //debugger();
      print(payLoad.toString());
      Future<Map<String, dynamic>> res = RestApiProvider().postData(
          payLoad,
          qrJson["ApiUrl"],
          AppSettings.GetNotificationListWithFilter,
          context,
          true,
          false);
      res
          .then((value) =>
              {handleApiResponse(value, context, startPosition, "filter")})
          .onError((error, stackTrace) => {handleNotiApiError(error, context)});
    }
  }

  Future<void> getCtegoryFilterNotification(BuildContext context, String apiURL,
      int startPosition, profileData, decryptdata, int categoryId) async {
    if (profileData != "") {
      var profileData_ = jsonDecode(profileData);
      print(profileData_);
      Map<String, dynamic> qrJson = jsonDecode(decryptdata);
      String familyId = profileData_['FamilyId'];

      var payLoad = {
        "Authorize": {"AuMAppDevSeqId": qrJson['MAppSeqId'], "AuDeviceUID": ""},
        "RefUserSeqId": 0,
        "FamilyId": familyId,
        "NotificationType": categoryId,
        "Offset": 0,
        "Rows": 100
      };
      //debugger();
      print(payLoad.toString());
      Future<Map<String, dynamic>> res = RestApiProvider().postData(
          payLoad,
          qrJson["ApiUrl"],
          AppSettings.GetNotificationListWithFilter,
          context,
          true,
          false);
      res
          .then((value) =>
              {handleApiResponse(value, context, startPosition, "filter")})
          .onError((error, stackTrace) => {handleNotiApiError(error, context)});
    }
  }

  handleApiResponse(response, BuildContext context, int startPosition, Type) {
    if (response.containsKey("code") && response['code'] > 10) {
      print("Error in response");
      MyCustomAlertDialog().showCustomAlert(
          context, "Notification", response["Description"], true, () {
        Navigator.pop(context);
      }, null);
    } else {
      print("response===" + response['Table2'].toString());
      if (Type == "filter") {
        response['Table3'] = [];
        response['Table4'] = [];
      }
      context.read<MySettingsListener>().updateNotifiactionList(
          Type,
          response['Table2'],
          startPosition,
          response['Table3'],
          response['Table4']);
    }
  }

  handleNotiApiError(error, BuildContext context) {
    print(error);
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
    }, null);
  }
}
