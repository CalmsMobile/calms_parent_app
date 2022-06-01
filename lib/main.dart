import 'package:calms_parent/common/listener/settings_listener.dart';
import 'package:calms_parent/ui/screens/activities/Activities.dart';
import 'package:calms_parent/ui/screens/activities/activity_details/ActivityDetails.dart';
import 'package:calms_parent/ui/screens/attendance/attendance.dart';
import 'package:calms_parent/ui/screens/cart/cart.dart';
import 'package:calms_parent/ui/screens/detail_transaction/DetailTransaction.dart';
import 'package:calms_parent/ui/screens/details/outstanding_details.dart';
import 'package:calms_parent/ui/screens/donation/Donation.dart';
import 'package:calms_parent/ui/screens/home/tab_view.dart';
import 'package:calms_parent/ui/screens/invoice/InvoicePayment.dart';
import 'package:calms_parent/ui/screens/invoice/invoice_details/InvoiceDetails.dart';
import 'package:calms_parent/ui/screens/meals/MealOrder.dart';
import 'package:calms_parent/ui/screens/merchant_transaction/MerchantTransaction.dart';
import 'package:calms_parent/ui/screens/mfp_topup/MFPTopup.dart';
import 'package:calms_parent/ui/screens/notifications/notification-view/notification-view.dart';
import 'package:calms_parent/ui/screens/notifications/notifications.dart';
import 'package:calms_parent/ui/screens/parent_pickup/parent_pickup.dart';
import 'package:calms_parent/ui/screens/profile/ProfilePage.dart';
import 'package:calms_parent/ui/screens/profile/profile_main.dart';
import 'package:calms_parent/ui/screens/settings/Settings.dart';
import 'package:calms_parent/ui/screens/settings/app_settings.dart';
import 'package:calms_parent/ui/screens/share_money/ShareMoney.dart';
import 'package:calms_parent/ui/screens/stores/Store.dart';
import 'package:calms_parent/ui/screens/stores/details/StoreDetails.dart';
import 'package:calms_parent/ui/screens/student_tracking/bus_tracking/bus_tracking.dart';
import 'package:calms_parent/ui/screens/student_tracking/campus_tracking/campus_tracking.dart';
import 'package:calms_parent/ui/screens/student_tracking/student_tracking.dart';
import 'package:calms_parent/ui/screens/topup/TopupPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MySettingsListener()),
      ],
      child: MaterialApp(
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
          child: MyApp(),
        ),
      ),
    ),
  );
}

List<Map> tabsList = [
  {
    "title": "Home",
  },
  {
    "title": "Stores",
  },
  {
    "title": "Invoice",
  },
  {"title": "Activities"}
];

List<Map> familyList = [
  {
    "name": "Desmond",
    "category": "PARENT",
    "desc": "",
    "balance": "250",
    "email": "makame147@gmail.com",
    "image": "https://randomuser.me/api/portraits/men/11.jpg"
  },
  {
    "name": "SITI KHALIDA",
    "category": "PARENT",
    "desc": "",
    "balance": "50",
    "email": "calms.rnd@gmail.com",
    "image": "https://randomuser.me/api/portraits/women/11.jpg"
  },
  {
    "name": "HAZIM",
    "category": "STUDENT",
    "email": "",
    "balance": "108",
    "contact": "0123467589",
    "desc": "Member account does not exist in MFP software",
    "image": "https://randomuser.me/api/portraits/men/10.jpg"
  },
  {
    "name": "MARIE LIM",
    "category": "STUDENT",
    "email": "",
    "balance": "0",
    "contact": "",
    "desc": "",
    "image": "https://randomuser.me/api/portraits/men/13.jpg"
  },
  {
    "name": "Danny",
    "category": "STUDENT",
    "email": "",
    "balance": "30.00",
    "contact": "",
    "desc": "",
    "image": "https://randomuser.me/api/portraits/men/14.jpg"
  },
];

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController =
        new TabController(length: tabsList.length, vsync: this, initialIndex: 0)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  int familyPos = 2;

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
      debugShowCheckedModeBanner: false,
      home: TabView(tabController, tabsList, familyList, familyPos, pageSwiped),
      theme: ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.blue,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      ),
      routes: {
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
        "/OutStandingDetails": (context) => OutStandingDetails()
      },
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
