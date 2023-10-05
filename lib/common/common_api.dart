import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:calms_parent_latest/common/util/common_funtions.dart';
import 'package:calms_parent_latest/common/widgets/common.dart';
import 'package:calms_parent_latest/ui/screens/meals/details/meal_details.dart';
import 'package:calms_parent_latest/ui/screens/payment/after_payment_page.dart';
import 'package:flutter/foundation.dart';

import '../ui/screens/home/Home.dart';
import '../ui/screens/meals/meal_menu_page.dart';
import '../ui/screens/payment/payment_webview_page.dart';
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
  Future<void> getEntryToDashboard(BuildContext context,UserSeqId) async {
    var ParamData = {
      "MAppDevSeqId": await MySharedPref().getData(AppSettings.Sp_MAppDevSeqId)
    };
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.EntryToDashboard,
      context,
      true,
    );
    res
        .then((response) => {EntryToDashboardSuccess(context, response,UserSeqId)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  EntryToDashboardSuccess(BuildContext context, Map<String, dynamic> response,UserSeqId) {
    if (response['Table'][0]['code'] == 10 && response['Table1'][0] != null) {
      print("getEntryToDashboard success");

      context
          .read<MySettingsListener>()
          .updateEntryToDashboardFamilyList(response['Table1'],UserSeqId);

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
      true,
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
      true,
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
      true,
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

  Future<void> getGatewayDetails(context, RefBranchSeqId, RefSettingSeqId,
      topupTotal, profileData, Balance, IsWallet, paymentFor) async {
    var ParamData = {
      "RefBranchSeqId": RefBranchSeqId,
      "RefSettingSeqId": RefSettingSeqId
    };
    if (IsWallet == 0) {
      Future<Map<String, dynamic>> res =
          RestApiProvider().authorizedPostRequest(
        ParamData,
        AppSettings.GetGatewayDetails,
        context,
        true,
      );
      res
          .then((response) => {
                successGetGatewayDetails(context, response, topupTotal,
                    profileData, IsWallet, Balance, paymentFor)
              })
          .onError((error, stackTrace) => {authorizedPostRequestError(error)});
    } else {
      var WT = {
        "CurrentDate": "2023-09-29T14:38:47.717",
        "SettingsSeqId": RefSettingSeqId,
        "IsGst": false,
        "GstType": null,
        "GstPercentage": null,
        "IsAdminFee": false,
        "AdminTransFee": 0,
        "IsAdminFeeGst": false,
        "AdminGstType": null,
        "AdminGstPercentage": null,
        "TopMinAmt": 1,
        "TopMaxAmt": 1000000,
        "EnvType": 30,
        "EnvName": "Wallet Payment",
        "IsEnvBlock": false,
        "ShutDownType": 0,
        "BlockMsg": "",
        "FromDate": "1900-01-01T00:00:00",
        "ToDate": "1900-01-01T00:00:00",
        "EnableTnC": false,
        "TnC_Desc": "Test Global Payment",
        "PayMode": "WT"
      };

      successGetGatewayDetails(
          context, WT, topupTotal, profileData, IsWallet, Balance, paymentFor);
    }
  }

  successGetGatewayDetails(BuildContext context, response, topupTotal,
      profileData, IsWallet, Balance, paymentFor) async {
    if (IsWallet == 0) {
      if (response['Table'][0]['code'] == 10) {
        print("getGatewayDetailsSuccess success");
        if (response['Table1'] != null || response['Table1'] != [])
          showCustomPaymentAlert(context, response['Table1'][0], topupTotal,
              profileData, IsWallet, Balance, paymentFor);
      }
    } else {
      showCustomPaymentAlert(context, response, topupTotal, profileData,
          IsWallet, Balance, paymentFor);
    }
  }

  Future<void> MakeTransaction(context, Header, Details, gatewayDetail,
      profileData, IsWallet, Balance, paymentFor) async {
    var OrderData = {
      "Header": paymentFor == AppSettings.paymentTypeOrder ? Header : [],
      "Detail": paymentFor == AppSettings.paymentTypeOrder ? Details : [],
      "StoreHeader": [],
      "StoreDetail": [],
      "ETHeader": [],
      "ETDetails": [],
      "InvoiceHeader": [],
      "InvoiceDetails": [],
      "InvoiceInstallment": [],
      "DonationHeader": [],
      "DonationDetails": [],
      "TopupHeader": paymentFor == AppSettings.paymentTypeTopup ? Header : [],
      "TopupDetails": paymentFor == AppSettings.paymentTypeTopup ? Details : [],
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
      true,
    );
    res
        .then((response) =>
            {successMakeTransaction(context, response, paymentFor)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successMakeTransaction(BuildContext context, response, paymentFor) async {
    context.read<MySettingsListener>().clearCartListAfterPayment();
    if (response['Table'][0]['code'] == "S") {
      print("MakeTransactionSuccess success");
      if (response['Table'][0]['PayMode'] == "WT") {
        var res = {
          "Message":"Your Order Id: ${response['Table'][0]['OrderId']} has been confirmed successfully!"
        };
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AfterPaymentPage(res, paymentFor),
        ),
      );
      } else {
        if (kIsWeb) {
          _showMyDialog(
              context, response['Table'][0]['PaymentOrderId'], paymentFor);
        } else
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PaymentWebviewPage(response['Table'][0], paymentFor),
            ),
          );
      }
    }
  }

  Future<void> _showMyDialog(
      BuildContext context, PaymentOrderId, paymentFor) async {
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
                CommonUtil().getAfterTopupPaymentSummary(
                    context, PaymentOrderId, paymentFor);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> getAfterTopupPaymentSummary(
      BuildContext context, OrderId, paymentFor) async {
    var ParamData = {"OrderId": OrderId};
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetAfterTopupPaymentSummary,
      context,
      true,
    );
    res
        .then((response) =>
            {successGetAfterTopupPaymentSummary(context, response, paymentFor)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetAfterTopupPaymentSummary(
      BuildContext context, response, paymentFor) async {
    if (response['Table'][0]['OrderId'] != null) {
      print("getAfterTopupPaymentSummarySuccess success");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AfterPaymentPage(response['Table'][0], paymentFor),
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
      true,
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

  Future<void> getMealItemsForUser(context, RefUserSeqId, RefBranchSeqId,
      poTypesList, CurrencyCode, imgBaseUrl, profileData) async {
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
      true,
    );
    res
        .then((response) => {
              successGetMealItemsForUser(context, response, RefUserSeqId,
                  poTypesList, CurrencyCode, imgBaseUrl, profileData)
            })
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetMealItemsForUser(BuildContext context, response, RefUserSeqId,
      poTypesList, CurrencyCode, imgBaseUrl, profileData) {
    if (response['Table'][0]['code'] == 10) {
      print("getMealItemsForUser success");

      context.read<MySettingsListener>().updategetMealItemsForUser(
          context,
          response['Table1'],
          response['Table2'],
          RefUserSeqId,
          poTypesList,
          CurrencyCode,
          imgBaseUrl,
          profileData);
    }
  }

  Future<void> getMealItemDetail(
      context,
      RefItemSeqId,
      ViewDate,
      addedToCart,
      poTypesList,
      CurrencyCode,
      imgBaseUrl,
      showCart,
      UserSeqId,
      callbackFun,
      mealIndex) async {
    var ParamData = {
      "RefItemSeqId": RefItemSeqId,
      "ViewDate": ViewDate,
      "POTypeConfigSeqId": poTypesList['POTypeConfigSeqId']
    };
    print(ParamData);
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetMealItemDetail,
      context,
      true,
    );
    res
        .then((response) => {
              successGetMealItemDetail(
                  context,
                  response,
                  addedToCart,
                  poTypesList,
                  CurrencyCode,
                  imgBaseUrl,
                  ViewDate,
                  showCart,
                  UserSeqId,
                  callbackFun,
                  mealIndex)
            })
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetMealItemDetail(
      BuildContext context,
      response,
      addedToCart,
      poTypesList,
      CurrencyCode,
      imgBaseUrl,
      ViewDate,
      showCart,
      UserSeqId,
      Function callbackFun,
      mealIndex) {
    if (response['Table'][0]['code'] == 10) {
      print("successGetMealItemDetail");
      response['Table1'][0]['addedToCart'] = addedToCart;
      response['Table1'][0]['ViewDate'] = ViewDate;
      var arguments = {
        "mealInfo": response['Table1'][0],
        "ingredients": response['Table2'],
        "showCart": showCart,
        "ViewDate": ViewDate,
        "poTypesList": poTypesList,
        "CurrencyCode": CurrencyCode,
        "imgBaseUrl": imgBaseUrl,
        "UserSeqId": UserSeqId,
        "mealIndex": mealIndex
      };
      print(arguments['mealInfo'][0]);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MealDetails(arguments, callbackFun)));
    }
  }

  Future<void> getCartPageSettings(BuildContext context, profileData) async {
    var ParamData = {"RefBranchSeqId": profileData['RefBranchSeqId']};
    print(ParamData);
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetCartPageSettings,
      context,
      true,
    );
    res
        .then((response) =>
            {successGetCartPageSettings(context, response, profileData)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetCartPageSettings(BuildContext context, response, profileData) {
    if (response['Table'][0]['code'] == 10 && response['Table1'][0] != null) {
      getGatewayListForCart(context, profileData['RefBranchSeqId'],
          profileData['RefUserSeqId'], profileData['RefMemberTypeSeqId']);
      print("successGetCartPageSettings");
      context.read<MySettingsListener>().clearFinalCartList();
      List cartList = context.read<MySettingsListener>().cartList;
      if (cartList.length > 0) {
        String RefItemSeqId = CommonFunctions.getDailyMealsInCart(cartList);
        String PackageSeqId = CommonFunctions.getTermMealsInCart(cartList);
        if (RefItemSeqId != "")
          getCartDailyMealItems(
              context, profileData['RefBranchSeqId'], cartList, RefItemSeqId);
        if (PackageSeqId != "")
          getCartTermMealItems(
              context, profileData['RefBranchSeqId'], cartList, PackageSeqId);
      }
    }
  }

  Future<void> getCartDailyMealItems(
      BuildContext context, RefBranchSeqId, cartList, RefItemSeqId) async {
    var ParamData = {
      "RefBranchSeqId": RefBranchSeqId,
      "RefItemSeqId": RefItemSeqId
    };
    print(ParamData);
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetCartDailyMealItems,
      context,
      false,
    );
    res
        .then((response) => {successGetCartDailyMealItems(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetCartDailyMealItems(BuildContext context, response) {
    if (response['Table'][0]['code'] == 10) {
      print("successGetCartDailyMealItems");
      context
          .read<MySettingsListener>()
          .updateMealsInFinalCartList(response['Table1']);
    }
  }

  Future<void> getCartTermMealItems(
      BuildContext context, RefBranchSeqId, cartList, RefPackageSeqId) async {
    var ParamData = {
      "RefBranchSeqId": RefBranchSeqId,
      "RefPackageSeqId": RefPackageSeqId
    };
    print(ParamData);
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetCartTermMealItems,
      context,
      false,
    );
    res
        .then((response) => {successGetCartTermMealItems(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successGetCartTermMealItems(BuildContext context, response) {
    if (response['Table'][0]['code'] == 10) {
      print("successGetCartTermMealItems");
      context.read<MySettingsListener>().updatePackagesInFinalCartList(
          response['Table1'], response['Table3']);
    }
  }

  Future<void> getGatewayListForCart(
      context, RefBranchSeqId, RefUserSeqId, RefMemberTypeSeqId) async {
    var ParamData = {
      "RefBranchSeqId": RefBranchSeqId,
      "RefUserSeqId": RefUserSeqId,
      "RefMemberTypeSeqId": RefMemberTypeSeqId,
      "InvPurchase": 0
    };
    print(ParamData);
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.GetGatewayListForCart,
      context,
      false,
    );
    res
        .then((response) => {successgetGatewayListForCart(context, response)})
        .onError((error, stackTrace) => {authorizedPostRequestError(error)});
  }

  successgetGatewayListForCart(BuildContext context, response) {
    if (response['Table'][0]['code'] == 10) {
      print("successgetGatewayListForCart");
      context
          .read<MySettingsListener>()
          .updateMealOrderPaymentProvidersList(response['Table1']);
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
      }, null, "Ok", "");
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
    }, null, "Ok", "");
  }
}
