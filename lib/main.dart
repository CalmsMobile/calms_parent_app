import 'dart:async';

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
import '/ui/screens/home/tab_view.dart';
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

List<Map> tabsList = [
  {
    "title": "Home",
  },
  // {
  //   "title": "Stores",
  // },
  // {
  //   "title": "Invoice",
  // },
  // {"title": "Activities"}
];

var myroutes = {
  "/TopupPage": (context) => new TopupPage(),
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
  "/MealOrder": (context) => MealOrder(),
  "/Notifications": (context) => Notifications(),
  "/NotificationView": (context) => NotificationView(),
  "/AppSettingsPage": (context) => AppSettingsPage(),
  "/CartPage": (context) => CartPage(),
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
  "/PinLock": (context) => PinLock(),
  "/PINEnter": (context) => PINEnter(),
  "/FilterPage": (context) => FilterPage(),
  "/FilterActivities": (context) => FilterActivities(),
  "/ViewImage": (context) => ViewImage(),
  "/MealDetails": (Context) => MealDetails()
};

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
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
  @override
  void initState() {
    // Initialise  localnotification
    // LocalNotificationService.initialize();

    tabController =
        new TabController(length: tabsList.length, vsync: this, initialIndex: 0)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  int familyPos = 2;

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
  Widget build(BuildContext context) {
    // var routes = <String, WidgetBuilder>{
    //   TopupPage.routeName: (BuildContext context) => new TopupPage(),
    // };
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
      // home: TabView(tabController, tabsList, familyList, familyPos, pageSwiped),
      home: HomePage(familyPos, JsonResponses.familyList, pageSwiped),
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

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'CALMS Parent',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: ProfileUI2(), // calling  profilepage Ui design
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> routingScreen() async {
    // WidgetsFlutterBinding.ensureInitialized();

    // bool _result = appAuth.login();
    // if (_result) {
    // _defaultHome = new Dashboard();
    // _defaultHome = LoginScreen();
    // }
    String profileData = await MySharedPref().getData(AppSettings.profileData);

    String appPIN = await MySharedPref().getData(AppSettings.parentAppPIN);
    String qrCodeData = await MySharedPref().getData(AppSettings.qrCodeData);
    String appType = await MySharedPref().getData(AppSettings.Sp_Key_AppType);
    print("profileData >> $profileData");
    print("appPIN >> $appPIN");
    print("qrCodeData >> $qrCodeData");
    Timer(
        Duration(seconds: 3),
        () => {
              if (profileData == "")
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QRRegistration()))
                }
              else if (profileData != "" && appPIN != "")
                {
                  if (kDebugMode)
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()))
                    }
                  else
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PINEnter()))
                }
              else if (profileData != "" && appPIN == "")
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PinLock()))
                }
              else
                {
                  if (appType == AppSettings.appType_Notification)
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()))
                    }
                  else
                    {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyApp()))
                    }
                }
            });
  }

  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    //enterFullScreen(FullScreenMode.EMERSIVE);
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
                  /* InkWell(
                            onTap: () {
                              print("tapped");
                              //barcode scanner
                              setState(() {
                                
                              });
                            },
                            child: Image(
                                width: 150,
                                height: 150,
                                image: AssetImage('assets/images/qrcode.png')),
                          ),SizedBox(
                            height: 40,
                          ), */
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
}
