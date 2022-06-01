import 'dart:math';
import 'package:calms_parent/model/HolidayModel.dart';
import 'package:calms_parent/model/_AppointmentDataSource.dart';
import 'package:calms_parent/model/moduleModel.dart';
import 'package:calms_parent/ui/screens/calendar/calendar_page.dart';
import 'package:calms_parent/ui/screens/cart/cart.dart';
import 'package:calms_parent/ui/screens/notifications/notifications.dart';
import 'package:calms_parent/ui/screens/settings/app_settings.dart';
import 'package:calms_parent/ui/screens/widgets/HolidayCalendar.dart';
import 'package:calms_parent/ui/screens/widgets/PurchaseListView.dart';
import 'package:calms_parent/ui/screens/widgets/StoreItemListView.dart';
import 'package:calms_parent/ui/screens/widgets/TopupListView.dart';
import 'package:calms_parent/ui/screens/widgets/UpcomingActivityListView.dart';
import 'package:calms_parent/ui/screens/widgets/outstandingView.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  String color = "#35438e".replaceAll('#', '0xff');

  HomePage(this.familyPos, this.familyList, this.pageSwiped);

  final int familyPos;

  final Function pageSwiped;

  final List<ModuleModel> items = RandomColorModel().getModuleList();
  final List<Map> outstandingList = [
    {
      "name": "James",
      "id": "CALMS001",
      "invoiceNo": "INV001",
      "category": "Bill Pay",
      "last_date": "30/11/2021",
      "invoice_date": "30/11/2021",
      "amount": "34950.00",
      "desc":
          "Attempts to create a new object that represents the amalgamation of this border and the other border",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "id": "CALMS002",
      "invoiceNo": "INV002",
      "category": "Bill Pay",
      "last_date": "30/11/2021",
      "invoice_date": "30/11/2021",
      "amount": "450.00",
      "desc":
          "Attempts to create a new object that represents the amalgamation of this border and the other border",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "Olivia",
      "id": "CALMS003",
      "invoiceNo": "INV003",
      "category": "Bill Pay",
      "last_date": "30/11/2021",
      "invoice_date": "30/11/2021",
      "amount": "100.00",
      "desc":
          "Attempts to create a new object that represents the amalgamation of this border and the other border",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "id": "CALMS004",
      "invoiceNo": "INV004",
      "category": "Bill Pay",
      "last_date": "30/11/2021",
      "invoice_date": "30/11/2021",
      "amount": "23.00",
      "desc":
          "Attempts to create a new object that represents the amalgamation of this border and the other border",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "James",
      "id": "CALMS005",
      "invoiceNo": "INV005",
      "category": "Bill Pay",
      "last_date": "30/11/2021",
      "invoice_date": "30/11/2021",
      "amount": "2043.50",
      "desc":
          "Attempts to create a new object that represents the amalgamation of this border and the other border",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    }
  ];
  final List<Map> topupList = [
    {
      "name": "James",
      "mode_of_topup": "Photocopier",
      "date": "30/11/2021 12:30 am",
      "amount": "950.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "mode_of_topup": "Counter-topup",
      "date": "30/11/2021 12:30 am",
      "amount": "450.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "Olivia",
      "mode_of_topup": "Online",
      "date": "30/11/2021 02:30 pm",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "mode_of_topup": "Counter-topup",
      "date": "30/11/2021 02:30 pm",
      "amount": "23.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "James",
      "mode_of_topup": "Online",
      "date": "30/11/2021 03:30 pm",
      "amount": "2043.50",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    }
  ];
  final List<Map> purchaseList = [
    {
      "name": "James",
      "pay_for": "Meal",
      "orderID": "ORD001",
      "date": "30/11/2021 01:00 pm",
      "amount": "950.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "pay_for": "Canteen",
      "orderID": "ORD002",
      "date": "30/11/2021 10:00 am",
      "amount": "450.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "Olivia",
      "pay_for": "Meal",
      "orderID": "ORD003",
      "date": "30/11/2021 01:30 pm",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "pay_for": "Canteen",
      "orderID": "ORD004",
      "date": "30/11/2021 04:00 pm",
      "amount": "23.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "James",
      "pay_for": "Meal",
      "orderID": "ORD005",
      "date": "30/11/2021 08:00 pm",
      "amount": "2043.50",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    }
  ];
  final List<Map> familyList;
  final List<Map> storeItem = [
    {
      "name": "student-plastic-id-card",
      "category": "Request ID Card",
      "amount": "20.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb6Wne7m0LraBtZlgFjD5U2b-O8mF7W6-BZg&usqp=CAU"
    },
    {
      "name": "Color Box",
      "category": "Purchase",
      "amount": "145.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0sq6Ut-brPLyZ15tFpjEkOSdJik1U2eYpIg&usqp=CAU"
    },
    {
      "name": "standard notepad",
      "category": "Purchase",
      "amount": "80.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0sq6Ut-brPLyZ15tFpjEkOSdJik1U2eYpIg&usqp=CAU"
    }
  ];
  final List<Map> upcomingActivities = [
    {
      "name": "School Trip",
      "category": "School Trip",
      "amount": "20.00",
      "date": "30/11/2022",
      "activity_type": "Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb6Wne7m0LraBtZlgFjD5U2b-O8mF7W6-BZg&usqp=CAU"
    },
    {
      "name": "Zoom Negara Visit",
      "category": "School Trip",
      "amount": "145.00",
      "date": "27/01/2022",
      "activity_type": "Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0sq6Ut-brPLyZ15tFpjEkOSdJik1U2eYpIg&usqp=CAU"
    },
    {
      "name": "Local",
      "category": "School Trip",
      "date": "03/05/2022",
      "amount": "80.00",
      "activity_type": "Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0sq6Ut-brPLyZ15tFpjEkOSdJik1U2eYpIg&usqp=CAU"
    },
    {
      "name": "Trip",
      "category": "School Trip",
      "date": "03/05/2022",
      "amount": "80.00",
      "activity_type": "Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0sq6Ut-brPLyZ15tFpjEkOSdJik1U2eYpIg&usqp=CAU"
    }
  ];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool topupCollapse = true;
  bool purchaseCollapse = true;
  bool storeCollapse = true;
  bool activitiesCollapse = true;
  @override
  Widget build(BuildContext context) {
    print(widget.familyPos);
    print(widget.familyList);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200.0),
                              bottomRight: Radius.circular(200.0)),
                          color: Color(int.parse(widget.color))),
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          CarouselSlider(
                            items: widget.familyList
                                .map((item) => InkWell(
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            if (widget.familyList[
                                                    widget.familyPos]['name'] ==
                                                item["name"])
                                              Image.asset(
                                                "assets/images/swipe_left.png",
                                                width: 25,
                                              ),
                                            Container(
                                              width: (widget.familyList[widget
                                                          .familyPos]['name'] ==
                                                      item["name"])
                                                  ? 92
                                                  : 62,
                                              height: (widget.familyList[widget
                                                          .familyPos]['name'] ==
                                                      item["name"])
                                                  ? 92
                                                  : 62,
                                              child: CircleAvatar(
                                                backgroundImage:
                                                    NetworkImage(item["image"]),
                                              ),
                                              decoration: BoxDecoration(
                                                //DecprationImage
                                                border: Border.all(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 4.0,
                                                    style: BorderStyle
                                                        .solid), //Border.all

                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(60.0),
                                                  topRight:
                                                      Radius.circular(60.0),
                                                  bottomLeft:
                                                      Radius.circular(60.0),
                                                  bottomRight:
                                                      Radius.circular(60.0),
                                                ),
                                                //BorderRadius.only
                                                /************************************/
                                                /* The BoxShadow widget  is here */
                                                /************************************/
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    offset: const Offset(
                                                      0.0,
                                                      0.0,
                                                    ),
                                                    blurRadius: 10.0,
                                                    spreadRadius: 2.0,
                                                  ), //BoxShadow
                                                  BoxShadow(
                                                    color: Colors.white,
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 0.0,
                                                    spreadRadius: 0.0,
                                                  ), //BoxShadow
                                                ],
                                              ),
                                            ),
                                            if (widget.familyList[
                                                    widget.familyPos]['name'] ==
                                                item["name"])
                                              Image.asset(
                                                "assets/images/swipe_right.png",
                                                width: 25,
                                              )
                                          ],
                                        ),
                                      ),
                                      onTap: () => {
                                        Navigator.of(context).pushNamed(
                                            '/ProfileMain',
                                            arguments: item)
                                      },
                                    ))
                                .toList(),

                            //Slider Container properties
                            options: CarouselOptions(
                                height: 90.0,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale,
                                enlargeCenterPage: true,
                                autoPlay: false,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: false,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 0.35,
                                onPageChanged: (index, reason) {
                                  widget.pageSwiped(index);
                                },
                                initialPage: widget.familyPos),
                          ),
                          Text(
                            widget.familyList[widget.familyPos]['name'],
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Wallet Ballance",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white30,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'MYR ${double.parse(widget.familyList[widget.familyPos]['balance']).toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      left: 15, //give the values according to your requirement
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppSettingsPage(),
                                ),
                              );
                            },
                            color: Colors.blue.shade700,
                            textColor: Colors.white,
                            child: Icon(
                              Icons.settings,
                              size: 24,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom:
                          -20, //give the values according to your requirement
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(),
                                ),
                              );
                            },
                            color: Colors.greenAccent.shade700,
                            textColor: Colors.white,
                            child: Icon(
                              Icons.shopping_cart,
                              size: 24,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 15, //give the values according to your requirement
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Notifications(),
                                ),
                              );
                            },
                            color: Colors.blue.shade700,
                            textColor: Colors.white,
                            child: Icon(
                              Icons.notifications,
                              size: 24,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    GridView.builder(
                      itemCount: widget.items.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 3
                            : 3,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: (2 / 1),
                      ),
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return GestureDetector(
                          onTap: () {
                            ModuleModel moduleModel = widget.items[index];
                            print(moduleModel.label);
                            switch (moduleModel.module) {
                              case "HolidayCalendar":
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HolidayCalendar(
                                            new RandomColorModel()
                                                ._getCalendarDataSource())));
                                break;
                              case "Topup":
                                Navigator.of(context).pushNamed('/TopupPage');
                                break;
                              case "MFPTopup":
                                Navigator.of(context).pushNamed('/MFPTopup');
                                break;
                              case "Donation":
                                Navigator.of(context)
                                    .pushNamed('/DonationPage');
                                break;
                              case "TransferMoney":
                                Navigator.of(context)
                                    .pushNamed('/TransferMoney');
                                break;
                              case "Store":
                                Navigator.of(context).pushNamed('/Stores');
                                break;
                              case "MyInvoice":
                                Navigator.of(context)
                                    .pushNamed('/InvoicePayment');
                                break;
                              case "Activities":
                                Navigator.of(context).pushNamed('/Activities');
                                break;
                              case "StudentAttendance":
                                Navigator.of(context)
                                    .pushNamed('/StudentAttendance');
                                break;
                              case "OrderMeal":
                                Navigator.of(context).pushNamed('/MealOrder');
                                break;
                              case "ParentPickup":
                                Navigator.of(context)
                                    .pushNamed('/ParentPickup');
                                break;
                              case "StudentTracking":
                                Navigator.of(context)
                                    .pushNamed('/StudentTracking');
                                break;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    width: 1.5, color: Colors.grey.shade300),
                                bottom: BorderSide(
                                    width: 1.5, color: Colors.grey.shade300),
                              ),
                              // borderRadius: BorderRadius.only(
                              //     bottomLeft: Radius.circular(5.0),
                              //     bottomRight: Radius.circular(5.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  widget.items[index].icon,
                                  color: widget.items[index].color,
                                ),
                                Text(widget.items[index].label,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          margin: EdgeInsets.zero,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Text(
                            "OUTSTANDING",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: widget.outstandingList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return userList(
                                    context, index, widget.outstandingList);
                              }),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Text(
                            "PURCHASE SUGGESTION",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10.0, right: 20),
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "STORE ITEM(S)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(storeCollapse
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            )),
                        onTap: () {
                          storeCollapse = !storeCollapse;
                          setState(() {});
                        },
                      ),
                    ),
                    if (storeCollapse) StoreItemListView(widget.storeItem),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10.0, right: 20),
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "UPCOMING ACTIVITIES",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(activitiesCollapse
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            )),
                        onTap: () {
                          activitiesCollapse = !activitiesCollapse;
                          setState(() {});
                        },
                      ),
                    ),
                    if (activitiesCollapse)
                      UpcomingActivityListView(widget.upcomingActivities),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          margin: EdgeInsets.zero,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Text(
                            "RECENT ACITIVITIES",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10.0, right: 20),
                            margin: EdgeInsets.zero,
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "TOPUP",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(topupCollapse
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            )),
                        onTap: () {
                          topupCollapse = !topupCollapse;
                          setState(() {});
                        },
                      ),
                    ),
                    if (topupCollapse) TopupListView(widget.topupList),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, bottom: 10.0, right: 20),
                            margin: EdgeInsets.zero,
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PURCHASE",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(purchaseCollapse
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up)
                              ],
                            )),
                        onTap: () {
                          purchaseCollapse = !purchaseCollapse;
                          setState(() {});
                        },
                      ),
                    ),
                    if (purchaseCollapse) PurchaseListView(widget.purchaseList),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          margin: EdgeInsets.zero,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Text(
                            "PHOTO GALLERY",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.pinimg.com/originals/4b/92/28/4b92281a7861003034b632b4ab5ed741.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.adsttc.com/media/images/615a/fa1e/1248/3401/6477/b865/newsletter/tali-hankou-library-083.jpg?1633352237"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.7,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Text(
                            "HOLIDAY CALENDAR",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    getCalendarView(context,
                        new RandomColorModel()._getCalendarDataSource()),
                  ],
                ),
              ],
            ))));
  }
}

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }

  Color _getColorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  List<ModuleModel> getModuleList() {
    // ignore: deprecated_member_use
    List<ModuleModel> monitorList = [];

    monitorList.add(new ModuleModel('OrderMeal', _getColorFromHex("#40E0D0"),
        true, 'Order Meal', Icons.fastfood_outlined));
    monitorList.add(new ModuleModel('Store', _getColorFromHex("#DE3163"), true,
        'Store', Icons.shopping_bag_outlined));
    monitorList.add(new ModuleModel('MyInvoice', _getColorFromHex("#35438e"),
        true, 'My invoice', Icons.cloud_upload_outlined));
    monitorList.add(new ModuleModel('Activities', _getColorFromHex("#34495E"),
        true, 'Activities', Icons.pedal_bike_outlined));
    monitorList.add(new ModuleModel(
        'StudentAttendance',
        _getColorFromHex("#008080"),
        true,
        'Attendance',
        Icons.fact_check_outlined));
    monitorList.add(new ModuleModel('Topup', _getColorFromHex("#FF7F50"), true,
        'Topup', Icons.phone_android_outlined));
    monitorList.add(new ModuleModel(
        'TransferMoney',
        _getColorFromHex("#CB4335"),
        true,
        'Transfer money',
        Icons.attach_money));
    monitorList.add(new ModuleModel('MFPTopup', _getColorFromHex("#2980B9"),
        true, 'MFP Topup', Icons.print));
    monitorList.add(new ModuleModel('Donation', _getColorFromHex("#008080"),
        true, 'Donation', Icons.money));
    monitorList.add(new ModuleModel('ParentPickup', _getColorFromHex("#8E44AD"),
        true, 'Parent Pickup', Icons.directions_walk));
    monitorList.add(new ModuleModel(
        'IDCardRequest',
        _getColorFromHex("#2874A6"),
        true,
        'ID card request',
        Icons.card_travel));
    monitorList.add(new ModuleModel('StudentTracking',
        _getColorFromHex("#34495E"), true, 'Student tracking', Icons.map));
    monitorList.add(new ModuleModel(
        'HolidayCalendar',
        _getColorFromHex("#8E44AD"),
        true,
        'Holiday Calendar',
        Icons.calendar_today));
    return monitorList;
  }

  AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes: 10)),
      subject: 'Public Holiday',
      color: Colors.blue,
      startTimeZone: '',
      endTimeZone: '',
    ));
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes: 10)),
      subject: 'School Holiday',
      color: Colors.red,
      startTimeZone: '',
      endTimeZone: '',
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1)),
      subject: 'School Holiday',
      color: Colors.red,
      startTimeZone: '',
      endTimeZone: '',
    ));

    return AppointmentDataSource(appointments);
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<HolidayModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
