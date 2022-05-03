class AppSettings {
  //LOCAL STORAGE KEYS
  static String qrCodeData = 'CPA_QRCODE';
  static String mobileDeviceInfo = 'CPA_MOBILE_DEVICE_INFO';
  static String deviceDetails = 'CPA_DEVICE_DETAILS';
  static String driverDetails = 'CPA_DRIVER_DETAILS';
  static String deviceUID = 'CPA_DEVICE_UID';
  static String driverLogin = 'CPA_DRIVER_LOGIN';
  static String driverAppSettings = 'CPA_APP_SETTINGS';
  static String dropOffNotifiactionList = 'CPA_DROP_NOTI_LIST';
  static String pickNotifiactionList = 'CPA_PICK_NOTI_LIST';
  static String dropOffNotComingList = 'CPA_DROP_NOT_COMING_LIST';
  static String pickNotComingList = 'CPA_PICK_NOT_COMING_LIST';
  static String refTripSeqId = 'CPA_TRIP_SEQ_ID';
  static String fcmId = 'CPA_FCM_ID';
  static String refTripTransHeaderSeqId = 'CPA_TRIP_TRANS_HEADER_SEQ_ID';
  static String driverLastLoggedIn = 'CPA_DRIVER_LAST_LOGGED_IN';
  static String tripDropOffStudentStatusList =
      'CPA_DROPOFF_STUDENT_STATUS_LIST';
  static String apiURL = 'http://124.217.235.107:1001/api/';
  static String studentImageHandler =
      '/Handler/PortalImageHandler.ashx?ScreenType=30&RefSlno=';
  static String driverImageHandler =
      '/Handler/PortalImageHandler.ashx?ScreenType=45&RefSlno=';

  // API End Points
  static String validateQRCode = "/VehicleTracking/ValidateQRCode";
  static String login = "/VehicleTracking/login";
  static String getAppSettings = "/VehicleTracking/GetAppSettings";
  static String getDriverTrips = "/VehicleTracking/GetDriverTrips";
  static String getDriverTripDetails = "/VehicleTracking/GetDriverTripDetails";
  static String updateStudentOnBoardStatus =
      "/VehicleTracking/updateStudentOnBoardStatus";
  static String getAllNotification = "/VehicleTracking/getAllNotification";
  static String deleteNotification = "/VehicleTracking/DeleteNotification";
  static String updateReadNotificationStatus =
      "/VehicleTracking/UpdateReadNotificationStatus";
  static String syncDriverDetails = "/VehicleTracking/SyncDriverDetails";
  static String startTrip = "/VehicleTracking/startTrip";
  static String updateTripStatus = "/VehicleTracking/updateTripStatus";
  static String updateLiveTracking = "/VehicleTracking/UpdateLiveTracking";
  static String savePushNotificationId =
      "/VehicleTracking/SavePushNotificationId";
  static String updateTripSpeedViolation =
      "/VehicleTracking/UpdateTripSpeedViolation";
  static String changeDriverPassword = "/VehicleTracking/ChangeDriverPassword";
  static String getTripStopList = "/VehicleTracking/GetTripStopList";

  static String vapidKey =
      'BIEVELZisr_SbfStZljlwA4SKRuQU5N7o_8ylvJ_GJs5RvYKGLEX-iAQlyu7EWyIIEY3KDPGEzADra__rbMQLak';
}
