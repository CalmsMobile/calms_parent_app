import 'dart:collection';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class MySettingsListener with ChangeNotifier {
  var _settingDetails;
  var _driverDetails;
  List _familyList = [];
  List _dashboardMenuList = [];

  List _dashboardSpendingList = [];
  List _dashboardRecentActivityList = [];
  List _dashboardOutStandingList = [];

  List _calendarHolidaysList = [];
  List _calendarAttendanceList = [];
  List _calendarTransactionList = [];

  List _topupMembersList = [];

  int _familyPos = 0;
  List _notificationList = [];
  List _notificationCategoryList = [];
  List _notificationMembersList = [];

  UnmodifiableListView<dynamic> get familyList =>
      UnmodifiableListView(_familyList);
  get familyPos => _familyPos;
  void pageSwiped(int pos) {
    _familyPos = pos;
    print(pos);
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

  UnmodifiableListView<dynamic> get notificationCategoryList =>
      UnmodifiableListView(_notificationCategoryList);

  UnmodifiableListView<dynamic> get notificationMembersList =>
      UnmodifiableListView(_notificationMembersList);

  UnmodifiableMapView get mysettingDetails =>
      UnmodifiableMapView(_settingDetails);

  UnmodifiableMapView get mydriverDetails =>
      UnmodifiableMapView(_driverDetails == null ? {} : _driverDetails);

  updateEntryToDashboardLists(List familyList, List menuList) {
    _familyList = familyList;
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
    notifyListeners();
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
