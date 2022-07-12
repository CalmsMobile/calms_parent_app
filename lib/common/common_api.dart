import 'dart:convert';
import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/app_settings.dart';
import 'package:calms_parent/common/listener/settings_listener.dart';
import 'package:calms_parent/common/my_shared_pref.dart';
import 'package:calms_parent/provider/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonUtil {
  var driverDetails_;
  var driverData_;

  updateSettings(var settings, BuildContext context) {
    context.read<MySettingsListener>().updateSettings(settings);
  }

  updateDriverDetailsSettings(var driverDetails, BuildContext context) {
    context.read<MySettingsListener>().updateDriverDetails(driverDetails);
  }

  Future<void> getAllNotification(
      BuildContext context, int startPosition) async {
    String driverDetails =
        await MySharedPref().getData(AppSettings.parentDetails);
    if (driverDetails != "") {
      var driverDataList_ = jsonDecode(driverDetails);
      List<dynamic> tableList = driverDataList_['Table'];
      Map<String, dynamic> tableObj = tableList[0];
      if (tableObj['Code'] == 10) {
        var driverData_ = driverDataList_['Table1'][0];
        var data = {
          "DriverSeqId": driverData_["DriverSeqId"],
          "Limit": 10,
          "Start": startPosition,
        };

        Future<Map<String, dynamic>> res = RestApiProvider().postMethod(
            data,
            '',
            AppSettings.getAllNotification,
            context,
            startPosition == 0 ? true : false,
            true);
        res
            .then((value) => {handleApiResponse(value, context, startPosition)})
            .onError(
                (error, stackTrace) => {handleNotiApiError(error, context)});
      }
    }
  }

  handleApiResponse(response, BuildContext context, int startPosition) {
    if (response.containsKey("Code") && response['Code'] > 10) {
      print("Error in response");
      MyCustomAlertDialog().showCustomAlert(
          context, "Notification", response["Description"], true, () {
        Navigator.pop(context);
      }, null);
    } else {
      context
          .read<MySettingsListener>()
          .updateNotifiactionList(response['Table2'], startPosition);
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
