import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:calms_parent_latest/common/common_api.dart';
import 'package:calms_parent_latest/common/util/common_funtions.dart';
import 'package:calms_parent_latest/common/widgets/common.dart';
import 'package:calms_parent_latest/ui/screens/meals/meal_menu_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MySettingsListener with ChangeNotifier {
  var _settingDetails;
  var _driverDetails;
  List _familyList = [];
  List _familyListWithoutParent = [];
  List _dashboardMenuList = [];

  List _dashboardSpendingList = [];
  List _dashboardRecentActivityList = [];
  List _dashboardOutStandingList = [];

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

  UnmodifiableListView<dynamic> get familyList =>
      UnmodifiableListView(_familyList);
  UnmodifiableListView<dynamic> get familyListWithoutParent =>
      UnmodifiableListView(_familyListWithoutParent);
  get familyPos => _familyPos;
  void pageSwiped(int pos) {
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

  updateEntryToDashboardFamilyList(List familyList) {
    _familyList = familyList;

    _familyListWithoutParent =
        CommonFunctions.getChildListFromFamilyList(familyList);
    notifyListeners();
  }

  updateEntryToDashboardMenuList(List menuList) {
    _dashboardMenuList = menuList;
    notifyListeners();
  }

  updateDashBoardList(List dashboardSpendingList,
      List dashboardRecentActivityList, List dashboardOutStandingList) {
    this._dashboardSpendingList = dashboardSpendingList;
    this._dashboardRecentActivityList = dashboardRecentActivityList;
    this._dashboardOutStandingList = dashboardOutStandingList;
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
      BuildContext context, gatewayDetail, profileData, paymentFor) {
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
        gatewayDetail, profileData,0,0, paymentFor);
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
          _cartList.contains(CommonFunctions.getPoCartData(
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

  updatePoTypePackageCartStatus(int i1, int i2, isDelete, UserSeqId) {
    for (var ip = 0; ip < _poTypesList[i1].length; ip++) {
      _poTypesList[i1][ip]['addedToCart'] = false;
    }
    String cartData = CommonFunctions.getPoCartData(
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
            "PO_${UserSeqId}_-0_1900-01-01_0_0_${_poTypesList[i1][i2]['POTypeConfigSeqId']}_")) {
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
      profileData) {
    if (mealsList.length > 0 && poTypesList['PreOrderType'] == "Daily") {
      for (var i = 0; i < mealsList.length; i++) {
        if (_cartList.contains(CommonFunctions.getPoMealCartData(
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
      "profileData": profileData
    };
    if (mealsList.isNotEmpty)
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MealMenuPage(arguments)));
    //notifyListeners();
  }

  updatePoTypeMealsCartStatus(isDelete, UserSeqId, mealData, poTypesList) {
    String cartData = CommonFunctions.getPoMealCartData(
        UserSeqId,
        mealData['ItemSeqId'],
        mealData['ViewDate'],
        mealData['ItemType'],
        poTypesList['POTypeConfigSeqId']);
    if (isDelete) {
      _cartList.remove(cartData);
    } else {
      _cartList.add(cartData);
    }
    print(_cartList);
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
    notifyListeners();
  }

  updateOrderHeaderAndDetails(
      BuildContext context, gatewayDetail, profileData,IsWallet,Balance, paymentFor) {
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
          "FilterDate":
              item['FilterDate'],
          "Remarks": "",
          "lsCheckout": 1
        };
        orderDetails.add(objDaily);
      }

      /*  orderDetails.add([
        {
          "Amount": 361,
          "PackageSeqId": 1016,
          "RefPOTypeConfigSeqId": 10009,
          "Name": "COMBO (MORNING SNACK + LUNCH)",
          "PreOrderType": "Terms",
          "PerDayAmt": 0,
          "ConfigJSON":
              '{\\"BPurchaseCutoff\\":\\"0\\",\\"BPurchaseCutoffDays\\":\\"\\",\\"BPurchaseCutoffHours\\":\\"\\",\\"APurchaseCutoff\\":\\"0\\",\\"APurchaseCutoffDays\\":\\"\\",\\"APurchaseCutoffHours\\":\\"\\",\\"ProRatedCutoff\\":\\"1\\",\\"ProRateCutoffNoofDays\\":0,\\"CancelCutoff\\":\\"0\\",\\"Cancellation\\":\\"1\\",\\"CancelWholeTermMeal\\":\\"0\\",\\"CancelCutoffDays\\":\\"\\",\\"CancelCutoffHours\\":\\"\\",\\"CancelAfterTermStart\\":\\"1\\",\\"MenuChangeCutoff\\":\\"0\\",\\"MenuChangeCutoffDays\\":\\"\\",\\"MenuChangeCutoffHours\\":\\"\\"}',
          "RefUserSeqId": "100122",
          "PurchaseDate": "1900-01-01",
          "ItemSeqId": "0",
          "ItemFor": "0",
          "Category": "",
          "SellingPrice": 133,
          "IsAddon": "0",
          "Gst": 0,
          "RowId": 0,
          "Discount": 0,
          "GST_Percent": 0,
          "GST_Type": "",
          "FilterDate": 20230919,
          "Remarks": "",
          "lsCheckout": 1
        },
        {
          "ItemSeqId": 1002,
          "Name": "NASI LEMAK WITH EGG",
          "SellingPrice": 2.5,
          "GST_Percent": 0,
          "GST_Type": "",
          "RefItemType": "101",
          "AvailableOn": "2023-09-20T00:00:00",
          "ItemType": "Breakfast",
          "ItemStyle": "Asian",
          "RefPOTypeConfigSeqId": 10003,
          "RefMerchantSeqId": 101,
          "RefUserSeqId": "100122",
          "PurchaseDate": "2023-09-20",
          "ItemFor": "101",
          "Category": "Breakfast",
          "IsAddon": "0",
          "Gst": 0,
          "RowId": 0,
          "Discount": 0,
          "PackageSeqId": 0,
          "FilterDate": 20230920,
          "Remarks": "",
          "lsCheckout": 1
        },
        {
          "ItemSeqId": 1017,
          "Name": "SOTO NOODLES",
          "SellingPrice": 3,
          "GST_Percent": 0,
          "GST_Type": "",
          "RefItemType": "101",
          "AvailableOn": "2023-09-20T00:00:00",
          "ItemType": "Breakfast",
          "ItemStyle": "Asian",
          "RefPOTypeConfigSeqId": 10003,
          "RefMerchantSeqId": 101,
          "RefUserSeqId": "100123",
          "PurchaseDate": "2023-09-20",
          "ItemFor": "101",
          "Category": "Breakfast",
          "IsAddon": "0",
          "Gst": 0,
          "RowId": 1,
          "Discount": 0,
          "PackageSeqId": 0,
          "FilterDate": 20230920,
          "Remarks": "",
          "lsCheckout": 1
        }
      ]);
     */
    }
    print("===========orderHeader===========");
    print(jsonEncode(orderHeader));
    print("==========orderDetails============");
    print(jsonEncode(orderDetails));
    Navigator.of(context).pop();
    CommonUtil().MakeTransaction(context, orderHeader, orderDetails,
        gatewayDetail, profileData,IsWallet,Balance, paymentFor);
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
    if (Type != "filter") {
      if (familyList != null) _notificationMembersList = familyList;
      if (categoryList != null) _notificationCategoryList = categoryList;
    }

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

  void removeNotification(pnHistory) {
    _notificationList.removeWhere((item) => item["PNHistory"] == pnHistory);
    notifyListeners();
  }
}
