class AppSettings {
  //LOCAL STORAGE KEYS
  static String Sp_QrCodeData = 'CPA_QRCODE';
  static String Sp_Key_AppType = 'CPA_APP_TYPE';
  static String mobileDeviceInfo = 'CPA_MOBILE_DEVICE_INFO';
  static String deviceDetails = 'CPA_DEVICE_DETAILS';
  static String Sp_ProfileData = 'CPA_PROFILE_DETAILS';
  static String parentAppPIN = 'CPA_PIN_LOCK';
  static String parentDetails = 'CPA_DRIVER_DETAILS';
  static String deviceUID = 'CPA_DEVICE_UID';
  static String parentLogin = 'CPA_DRIVER_LOGIN';
  static String parentAppSettings = 'CPA_APP_SETTINGS';
  static String dropOffNotifiactionList = 'CPA_DROP_NOTI_LIST';
  static String pickNotifiactionList = 'CPA_PICK_NOTI_LIST';
  static String dropOffNotComingList = 'CPA_DROP_NOT_COMING_LIST';
  static String pickNotComingList = 'CPA_PICK_NOT_COMING_LIST';
  static String refTripSeqId = 'CPA_TRIP_SEQ_ID';
  static String fcmId = 'CPA_FCM_ID';
  static String refTripTransHeaderSeqId = 'CPA_TRIP_TRANS_HEADER_SEQ_ID';
  static String driverLastLoggedIn = 'CPA_DRIVER_LAST_LOGGED_IN';
  static String Sp_Token = 'CPA_TOKEN';
  static String Sp_App_Verified = 'CPA_APP_VERIFIED';
  static String Sp_DeviceId = 'CPA_DEVICEID';
  static String Sp_Api_Url = 'CPA_API_URL';
  static String Sp_Img_Base_Url = 'CPA_IMG_BASE_URL';
  static String Sp_SecureKey = 'CPA_SECUREKEY';
  static String Sp_Payload_Authorize = 'CPA_AUTHORIZE';
  static String Sp_MAppDevSeqId = 'CPA_APP_SEQ_ID';
  static String tripDropOffStudentStatusList =
      'CPA_DROPOFF_STUDENT_STATUS_LIST';
  static String apiURL = 'http://124.217.235.107:1001/api/';
  static String studentImageHandler =
      '/Handler/PortalImageHandler.ashx?ScreenType=30&RefSlno=';
  static String driverImageHandler =
      '/Handler/PortalImageHandler.ashx?ScreenType=45&RefSlno=';

  // API End Points
  static String GetQRInfo = 'ParentApp/GetQRInfoV2';
  static String RegisterParentApp = 'ParentApp/RegisterParentAppV2';
  static String GetNotificationList = 'ParentApp/GetNotificationList';
  static String GetNotificationListWithFilter =
      'ParentApp/GetNotificationListWithFilter';
  static String RemovePushNotification = 'ParentApp/RemovePushNotification';
  static String AppSignIn = 'parentapp/AppSignIn';
  static String ReSendVerifyEmail = 'parentapp/ReSendVerifyEmail';
  static String EntryToDashboard = 'parentapp/EntryToDashboard';
  static String GetDashboard = 'parentapp/GetDashboard';
  static String GetCalendarData = 'parentapp/GetCalendarData';
  static String GetFamilyMemberForTopup = 'parentapp/GetFamilyMemberForTopup';

  static String avatarPlaceholder =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
  static String vapidKey =
      'BIEVELZisr_SbfStZljlwA4SKRuQU5N7o_8ylvJ_GJs5RvYKGLEX-iAQlyu7EWyIIEY3KDPGEzADra__rbMQLak';

  static String appType_Notification = "NOTIFICATION";

  static String commonCryptoKey = "qweqweqweqweqweq";
  // static String appType_Notification = "NOTIFICATION";

  static String verificationAlertMsg = "Verification link sent to your email. Please verify to access this application. If you have not received the link, Click 'Resend' below to send a verification email again.";
}
