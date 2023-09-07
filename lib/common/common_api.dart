import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:calms_parent_latest/common/widgets/common.dart';
import 'package:calms_parent_latest/ui/screens/payment/topup_payment_webview_page.dart';
import 'package:calms_parent_latest/ui/screens/payment/topup_after_payment_page.dart';
import 'package:flutter/foundation.dart';

import '../ui/screens/home/Home.dart';
import '../ui/screens/meals/meal_menu_page.dart';
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
          .updateEntryToDashboardFamilyList(response['Table1']);

      context
          .read<MySettingsListener>()
          .updateFamilyListWithoutParent(response['Table1']);

      context
          .read<MySettingsListener>()
          .updateEntryToDashboardMenuList(response['Table2']);
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
        .then((response) => {successGetCalendarData(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetCalendarData(BuildContext context, Map<String, dynamic> response) {
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
        .then((response) => {successGetFamilyMemberForTopup(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetFamilyMemberForTopup(BuildContext context, response) {
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

  Future<void> getGatewayDetails(
      context, RefBranchSeqId, RefSettingSeqId, topupTotal, profileData) async {
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
              successGetGatewayDetails(
                  context, response, topupTotal, profileData)
            })
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetGatewayDetails(
      BuildContext context, response, topupTotal, profileData) async {
    if (response['Table'][0]['code'] == 10) {
      print("getGatewayDetailsSuccess success");
      if (response['Table1'] != null || response['Table1'] != [])
        showCustomPaymentAlert(
            context, response['Table1'][0], topupTotal, profileData);
    }
  }

  Future<void> MakeTransaction(
      context, TopupHeader, TopupDetails, gatewayDetail, profileData) async {
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
        .then((response) => {successMakeTransaction(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successMakeTransaction(BuildContext context, response) async {
    if (response['Table'][0]['code'] == "S") {
      print("MakeTransactionSuccess success");
      if (kIsWeb) {
        _showMyDialog(context, response['Table'][0]['PaymentOrderId']);
      } else
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopupPaymentWebviewPage(response['Table'][0]),
          ),
        );
    }
  }

  Future<void> _showMyDialog(BuildContext context, PaymentOrderId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Test Payment Alert!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('check after payment success or failure'),
                //Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Check Payment'),
              onPressed: () {
                CommonUtil()
                    .getAfterTopupPaymentSummary(context, PaymentOrderId);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> getAfterTopupPaymentSummary(
      BuildContext context, OrderId) async {
    var ParamData = {"OrderId": OrderId};
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetAfterTopupPaymentSummary,
      context,
      false,
    );
    res
        .then((response) =>
            {successGetAfterTopupPaymentSummary(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetAfterTopupPaymentSummary(BuildContext context, response) async {
    if (response['Table'][0]['OrderId'] != null) {
      print("getAfterTopupPaymentSummarySuccess success");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TopupAfterPaymentPage(response['Table'][0]),
        ),
      );
    }
  }

  Future<void> getPOConfigForUser(context, RefUserSeqId, RefBranchSeqId) async {
    var ParamData = {
      "RefUserSeqId": RefUserSeqId,
      "RefBranchSeqId": RefBranchSeqId
    };
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetPOConfigForUser,
      context,
      false,
    );
    res
        .then((response) =>
            {successGetPOConfigForUser(context, response, RefUserSeqId)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetPOConfigForUser(BuildContext context, response, RefUserSeqId) {
    if (response['Table'][0]['code'] == 10) {
      print("getPOConfigForUserSuccess success");

      context.read<MySettingsListener>().updatePOConfigForUser(
          response['Table1'],
          response['Table2'],
          response['Table3'],
          RefUserSeqId);
    }
  }

  Future<void> getMealItemsForUser(
      context, RefUserSeqId, RefBranchSeqId, poTypesList,CurrencyCode) async {
    var ParamData = {
      "RefBranchSeqId": RefBranchSeqId,
      "RefUserSeqId": RefUserSeqId,
      "FromDate": poTypesList['FromDate'] != null
          ? poTypesList['FromDate'].substring(0, 10)
          : poTypesList['CurrentDateTime'].substring(0, 10),
      "ToDate": poTypesList['ToDate'] != null
          ? poTypesList['ToDate'].substring(0, 10)
          : poTypesList['CurrentDateTime'].substring(0, 10),
      "POTypeConfigSeqId": poTypesList['POTypeConfigSeqId'],
      "MealType": poTypesList['MealType']
    };
    print(ParamData);
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetMealItemsForUser,
      context,
      false,
    );
    res
        .then((response) =>
            {successGetMealItemsForUser(context, response, RefUserSeqId,poTypesList,CurrencyCode)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetMealItemsForUser(BuildContext context, response, RefUserSeqId,poTypesList,CurrencyCode) {
    if (response['Table'][0]['code'] == 10) {
      print("getMealItemsForUser success");

      context.read<MySettingsListener>().updategetMealItemsForUser(
          context, response['Table1'], response['Table2'], RefUserSeqId,poTypesList,CurrencyCode);
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
