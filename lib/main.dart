import 'dart:async';

import 'package:calms_parent/common/app_settings.dart';
import 'package:calms_parent/common/constants.dart';
import 'package:calms_parent/common/listener/settings_listener.dart';
import 'package:calms_parent/common/my_shared_pref.dart';
import 'package:calms_parent/common/widgets/view_image.dart';
import 'package:calms_parent/ui/screens/activities/Activities.dart';
import 'package:calms_parent/ui/screens/activities/activity_details/ActivityDetails.dart';
import 'package:calms_parent/ui/screens/activities/filter/filter_activities.dart';
import 'package:calms_parent/ui/screens/attendance/attendance.dart';
import 'package:calms_parent/ui/screens/cart/cart.dart';
import 'package:calms_parent/ui/screens/detail_transaction/DetailTransaction.dart';
import 'package:calms_parent/ui/screens/details/outstanding_details.dart';
import 'package:calms_parent/ui/screens/details/purchase_details.dart';
import 'package:calms_parent/ui/screens/details/topup_details.dart';
import 'package:calms_parent/ui/screens/donation/Donation.dart';
import 'package:calms_parent/ui/screens/home/Home.dart';
import 'package:calms_parent/ui/screens/home/tab_view.dart';
import 'package:calms_parent/ui/screens/invoice/InvoicePayment.dart';
import 'package:calms_parent/ui/screens/invoice/invoice_details/InvoiceDetails.dart';
import 'package:calms_parent/ui/screens/meals/MealOrder.dart';
import 'package:calms_parent/ui/screens/meals/details/meal_details.dart';
import 'package:calms_parent/ui/screens/merchant_transaction/MerchantTransaction.dart';
import 'package:calms_parent/ui/screens/mfp_topup/MFPTopup.dart';
import 'package:calms_parent/ui/screens/notifications/notification-view/notification-view.dart';
import 'package:calms_parent/ui/screens/notifications/notifications.dart';
import 'package:calms_parent/ui/screens/parent_pickup/parent_pickup.dart';
import 'package:calms_parent/ui/screens/pin_lock/pin_enter.dart';
import 'package:calms_parent/ui/screens/pin_lock/pin_lock.dart';
import 'package:calms_parent/ui/screens/profile/ProfilePage.dart';
import 'package:calms_parent/ui/screens/profile/profile_main.dart';
import 'package:calms_parent/ui/screens/scan_qr_registration/QRRegistration.dart';
import 'package:calms_parent/ui/screens/settings/Settings.dart';
import 'package:calms_parent/ui/screens/settings/app_settings.dart';
import 'package:calms_parent/ui/screens/share_money/ShareMoney.dart';
import 'package:calms_parent/ui/screens/stores/Store.dart';
import 'package:calms_parent/ui/screens/stores/details/StoreDetails.dart';
import 'package:calms_parent/ui/screens/stores/filter/filter.dart';
import 'package:calms_parent/ui/screens/student_tracking/bus_tracking/bus_tracking.dart';
import 'package:calms_parent/ui/screens/student_tracking/campus_tracking/campus_tracking.dart';
import 'package:calms_parent/ui/screens/student_tracking/student_tracking.dart';
import 'package:calms_parent/ui/screens/topup/TopupPage.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'common/json_responses.dart';

/* const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin(); */

/* Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA-B7jICiNpUde4wwWbqbZeoVyt1pjXDQ8",
      appId: "1:746458534934:android:23456e5d0df19300159137",
      messagingSenderId: "",
      projectId: "parent-portal-app-36b77",
    ),
  );
  print('Handling a background message ${message.messageId}');
} */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA-B7jICiNpUde4wwWbqbZeoVyt1pjXDQ8",
      appId: "1:746458534934:android:23456e5d0df19300159137",
      messagingSenderId: "",
      projectId: "parent-portal-app-36b77",
    ),
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler); */
  /* await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel); */

 /*  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  ); */
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
  @override
  void initState() {
    //initFCM();
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

  /* Future<void> initFCM() async {
    // var initializationSettingsAndroid =
    //     new AndroidInitializationSettings('ic_launcher');
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {
        onDidReceiveLocalNotification(id, title!, body!, payload!);
      },
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        selectNotification(payload!);
      },
    );

   /*  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              icon: "@mipmap/ic_launcher",
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Notifications(),
          ),
        );
      }
    });

    getToken(); */
  }
 */
  /* String token = '';
  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;

    print('FCM Token: $token');
    MySharedPref().saveData(token, AppSettings.fcmId);
  }
 */
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
    String driverDetails =
        await MySharedPref().getData(AppSettings.parentDetails);

    String appPIN = await MySharedPref().getData(AppSettings.parentAppPIN);
    String qrCodeData = await MySharedPref().getData(AppSettings.qrCodeData);
    print("driverDetails >> $driverDetails");
    print("appPIN >> $appPIN");
    print("qrCodeData >> $qrCodeData");
    Timer(
        Duration(seconds: 3),
        () => {
              if (driverDetails == "")
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QRRegistration()))
                }
              else if (appPIN != "")
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PINEnter()))
                }
              else
                {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => MyApp()))
                }
            });
  }

  @override
  void initState() {
    super.initState();
    routingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover)),
    );
  }
}
