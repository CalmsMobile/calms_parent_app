import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:calms_parent_latest/common/app_settings.dart';
import 'package:calms_parent_latest/common/common_api.dart';
import 'package:calms_parent_latest/common/my_shared_pref.dart';
import 'package:calms_parent_latest/common/util/common_funtions.dart';
import 'package:calms_parent_latest/common/widgets/common.dart';
import 'package:calms_parent_latest/ui/screens/meals/meal_menu_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../ui/screens/home/Home.dart';
import '../alert_dialog.dart';
import '../date_util.dart';

class MySettingsListener with ChangeNotifier {
  var _settingDetails;
  var _driverDetails;
  List _familyList = [];
  List _familyListWithoutParent = [];
  List _dashboardMenuList = [];

  List _dashboardSpendingList = [];
  List _dashboardRecentActivityList = [];
  List _dashboardOutStandingList = [];
  List _NotificationCategoryList = [];

  List _calendarHolidaysList = [];
  List _calendarAttendanceList = [];
  List _calendarTransactionList = [];

  List _topupMembersList = [];
  List _paymentProvidersList = [];
  double _topupTotal = 0.00;
  List _topupHeader = [];
  List _topupDetails = [];

  List _poSettings = [];
  List _poTypesList = [];
  List _poPackagesList = [];
  late Map<dynamic, List<dynamic>> _poList;
  List _cartList = [];
  List _finalCartList = [];
  List _finalCartListForBilling = [];
  double _cartTotal = 0;

  List _mealsList = [];
  List _mealsCtgryList = [];

  int _familyPos = 0;
  List _notificationList = [];
  List _notificationCategoryList = [];
  List _notificationMembersList = [];

  var _appTheme;

  UnmodifiableListView<dynamic> get familyList =>
      UnmodifiableListView(_familyList);
  UnmodifiableListView<dynamic> get familyListWithoutParent =>
      UnmodifiableListView(_familyListWithoutParent);
  get familyPos => _familyPos;
  pageSwiped(int pos) {
    _familyPos = pos;
    print("*pos* ${pos.toString()} == ${familyList.length.toString()}");
  }

  UnmodifiableListView<dynamic> get dashboardMenuList =>
      UnmodifiableListView(_dashboardMenuList);
  get dashboardMenuListsize => _dashboardMenuList.length;

  UnmodifiableListView<dynamic> get dashboardSpendingList =>
      UnmodifiableListView(_dashboardSpendingList);

  UnmodifiableListView<dynamic> get dashboardRecentActivityList =>
      UnmodifiableListView(_dashboardRecentActivityList);

  UnmodifiableListView<dynamic> get dashboardOutStandingList =>
      UnmodifiableListView(_dashboardOutStandingList);

  UnmodifiableListView<dynamic> get NotificationCategoryList =>
      UnmodifiableListView(_NotificationCategoryList);

  UnmodifiableListView<dynamic> get notificationList =>
      UnmodifiableListView(_notificationList);
  get size => _notificationList.length;

  UnmodifiableListView<dynamic> get calendarHolidaysList =>
      UnmodifiableListView(_calendarHolidaysList);
  UnmodifiableListView<dynamic> get calendarAttendanceList =>
      UnmodifiableListView(_calendarAttendanceList);
  UnmodifiableListView<dynamic> get calendarTransactionList =>
      UnmodifiableListView(_calendarTransactionList);

  UnmodifiableListView<dynamic> get topupMembersList =>
      UnmodifiableListView(_topupMembersList);
  UnmodifiableListView<dynamic> get paymentProvidersList =>
      UnmodifiableListView(_paymentProvidersList);
  get topupTotal => _topupTotal;
  UnmodifiableListView<dynamic> get topupHeader =>
      UnmodifiableListView(_topupHeader);
  UnmodifiableListView<dynamic> get topupDetails =>
      UnmodifiableListView(_topupDetails);

  UnmodifiableListView<dynamic> get poSettings =>
      UnmodifiableListView(_poSettings);
  UnmodifiableListView<dynamic> get poTypesList =>
      UnmodifiableListView(_poTypesList);
  UnmodifiableListView<dynamic> get poPackagesList =>
      UnmodifiableListView(_poPackagesList);
  get poList => _poList;

  UnmodifiableListView<dynamic> get cartList => UnmodifiableListView(_cartList);
  UnmodifiableListView<dynamic> get finalCartList =>
      UnmodifiableListView(_finalCartList);
  get cartTotal => _cartTotal;
  UnmodifiableListView<dynamic> get finalCartListForBilling =>
      UnmodifiableListView(_finalCartListForBilling);

  UnmodifiableListView<dynamic> get mealsList =>
      UnmodifiableListView(_mealsList);
  UnmodifiableListView<dynamic> get mealsCtgryList =>
      UnmodifiableListView(_mealsCtgryList);

  UnmodifiableListView<dynamic> get notificationCategoryList =>
      UnmodifiableListView(_notificationCategoryList);

  UnmodifiableListView<dynamic> get notificationMembersList =>
      UnmodifiableListView(_notificationMembersList);

  UnmodifiableMapView get mysettingDetails =>
      UnmodifiableMapView(_settingDetails);

  UnmodifiableMapView get mydriverDetails =>
      UnmodifiableMapView(_driverDetails == null ? {} : _driverDetails);

  UnmodifiableMapView get appTheme => UnmodifiableMapView(_appTheme);

  updateEntryToDashboardFamilyList(List familyList, loginUserSeqId) {
    _familyList = familyList;
    int parentIndex = familyList
        .indexWhere((element) => element['UserSeqId'] == loginUserSeqId);
    if (parentIndex > -1) _familyPos = parentIndex;
    _familyListWithoutParent =
        CommonFunctions.getChildListFromFamilyList(familyList);
    notifyListeners();
  }

  updateEntryToDashboardMenuList(List menuList) {
    _dashboardMenuList = menuList;
    notifyListeners();
  }

  updateDashBoardList(
      List dashboardSpendingList,
      List dashboardRecentActivityList,
      List dashboardOutStandingList,
      List NotificationCategoryList) {
    this._dashboardSpendingList = dashboardSpendingList;
    this._dashboardRecentActivityList = dashboardRecentActivityList;
    this._dashboardOutStandingList = dashboardOutStandingList;
    this._NotificationCategoryList = NotificationCategoryList;
    notifyListeners();
  }

  updateAppThemeData(themeData, context) async {
    this._appTheme = themeData;
    MySharedPref()
        .saveData(jsonEncode(this._appTheme), AppSettings.Sp_AppTheme);
    String AppTheme = await MySharedPref().getData(AppSettings.Sp_AppTheme);
    var AppTheme_ = jsonDecode(AppTheme);
    if (context != null)
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    print(AppTheme_);
    notifyListeners();
  }

  updateGetCalendarData(List calendarHolidaysList, List calendarAttendanceList,
      List calendarTransactionList) {
    _calendarHolidaysList = calendarHolidaysList;
    _calendarAttendanceList = calendarAttendanceList;
    _calendarTransactionList = calendarTransactionList;
    notifyListeners();
  }

  updateTopupMembersList(List topupMembersList) {
    _topupMembersList = topupMembersList;

    _topupTotal = 0;
    _topupMembersList.forEach((val) {
      if (val['Amount'] != null) _topupTotal += val['Amount'];
    });
    print(_topupMembersList);
    notifyListeners();
  }

  updateTopupHeaderAndDetails(
      BuildContext context, gatewayDetail, profileData, paymentFor, AppTheme_) {
    _topupHeader = [];
    _topupDetails = [];
    for (int i = 0; i < topupMembersList.length; i++) {
      if (topupMembersList[i]['Amount'] != null &&
          topupMembersList[i]['Amount'] > 0) {
        _topupHeader.add({
          "Amount": topupMembersList[i]['Amount'],
          "Discount": "0.00",
          "GST_Type": gatewayDetail['IsGst'] ? gatewayDetail['GstType'] : null,
          "Gst": gatewayDetail['IsGst']
              ? calTopupGst(topupMembersList[i]['Amount'],
                  gatewayDetail['GstType'], gatewayDetail['GstPercentage'])
              : 0,
          "GstPerc":
              gatewayDetail['IsGst'] ? gatewayDetail['GstPercentage'] : null,
          "RefUserSeqId": topupMembersList[i]['UserSeqId']
        });
        _topupDetails.add({
          "RefUserSeqId": topupMembersList[i]['UserSeqId'],
          "MemberName": topupMembersList[i]['Name'],
          "Amount": topupMembersList[i]['Amount'],
          "Gst": gatewayDetail['IsGst']
              ? calTopupGst(topupMembersList[i]['Amount'],
                  gatewayDetail['GstType'], gatewayDetail['GstPercentage'])
              : 0,
          "GST_Type": gatewayDetail['IsGst'] ? gatewayDetail['GstType'] : null,
          "GstPerc":
              gatewayDetail['IsGst'] ? gatewayDetail['GstPercentage'] : null,
          "Discount": 0,
          "ItemSeqId": "null",
          "Category": "",
          "OldBalance": 0
        });
      }
    }
    print("===========topupHeader===========");
    print(jsonEncode(topupHeader));
    print("==========topupDetails============");
    print(jsonEncode(topupDetails));
    Navigator.of(context).pop();
    CommonUtil().MakeTransaction(context, topupHeader, topupDetails,
        gatewayDetail, profileData, 0, 0, paymentFor, AppTheme_);
  }

  updateTopupPaymentProvidersList(List paymentProvidersList) {
    paymentProvidersList.removeWhere((element) => element['IsWallet'] == 1);
    _paymentProvidersList = paymentProvidersList;
    print("_paymentProvidersList updated");
  }

  updateMealOrderPaymentProvidersList(List paymentProvidersList) {
    //paymentProvidersList.removeWhere((element) => element['IsWallet'] == 1);
    _paymentProvidersList = paymentProvidersList;
    print("_paymentProvidersList updated");
  }

  updatePOConfigForUser(
      List poSettings, List poTypesList, List poPackagesList, UserSeqId) {
    _poSettings = poSettings;
    _poPackagesList = poPackagesList;
    for (int i = 0; poTypesList.length > i; i++) {
      if (_cartList.length > 0 &&
          poTypesList[i]['PreOrderType'] == 'Terms' &&
          _cartList.contains(CommonFunctions.getPoTermCartData(
              UserSeqId,
              poTypesList[i]['POTypeConfigSeqId'],
              poTypesList[i]['PackageSeqId'])))
        poTypesList[i]['addedToCart'] = true;
      else
        poTypesList[i]['addedToCart'] = false;
    }
    _poList =
        poTypesList.groupListsBy((element) => element['POTypeConfigSeqId']);
    _poTypesList = [];
    _poList.values.forEachIndexed((index, element) {
      _poTypesList.add(element);
    });
    if (_cartList.length > 0) {
      print("========================");
    }

    /*  print("========================");
    print(_poList);
    print("========================"); */
    notifyListeners();
  }

  updatePoTypePackageCartStatus(
      int i1, int i2, isDelete, UserSeqId, context) async {
    var currentDate = DateUtil().convertDateNow(DateTime.now(), "yyyy/MM/dd");
    var cartAdded = await MySharedPref().getData(AppSettings.Sp_cartAddedDate);

    if (cartAdded != currentDate) {
      clearCartListAfterPayment();
      MyCustomAlertDialog().showToast(context, "Cleared old cart records");
    }
    if (_cartList.isEmpty) {
      MySharedPref().saveData(currentDate, AppSettings.Sp_cartAddedDate);
      print(currentDate);
    }
    for (var ip = 0; ip < _poTypesList[i1].length; ip++) {
      _poTypesList[i1][ip]['addedToCart'] = false;
    }
    String cartData = CommonFunctions.getPoTermCartData(
        UserSeqId,
        poTypesList[i1][i2]['POTypeConfigSeqId'],
        poTypesList[i1][i2]['PackageSeqId']);
    if (isDelete) {
      _poTypesList[i1][i2]['addedToCart'] = false;
      _cartList.remove(cartData);
    } else {
      _poTypesList[i1][i2]['addedToCart'] = true;
      for (var i = 0; i < _cartList.length; i++) {
        if (_cartList[i].toString().contains(
            "PO_${UserSeqId.toInt()}_-0_1900-01-01_0_0_${_poTypesList[i1][i2]['POTypeConfigSeqId'].toInt()}_")) {
          _cartList.removeAt(i);
        }
      }
      _cartList.add(cartData);
    }

    print(_cartList);
    notifyListeners();
  }

  updategetMealItemsForUser(
      BuildContext context,
      List mealsList,
      List mealsCtgryList,
      UserSeqId,
      poTypesList,
      CurrencyCode,
      imgBaseUrl,
      profileData,
      AppTheme_,
      poSetting,isReload) {
        if(isReload){

notifyListeners();
        }else{
if (mealsList.length > 0 && poTypesList['PreOrderType'] == "Daily") {
      for (var i = 0; i < mealsList.length; i++) {
        if (_cartList.contains(CommonFunctions.getPoDailyMealCartData(
            UserSeqId,
            mealsList[i]['ItemSeqId'],
            mealsList[i]['ViewDate'],
            mealsList[i]['ItemType'],
            poTypesList['POTypeConfigSeqId']))) {
          mealsList[i]['addedToCart'] = true;
        } else
          mealsList[i]['addedToCart'] = false;
      }
    }
    _mealsList = mealsList;
    _mealsCtgryList = mealsCtgryList;
    var arguments = {
      "mealsList": mealsList,
      "mealsCtgryList": mealsCtgryList,
      "UserSeqId": UserSeqId,
      "poTypesList": poTypesList,
      "CurrencyCode": CurrencyCode,
      "imgBaseUrl": imgBaseUrl,
      "profileData": profileData,
      "familyListWithoutParent":familyListWithoutParent
    };
    if (mealsList.isNotEmpty)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MealMenuPage(arguments, AppTheme_, poSetting)));
        }
    
    //notifyListeners();
  }

  updatePoTypeMealsCartStatus(isDelete, UserSeqId, mealData, poTypesList,
      context, isSingleSelection) async {
    var currentDate = DateUtil().convertDateNow(DateTime.now(), "yyyy/MM/dd");
    var cartAdded = await MySharedPref().getData(AppSettings.Sp_cartAddedDate);

    if (cartAdded != currentDate) {
      clearCartListAfterPayment();
      MyCustomAlertDialog().showToast(context, "Cleared old cart records");
    }
    if (_cartList.isEmpty) {
      MySharedPref().saveData(currentDate, AppSettings.Sp_cartAddedDate);
      print(currentDate);
    }
    String cartData = CommonFunctions.getPoDailyMealCartData(
        UserSeqId,
        mealData['ItemSeqId'],
        mealData['ViewDate'],
        mealData['ItemType'],
        poTypesList['POTypeConfigSeqId']);
    /* if (isDelete) {
      _cartList.remove(cartData);
    } else {
      _cartList.add(cartData);
    } */
    if (isSingleSelection) {
      if (isDelete)
        _cartList.remove(cartData);
      else {
        for (var i = 0; i < _cartList.length; i++) {
          /* if(_cartList[i].contains(mealData['ViewDate']) &&
              _cartList[i].contains(mealData['ItemType']))
              _cartList.removeAt(i); */
          if (_cartList[i].contains(UserSeqId.toInt().toString()) &&
              _cartList[i].contains(mealData['ViewDate']) &&
              _cartList[i].contains(mealData['ItemType']) &&
              _cartList[i].contains(
                  poTypesList['POTypeConfigSeqId'].toInt().toString()))
            _cartList.removeAt(i);
        }
        _cartList.add(cartData);
      }
    } else {
      if (isDelete) {
        _cartList.remove(cartData);
      } else {
        _cartList.add(cartData);
      }
    }

    print(_cartList);

    notifyListeners();
  }

  updatePoTypeMeals(UserSeqId, mealData, poTypesList) {
    notifyListeners();
  }

  updateMealsInFinalCartList(List mealsList) {
    for (var i = 0; i < mealsList.length; i++) {
      var f = familyList
          .where(
              (element) => element['UserSeqId'] == mealsList[i]['RefUserSeqId'])
          .toList();
      mealsList[i]['isSelected'] = false;
      mealsList[i]['member'] = f;
    }

    _finalCartList.addAll(mealsList);

    notifyListeners();
  }

  updatePackagesInFinalCartList(List packaList, List poPackagesList) {
    for (var i = 0; i < packaList.length; i++) {
      var f = familyList
          .where(
              (element) => element['UserSeqId'] == packaList[i]['RefUserSeqId'])
          .toList();
      packaList[i]['isSelected'] = false;
      packaList[i]['member'] = f;
      packaList[i]['SellingPrice'] = CommonFunctions.getProRatedAmount(
          packaList[i]['PackageSeqId'],
          packaList[i]['ConfigJSON'],
          packaList[i]['PerDayAmt'],
          packaList[i]['Amount'],
          poPackagesList);
    }

    _finalCartList.addAll(packaList);

    notifyListeners();
  }

  clearFinalCartList() {
    _cartTotal = 0;
    _finalCartList = [];
    _finalCartListForBilling = [];
    notifyListeners();
  }

  clearCartListAfterPayment() {
    _cartList = [];
    MySharedPref().saveData('', AppSettings.Sp_cartAddedDate);
    notifyListeners();
  }

  Future<void> removeFromCart(finalCartList, List flist) async {
   var lcopy = [...flist];
   print("------lcopy-------");
   print(lcopy);
   lcopy.remove(finalCartList);
   print("------lcopy deleted-------");
   print(lcopy);
   print("----------------");
    print("cartlist-------");
    print(_cartList);
    print("finalCartList-------");
    print(finalCartList);
    print(_finalCartList);
    String cartData = "";
    if (finalCartList['PreOrderType'] == "Daily")
      cartData = CommonFunctions.getPoDailyMealCartData(
          finalCartList['RefUserSeqId'],
          finalCartList['ItemSeqId'],
          finalCartList['PurchaseDate'].toString().substring(0, 10),
          finalCartList['ItemFor'],
          finalCartList['RefPOTypeConfigSeqId']);
    if (finalCartList['PreOrderType'] == "Terms")
      cartData = CommonFunctions.getPoTermCartData(
          finalCartList['RefUserSeqId'],
          finalCartList['RefPOTypeConfigSeqId'],
          finalCartList['PackageSeqId']);
    print(cartData);
    
    _finalCartList = lcopy;
    _cartList.remove(cartData);

    // _finalCartList.removeWhere(((element) =>element['RowId'] == finalCartList['RowId'] ));

    print("=========cartlist-------");
    print(_cartList);
    print("==========_finalCartList-------");
    print(_finalCartList);
    if (_cartList.isEmpty)
      MySharedPref().saveData('', AppSettings.Sp_cartAddedDate);
    notifyListeners();
    //updateSelectedOrderCalculateTotal(_finalCartList);
  }

  updateSelectedOrderCalculateTotal(List updatedCartList) {
    _finalCartList = updatedCartList;
    _cartTotal = 0;
    _finalCartListForBilling = [];
    _finalCartList.forEach((val) {
      if (val['isSelected']) {
        /* if (val['SellingPrice'] != null) _cartTotal += val['SellingPrice'];
        if (val['Amount'] != null) _cartTotal += val['Amount']; */
        _cartTotal += val['SellingPrice'];
        _finalCartListForBilling.add(val);
      }
    });
    print("=====finalCartListForBilling=====");
    print(_finalCartListForBilling);
    print("=====End=====");
    print("=====finalCartList=====");
    print(_finalCartList);
    print("=====End=====");
    notifyListeners();
  }

  updateOrderHeaderAndDetails(BuildContext context, gatewayDetail, profileData,
      IsWallet, Balance, paymentFor, AppTheme_) {
    List orderHeader = [];
    List orderDetails = [];
    String currenFiltertDate =
        DateFormat("yyyy-MM-dd").format(DateTime.now()).replaceAll("-", "");
    var objHeader = {};
    for (var item in finalCartListForBilling) {
      int index = -1;
      index = orderHeader.indexWhere(
          (element) => element['RefUserSeqId'] == item['RefUserSeqId']);
      print("index " + index.toString());
      if (index > -1) {
        orderHeader[index]['Amount'] =
            orderHeader[index]['Amount'] + item['SellingPrice'];
      } else {
        objHeader = {
          "Amount": item['SellingPrice'],
          "Discount": 0,
          "GST_Type": "",
          "Gst": 0,
          "GstPerc": 0,
          "RefUserSeqId": item['RefUserSeqId'],
          "RefPOTypeConfigSeqId": item['RefPOTypeConfigSeqId']
        };
        orderHeader.add(objHeader);
      }
    }
    print(orderHeader);
    List finalList = [];

    for (var item in finalCartListForBilling) {
      if (item['PreOrderType'] == "Terms") {
        var objTerm = {
          "Amount": item['Amount'],
          "PackageSeqId": item['PackageSeqId'],
          "RefPOTypeConfigSeqId": item['RefPOTypeConfigSeqId'],
          "Name": item['Name'],
          "PreOrderType": item['PreOrderType'],
          "PerDayAmt": item['PerDayAmt'],
          "ConfigJSON": item['ConfigJSON'],
          "RefUserSeqId": item['RefUserSeqId'],
          "PurchaseDate": item['PurchaseDate'],
          "ItemSeqId": "0",
          "ItemFor": item['ItemFor'],
          "Category": "",
          "SellingPrice": item['SellingPrice'],
          "IsAddon": "0",
          "Gst": 0,
          "RowId": 0,
          "Discount": 0,
          "GST_Percent": 0,
          "GST_Type": "",
          "FilterDate": item['FilterDate'],
          "Remarks": "",
          "lsCheckout": 1
        };
        orderDetails.add(objTerm);
      } else {
        var objDaily = {
          "ItemSeqId": item['ItemSeqId'],
          "Name": item['Name'],
          "SellingPrice": item['SellingPrice'],
          "GST_Percent": item['GST_Percent'],
          "GST_Type": item['GST_Type'],
          "RefItemType": item['RefItemType'],
          "AvailableOn": item['AvailableOn'],
          "ItemType": item['ItemType'],
          "ItemStyle": item['ItemStyle'],
          "RefPOTypeConfigSeqId": item['RefPOTypeConfigSeqId'],
          "RefMerchantSeqId": item['RefMerchantSeqId'],
          "RefUserSeqId": item['RefUserSeqId'],
          "PurchaseDate": item['PurchaseDate'],
          "ItemFor": item['ItemFor'],
          "Category": item['ItemType'],
          "IsAddon": "0",
          "Gst": 0,
          "RowId": 0,
          "Discount": 0,
          "PackageSeqId": 0,
          "FilterDate": item['FilterDate'],
          "Remarks": "",
          "lsCheckout": 1
        };
        orderDetails.add(objDaily);
      }
    }
    print("===========orderHeader===========");
    print(jsonEncode(orderHeader));
    print("==========orderDetails============");
    print(jsonEncode(orderDetails));
    Navigator.of(context).pop();
    CommonUtil().MakeTransaction(context, orderHeader, orderDetails,
        gatewayDetail, profileData, IsWallet, Balance, paymentFor, AppTheme_);
  }

  updateSettings(var settingDetails) {
    _settingDetails = settingDetails;
    notifyListeners();
  }

  updateDriverDetails(var driverDetails) {
    List<dynamic> tableList = driverDetails['Table'];
    Map<String, dynamic> tableObj = tableList[0];
    if (tableObj['Code'] == 10) {
      _driverDetails = driverDetails['Table1'][0];
    }

    notifyListeners();
  }

  updateNotifiactionList(Type, List notiListClone, int startPosition,
      List familyList, List categoryList) {
    //if (startPosition == 0) {
    _notificationList = notiListClone;
    print("_notificationList " + _notificationList.toString());
    /* } else {
      _notificationList.addAll(notiListClone);
    } */
    //if (Type != "filter") {
    if (familyList != null) _notificationMembersList = familyList;
    //if (categoryList != null) _notificationCategoryList = categoryList;
    //}

    notifyListeners();
  }

  clearNotificationList() {
    _notificationList.clear();
    notifyListeners();
  }

  updateNotifiactionItem(int pos) {
    if (pos > -1) {
      for (int i = 0; i < _notificationList.length; i++) {
        if (i == pos) {
          _notificationList[i]["IsRead"] = true;
        }
      }
    }
    notifyListeners();
  }

  removeNotification(pnHistory) {
    _notificationList.removeWhere((item) => item["PNHistory"] == pnHistory);
    notifyListeners();
  }
}
