import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:calms_parent_latest/provider/rest_api.dart';
import 'package:calms_parent_latest/ui/screens/calendar_transactions/CalendarTransactions_page.dart';
import 'package:calms_parent_latest/ui/screens/payment/payment_webview_page.dart';
import 'package:calms_parent_latest/ui/screens/payment/after_payment_page.dart';

import '/common/app_settings.dart';
import '/common/constants.dart';
import '/common/listener/settings_listener.dart';
import '/common/my_shared_pref.dart';
import '/common/widgets/view_image.dart';
import '/ui/screens/activities/Activities.dart';
import '/ui/screens/activities/activity_details/ActivityDetails.dart';
import '/ui/screens/activities/filter/filter_activities.dart';
import '/ui/screens/attendance/attendance.dart';
import '/ui/screens/cart/cart.dart';
import '/ui/screens/detail_transaction/DetailTransaction.dart';
import '/ui/screens/details/outstanding_details.dart';
import '/ui/screens/details/purchase_details.dart';
import '/ui/screens/details/topup_details.dart';
import '/ui/screens/donation/Donation.dart';
import '/ui/screens/home/Home.dart';
import '/ui/screens/invoice/InvoicePayment.dart';
import '/ui/screens/invoice/invoice_details/InvoiceDetails.dart';
import '/ui/screens/meals/MealOrder.dart';
import '/ui/screens/meals/details/meal_details.dart';
import '/ui/screens/merchant_transaction/MerchantTransaction.dart';
import '/ui/screens/mfp_topup/MFPTopup.dart';
import '/ui/screens/notifications/notification-view/notification-view.dart';
import '/ui/screens/notifications/notifications.dart';
import '/ui/screens/parent_pickup/parent_pickup.dart';
import '/ui/screens/pin_lock/pin_enter.dart';
import 'common/alert_dialog.dart';
import 'common/crypto_enc.dart';
import 'ui/screens/pin_lock/create_pin.dart';
import '/ui/screens/profile/ProfilePage.dart';
import '/ui/screens/profile/profile_main.dart';
import '/ui/screens/scan_qr_registration/QRRegistration.dart';
import '/ui/screens/settings/Settings.dart';
import '/ui/screens/settings/app_settings.dart';
import '/ui/screens/share_money/ShareMoney.dart';
import '/ui/screens/stores/Store.dart';
import '/ui/screens/stores/details/StoreDetails.dart';
import '/ui/screens/stores/filter/filter.dart';
import '/ui/screens/student_tracking/bus_tracking/bus_tracking.dart';
import '/ui/screens/student_tracking/campus_tracking/campus_tracking.dart';
import '/ui/screens/student_tracking/student_tracking.dart';
import '/ui/screens/topup/TopupPage.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fullscreen/fullscreen.dart';
import 'common/json_responses.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'common/local_notification_service.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// TODO: Add stream controller
import 'package:rxdart/rxdart.dart';

// for passing messages from event handler to the UI
final _messageStreamController = BehaviorSubject<RemoteMessage>();

// TODO: Define the background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.messageType}');
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // TODO: Request permission
  final messaging = FirebaseMessaging.instance;

  // Web/iOS app users need to grant permission to receive messages
  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }

  // TODO: replace with your own VAPID key
  const vapidKey =
      "BBrWoGXmuqJsPbKZsnTRFHfMpf5zuxxUUVP01qwO2s9qMg_9b_e1tZnDp03z6demYHDQhJlS6hSVQyAQgyHd-nU";

  // TODO: Register with FCM
  // use the registration token to send messages to users from your trusted server environment
  String? token;

  if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
    token = await messaging.getToken(
      vapidKey: vapidKey,
    );
  } else {
    token = await messaging.getToken();
  }

  if (kDebugMode) {
    print('Registration Token=$token');
  }
  String tokenFcm = token!;
  print("token" + tokenFcm);
  MySharedPref().saveData(tokenFcm, AppSettings.fcmId);

  // TODO: Set up foreground message handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //LocalNotificationService.display(message);
    print(message.toString());
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    _messageStreamController.sink.add(message);
  });

  // TODO: Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MySettingsListener()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            fontFamily: appFontFmaily,
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''), // English, no country code
          ],
          home: ChangeNotifierProvider(
            create: (BuildContext context) => MySettingsListener(),
            child: SplashScreen(),
          ),
          routes: myroutes),
    ),
  );
}

var myroutes = {
  "/TopupPage": (context) => new TopupPage({},{}),
  "/DonationPage": (context) => new DonationPage(),
  "/ProfilePage": (context) => new ProfilePage(),
  "/MerchantTransaction": (context) => new MerchantTransaction(),
  "/DetailTransaction": (context) => new DetailTransaction(),
  "/Settings": (context) => new Settings(),
  "/MFPTopup": (context) => new MFPTopup(),
  "/TransferMoney": (context) => new ShareMoney(),
  "/Stores": (context) => new Stores(),
  "/StoreDetails": (context) => StoreDetails(),
  "/InvoicePayment": (context) => InvoicePayment(),
  "/Activities": (context) => Activities(),
  "/ActivityDetails": (context) => ActivityDetails(),
  "/InvoiceDetails": (context) => InvoiceDetails(),
  "/MealOrder": (context) => MealOrder({},{}),
  "/Notifications": (context) => Notifications(),
  "/NotificationView": (context) => NotificationView(),
  "/AppSettingsPage": (context) => AppSettingsPage(),
  "/CartPage": (context) => CartPage("", "",{}),
  "/ParentPickup": (context) => ParentPickup(),
  "/StudentTracking": (context) => StudentTracking(),
  "/BusTracking": (context) => BusTracking(),
  "/CampusTracking": (context) => CampusTracking(),
  "/StudentAttendance": (context) => StudentAttendance(),
  "/ProfileMain": (context) => ProfileMain(),
  "/OutStandingDetails": (context) => OutStandingDetails(),
  "/TopupDetails": (context) => TopupDetails(),
  "/PurchaseDetails": (context) => PurchaseDetails(),
  "/QRRegistration": (context) => QRRegistration(),
  "/CreatePin": (context) => CreatePin(),
  "/PINEnter": (context) => PINEnter(),
  "/FilterPage": (context) => FilterPage(),
  "/FilterActivities": (context) => FilterActivities(),
  "/ViewImage": (context) => ViewImage(),
  "/MealDetails": (context) => MealDetails({}, () {},{}),
  "/calendarTransactions": (context) => CalendarTransactionsPage({}),
  "/topupPayment": (context) => PaymentWebviewPage({}, ""),
  "/topupAfterPayment": (context) => AfterPaymentPage({}, ""),
};

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  String _lastMessage = "";

  _MyAppState() {
    // subscribe to the message stream fed by foreground message handler
    _messageStreamController.listen((message) {
      setState(() {
        print("notification rec");
        if (message.notification != null) {
          _lastMessage = 'Received a notification message:'
              '\n\nTitle=${message.notification?.title},'
              '\n\nBody=${message.notification?.body},'
              '\n\nData=${message.data}';
        } else {
          _lastMessage = 'Received a data message: ${message.data}';
        }
      });
    });
  }

  int familyPos = 1;

  onDidReceiveLocalNotification(
      int id, String title, String body, String payload) {
    // display a dialog with the notification details, tap ok to go to another page
    if (payload != '') {
      debugPrint('notification payload: $payload');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Notifications(),
        ),
      );
    }
  }

  selectNotification(String payload) {
    debugPrint('notification payload: $payload');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Notifications(),
      ),
    );
  }

  void pageSwiped(int pos) {
    setState(() {
      familyPos = pos;
      print(pos);
    });
  }

  @override
  void initState() {
    //getDashBoardDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
      ],
      debugShowCheckedModeBanner: false,
      //home: HomePage(familyPos, familyList, pageSwiped),
      home: HomePage(),
      theme: ThemeData(
        fontFamily: appFontFmaily,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.blue,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      ),
      routes: myroutes,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String profileData = "";
  String token = "";
  String DeviceId = "";
  bool appVerified = false;
  String appPIN = "";
  String qrCodeData = "";
  String appType = "";
  var verificationPayload = {};
  var AuthorizePayload = {};
  bool showVerificationAlert = false;
  Timer? timer;
  Future<void> routingScreen() async {
    profileData = await MySharedPref().getData(AppSettings.Sp_ProfileData);
    token = await MySharedPref().getData(AppSettings.Sp_Token);
    DeviceId = await MySharedPref().getData(AppSettings.Sp_DeviceId);
    appVerified =
        await MySharedPref().getBooleanData(AppSettings.Sp_App_Verified);
    appPIN = await MySharedPref().getData(AppSettings.Sp_AppPIN);
    qrCodeData = await MySharedPref().getData(AppSettings.Sp_QrCodeData);
    appType = await MySharedPref().getData(AppSettings.Sp_Key_AppType);
    print("profileData >> $profileData");
    print("appPIN >> $appPIN");
    print("qrCodeData >> $qrCodeData");
    print("appVerified >> $appVerified");
    print("token >> $token");
    print("DeviceId >> $DeviceId");
    /* Timer(
        Duration(seconds: 1),
        () => { */
    if (token == "" && profileData == "" && qrCodeData == "") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => QRRegistration()));
    } else if (token != "" && profileData != "" && appPIN != "") {
      if (appVerified) {
        if (kDebugMode)
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        else
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PINEnter()));
      } else {
        verifySignIn(context, qrCodeData, profileData, token, DeviceId, true);
      }
    } else if (token != "" && profileData != "" && appPIN == "") {
      if (appVerified)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreatePin()));
      else
        verifySignIn(context, qrCodeData, profileData, token, DeviceId, true);
    }
    //   });
  }

  verifySignIn(
      context, qrCodeData, profileData, token, DeviceId, showProgress) {
    Map<String, dynamic> qrJson = jsonDecode(qrCodeData);
    Map<String, dynamic> profileDataJson = jsonDecode(profileData);
    print("qrJson test " + qrJson['MAppSeqId']);
    AuthorizePayload = {
      "AuMAppDevSeqId": qrJson['MAppSeqId'],
      "AuDeviceUID": DeviceId,
      "Token": token
    };
    var paramData = {"MAppDevSeqId": qrJson['MAppSeqId']};
    String encParamData = CryptoEncryption(profileDataJson['SecureKey'])
        .encryptMyData(json.encode(paramData));
    var payload = {"Authorize": AuthorizePayload, "ParamData": encParamData};
    print("Payload == > " + payload.toString());
    String encData = CryptoEncryption(AppSettings.commonCryptoKey)
        .encryptMyData(json.encode(payload));
    verificationPayload = {"Data": encData};
    print(verificationPayload);
    Future<Map<String, dynamic>> res = RestApiProvider().postNewData(
        verificationPayload,
        qrJson["ApiUrl"],
        AppSettings.AppSignIn,
        context,
        showProgress,
        false);
    res
        .then((value) => {
              verificationResponse(value, context, qrJson['ApiUrl'],
                  profileDataJson['SecureKey'], qrJson['MAppSeqId'])
            })
        .onError((error, stackTrace) => {});
  }

  verificationResponse(
      Map<String, dynamic> res, context, apiUrl, secureKey, MAppSeqId) {
    if (res['Table'][0]['code'] == 10) {
      timer?.cancel();
      super.dispose();
      MySharedPref().saveBooleanData(true, AppSettings.Sp_App_Verified);
      MySharedPref().saveData(apiUrl, AppSettings.Sp_Api_Url);
      MySharedPref().saveData(
          apiUrl.replaceAll("/api/", "/FS/"), AppSettings.Sp_Img_Base_Url);
      MySharedPref().saveData(secureKey, AppSettings.Sp_SecureKey);
      MySharedPref().saveData(MAppSeqId, AppSettings.Sp_MAppDevSeqId);
      MySharedPref().saveData(
          json.encode(AuthorizePayload), AppSettings.Sp_Payload_Authorize);
      //if(res['Table1'])
        MySharedPref().saveData(jsonEncode(res['Table1'][0]), AppSettings.Sp_AppTheme);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CreatePin()));
    } else if (res['Table'][0]['code'] == 50) {
      if (!showVerificationAlert) {
        MySharedPref().saveBooleanData(false, AppSettings.Sp_App_Verified);
        MyCustomAlertDialog().showVerificationAlert(
            context,
            "Account verification alert!",
            res['Table'][0]['description'],
            false,
            verifyAgain,
            resend);
        //if (timer!.isActive) {
        timer = Timer.periodic(
            Duration(seconds: 5),
            (Timer t) => verifySignIn(
                context, qrCodeData, profileData, token, DeviceId, false));
        // }
        showVerificationAlert = true;
      }
    }
  }

  verifyAgain() {
    print("verifyAgain");
    verifySignIn(context, qrCodeData, profileData, token, DeviceId, true);
  }

  resend() {
    //timer?.cancel();
    //super.dispose();
    //showVerificationAlert = false;
    Map<String, dynamic> qrJson = jsonDecode(qrCodeData);
    Future<Map<String, dynamic>> res = RestApiProvider().postNewData(
        verificationPayload,
        qrJson["ApiUrl"],
        AppSettings.ReSendVerifyEmail,
        context,
        true,
        false);
    res
        .then((value) => {resendSuccess(value)})
        .onError((error, stackTrace) => {});
  }

  resendSuccess(Map<String, dynamic> res) {
    timer?.cancel();
    showVerificationAlert = false;
    verifySignIn(context, qrCodeData, profileData, token, DeviceId, true);

    /*  MyCustomAlertDialog().showCustomAlert(
        context, "Notification", res['Table'][0]['description'], true, () {
      Navigator.pop(context);
      
    }, null, "Ok", ""); */
  }

  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }

  @override
  void initState() {
    //enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );
    super.initState();
    routingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/app_bg.png"),
              fit: BoxFit.cover)),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image(
                      width: 150,
                      height: 150,
                      image: AssetImage('assets/images/logo.png')),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                      width: 200,
                      height: 200,
                      alignment: Alignment.bottomCenter,
                      image:
                          AssetImage('assets/images/welcome_bottom_img.png')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
