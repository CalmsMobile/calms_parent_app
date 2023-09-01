import 'dart:convert';
import 'dart:developer';
import 'package:calms_parent_latest/common/widgets/common.dart';
import 'package:calms_parent_latest/ui/screens/payment/topupPayment_page.dart';

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

//ParentApp
  Future<void> getEntryToDashboard(BuildContext context) async {
    var ParamData = {
      "MAppDevSeqId": await MySharedPref().getData(AppSettings.Sp_MAppDevSeqId)
    };
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.EntryToDashboard,
      context,
      false,
    );
    res
        .then((response) => {EntryToDashboardSuccess(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  EntryToDashboardSuccess(BuildContext context, Map<String, dynamic> response) {
    if (response['Table'][0]['code'] == 10 && response['Table1'][0] != null) {
      print("getEntryToDashboard success");
      //familyList = response['Table1'];
      context
          .read<MySettingsListener>()
          .updateEntryToDashboardLists(response['Table1'], response['Table2']);
      if (response['Table3'] != null) {
        MySharedPref().saveData(
            jsonEncode(response['Table3'][0]), AppSettings.Sp_ProfileData);
      }
      getDashboard(
          context,
          response['Table1'][context.read<MySettingsListener>().familyPos]
              ['UserSeqId'],
          response['Table1'][context.read<MySettingsListener>().familyPos]
              ['RefBranchSeqId']);
    }
  }

  Future<void> getDashboard(
      BuildContext context, RefUserSeqId, RefBranchSeqId) async {
    var ParamData = {
      "RefUserSeqId": RefUserSeqId,
      "RefBranchSeqId": RefBranchSeqId
    };
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetDashboard,
      context,
      false,
    );
    res
        .then((response) => {getDashboardSuccess(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  getDashboardSuccess(BuildContext context, Map<String, dynamic> response) {
    if (response['Table'][0]['code'] == 10) {
      print("getDashboard success");
      context.read<MySettingsListener>().updateDashBoardList(
          response['Table1'], response['Table2'], response['Table3']);
    }
  }

  Future<void> getGetCalendarData(
      BuildContext context, RefUserSeqId, RefBranchSeqId, Date) async {
    var ParamData = {
      "RefUserSeqId": RefUserSeqId,
      "RefBranchSeqId": RefBranchSeqId,
      "Date": Date
    };
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetCalendarData,
      context,
      false,
    );
    res
        .then((response) => {getCalendarDataSuccess(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  getCalendarDataSuccess(BuildContext context, Map<String, dynamic> response) {
    if (response['Table'][0]['code'] == 10) {
      print("GetCalendarData success");
      if (response['Table1'] != null || response['Table1'] != [])
        context.read<MySettingsListener>().updateGetCalendarData(
            response['Table1'], response['Table2'], response['Table3']);
    }
  }

  Future<void> getFamilyMemberForTopup(
      context, RefUserSeqId, RefBranchSeqId, RefMemberTypeSeqId) async {
    var ParamData = {
      "RefUserSeqId": RefUserSeqId,
      "RefBranchSeqId": RefBranchSeqId,
      "RefMemberTypeSeqId": RefMemberTypeSeqId
    };
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetFamilyMemberForTopup,
      context,
      false,
    );
    res
        .then((response) => {getFamilyMemberForTopupSuccess(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  getFamilyMemberForTopupSuccess(BuildContext context, response) {
    if (response['Table'][0]['code'] == 10) {
      print("getFamilyMemberForTopupSuccess success");
      if (response['Table1'] != null || response['Table1'] != [])
        context
            .read<MySettingsListener>()
            .updateTopupMembersList(response['Table1']);

      if (response['Table2'] != null || response['Table2'] != [])
        context
            .read<MySettingsListener>()
            .updateTopupPaymentProvidersList(response['Table2']);
    }
  }

  Future<void> getGatewayDetails(context, RefBranchSeqId, RefSettingSeqId,
      topupTotal, profileData) async {
    var ParamData = {
      "RefBranchSeqId": RefBranchSeqId,
      "RefSettingSeqId": RefSettingSeqId
    };
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetGatewayDetails,
      context,
      false,
    );
    res
        .then((response) => {
              getGatewayDetailsSuccess(
                  context, response, topupTotal, profileData)
            })
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  getGatewayDetailsSuccess(
      BuildContext context, response, topupTotal, profileData) async {
    if (response['Table'][0]['code'] == 10) {
      print("getGatewayDetailsSuccess success");
      if (response['Table1'] != null || response['Table1'] != [])
        showCustomPaymentAlert(
            context, response['Table1'][0], topupTotal, profileData);
    }
  }

  Future<void> MakeTransaction(context,TopupHeader,TopupDetails, gatewayDetail,profileData) async {
    var OrderData = {
      "Header": [],
      "Detail": [],
      "StoreHeader": [],
      "StoreDetail": [],
      "ETHeader": [],
      "ETDetails": [],
      "InvoiceHeader": [],
      "InvoiceDetails": [],
      "InvoiceInstallment": [],
      "DonationHeader": [],
      "DonationDetails": [],
      "TopupHeader": TopupHeader,
      "TopupDetails": TopupDetails,
      "MFPData": [],
      "MixedPayment": []
    };
    var ParamData = {
      "OrderData": jsonEncode(OrderData),
      "RefSettingSeqId": gatewayDetail['SettingsSeqId'],
      "RefPayMode": gatewayDetail['PayMode'],
      "BankData": "",
      "NotifyMail": "",
      "MailBody": "",
      "FPXToken": "",
      "Remarks": "",
      "DKPaymentMethod": "",
      "RefUserSeqId": profileData['RefUserSeqId'],
      "RefMemberTypeSeqId": profileData['RefMemberTypeSeqId'],
      "IsTopup": "1",
      "WalletAmount": "0"
    };
    print(ParamData);
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.MakeTransaction,
      context,
      false,
    );
    res
        .then((response) => {
              MakeTransactionSuccess(
                  context, response)
            })
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  MakeTransactionSuccess(
      BuildContext context, response) async {
    if (response['Table'][0]['code'] == "S") {
      print("MakeTransactionSuccess success");
      /* Navigator.of(context).pushNamed('/topupPayment',
                    arguments: response['Table'][0]); */
                    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopupPaymentPage(response['Table'][0]),
          ),
        );
    }
  }

  authorizedPostRequestError(Object? error) {}

//Notification App
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
          false,
          false);
      res
          .then(
              (value) => {handleApiResponse(value, context, startPosition, "")})
          .onError((error, stackTrace) => {handleNotiApiError(error, context)});
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
          false,
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
          false,
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
    print("handleNotiApiError " + error.toString());
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", error.toString(), true, () {
      Navigator.pop(context);
    }, null);
  }
}
