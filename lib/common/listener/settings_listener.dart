import 'dart:collection';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class MySettingsListener with ChangeNotifier {
  var _settingDetails;
  var _driverDetails;
  List _familyList = [];
  List _dashboardMenuList = [];
  List _holidaysList = [];
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

  UnmodifiableListView<dynamic> get notificationList =>
      UnmodifiableListView(_notificationList);
  get size => _notificationList.length;

  UnmodifiableListView<dynamic> get holidaysList =>
      UnmodifiableListView(_holidaysList);

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
  }

  updateDashBoard() {
    notifyListeners();
  }

  updateGetCalendarData(List holidaysList) {
    _holidaysList = holidaysList;
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
