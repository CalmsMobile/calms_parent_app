import 'dart:convert';
import 'dart:math';
import 'package:calms_parent/common/HexColor.dart';
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
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
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
      "receipt_no": "RCPT001",
      "topupby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "mode_of_topup": "Counter-topup",
      "date": "30/11/2021 12:30 am",
      "amount": "450.00",
      "receipt_no": "RCPT001",
      "topupby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "Olivia",
      "mode_of_topup": "Online",
      "date": "30/11/2021 02:30 pm",
      "amount": "100.00",
      "receipt_no": "RCPT001",
      "topupby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "mode_of_topup": "Counter-topup",
      "date": "30/11/2021 02:30 pm",
      "amount": "23.00",
      "receipt_no": "RCPT001",
      "topupby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "James",
      "mode_of_topup": "Online",
      "date": "30/11/2021 03:30 pm",
      "amount": "2043.50",
      "receipt_no": "RCPT001",
      "topupby": "John Abraham",
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
      "purchaseby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "pay_for": "Canteen",
      "orderID": "ORD002",
      "date": "30/11/2021 10:00 am",
      "amount": "450.00",
      "purchaseby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "Olivia",
      "pay_for": "Meal",
      "orderID": "ORD003",
      "date": "30/11/2021 01:30 pm",
      "amount": "100.00",
      "purchaseby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    },
    {
      "name": "James",
      "pay_for": "Canteen",
      "orderID": "ORD004",
      "date": "30/11/2021 04:00 pm",
      "amount": "23.00",
      "purchaseby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpway9lZBTwtk500jCpu4BGAxHOnY0Pc6ElELDrc95Z7U3j9R6hf1h-rxZIKkJ9p_1rhA&usqp=CAU"
    },
    {
      "name": "James",
      "pay_for": "Meal",
      "orderID": "ORD005",
      "date": "30/11/2021 08:00 pm",
      "amount": "2043.50",
      "purchaseby": "John Abraham",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2iHiAT-ICPyezz_uJzuUWArjKnNDaruP-DbfLD0CWrT-oqjcpe2RfBLDl9DTRbFw9qQ&usqp=CAU"
    }
  ];
  final List<Map> familyList;
  final List<Map> storeItem = [
    {
      "category": "Stationery",
      "item_name": "Color Box",
      "inventory_code": "S1011",
      "description":
          "46 PCS Color Set has a lot of fun features to keep your baby engaged. It has 42 pieces It contain 12 water color, 6 sketch color, a sharpner, an eraser, 10 crayons color, 8 oil pastel colors, a glue, a paper clip and a box. Very nice product for your kid It improves creative power of your dear ones. Improves visual skills, creative skills and coordination skills of your child Designed keeping safety of your child on priority basis Always choose Happiesta for your kids Happiness",
      "is_dress": 1,
      "price": "10.00",
      "discount": "5%",
      "available_quantity": 50,
      "applicable_group": "YEAR1, YEAR2",
      "image": [
        "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "colors": ["White", "Black", "Red", "Blue"],
      "size": ["S", "M", "L", "XL", "XXL"],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "category": "Stationery",
      "item_name": "student-plastic-id-card-holder-500x500",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "10.00",
      "discount": "5%",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "category": "Stationery",
      "item_name": "student-plastic-id-card-holder-500x500",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "10.00",
      "discount": "5%",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "category": "Stationery",
      "item_name": "student-plastic-id-card-holder-500x500",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "10.00",
      "discount": "5%",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "category": "Stationery",
      "item_name": "student-plastic-id-card-holder-500x500",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "10.00",
      "discount": "5%",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    }
  ];
  final List<Map> upcomingActivities = [
    {
      "acitivity_type": "EDU00001_EVENT_EVNT-1001",
      "_rev": "15-5f8395a893f523756908f0d48b073a03",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "receipt_no": "RCPT001-12111",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1001",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "School Music Festival 2019",
      "price": "100",
      "description":
          "46 PCS Color Set has a lot of fun features to keep your baby engaged. It has 42 pieces It contain 12 water color, 6 sketch color, a sharpner, an eraser, 10 crayons color, 8 oil pastel colors, a glue, a paper clip and a box. Very nice product for your kid It improves creative power of your dear ones. Improves visual skills, creative skills and coordination skills of your child Designed keeping safety of your child on priority basis Always choose Happiesta for your kids Happiness",
      "yeargroup": ["YEAR 4", "YEAR 1", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEh7oY40Jmp5SSbhKf-CEef3PiPaPXMn8GA&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/07/31",
      "modifieddate": "2019/09/22 04:45:04 PM",
      "attachmentlist": [
        {"id": "0", "type": "application/pdf", "name": "slip_AB489665.pdf"},
        {"id": "1", "type": "image/png", "name": "dollar-icon.png"}
      ]
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1003",
      "receipt_no": "RCPT001-12111",
      "_rev": "6-3ab176b0ae96039e73b0aabc39d56221",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1003",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Dancing Competition 2019",
      "price": "20",
      "description":
          "As dance teams head into competition season, when the pressure and excitement are at an all time high, everyone could use a little extra motivation and encouragement!  To inspire your team, here are our 10 favorite motivational quotes for dancers",
      "yeargroup": ["YEAR 4", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMc_d-ufS996dH12Hw1y421z3a8fVa26eEg&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1004",
      "receipt_no": "RCPT001-12111",
      "_rev": "16-72f60d2c9fa59caeab2b71da69342780",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1004",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Sing Loud",
      "price": "50",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg-kqVxSbcllyyg6BPkuUZGB9ib4Yo5WHJEg&usqp=CAU",
      "description":
          "I think music in itself is healing. It’s an explosive expression of humanity. It’s something we are all touched by. No matter what culture we’re from, everyone loves music.",
      "yeargroup": ["YEAR 4", "YEAR 3", "YEAR 1"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "startdate": "2019/07/02",
      "enddate": "2019/08/01",
      "modifieddate": "2019/08/04 09:50:10 PM"
    },
    {
      "acitivity_type": "EDU00001_EVENT_EVNT-1001",
      "receipt_no": "RCPT001-12111",
      "_rev": "15-5f8395a893f523756908f0d48b073a03",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1001",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "School Music Festival 2019",
      "price": "100",
      "description": "Music is life",
      "yeargroup": ["YEAR 4", "YEAR 1", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEh7oY40Jmp5SSbhKf-CEef3PiPaPXMn8GA&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/07/31",
      "category": "School Trip",
      "modifieddate": "2019/09/22 04:45:04 PM",
      "attachmentlist": [
        {"id": "0", "type": "application/pdf", "name": "slip_AB489665.pdf"},
        {"id": "1", "type": "image/png", "name": "dollar-icon.png"}
      ]
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1003",
      "receipt_no": "RCPT001-12111",
      "_rev": "6-3ab176b0ae96039e73b0aabc39d56221",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1003",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Dancing Competition 2019",
      "price": "20",
      "description":
          "As dance teams head into competition season, when the pressure and excitement are at an all time high, everyone could use a little extra motivation and encouragement!  To inspire your team, here are our 10 favorite motivational quotes for dancers",
      "yeargroup": ["YEAR 4", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMc_d-ufS996dH12Hw1y421z3a8fVa26eEg&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
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
  CalendarController _controller = CalendarController();
  List<Appointment> _appointmentDetails = <Appointment>[];

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      setState(() {
        _appointmentDetails =
            calendarTapDetails.appointments!.cast<Appointment>();
      });
    }
  }

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
                          color: HexColor("#6495ED")),
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
                            color: Colors.white,
                            textColor: HexColor("#6495ED"),
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
                            color: Colors.white,
                            textColor: Colors.pinkAccent,
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
                            color: Colors.white,
                            textColor: HexColor("#6495ED"),
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
                      physics: NeverScrollableScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
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
                            "SCHOOL CALENDAR",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      height: 525,
                      child: getCalendarView(
                          context,
                          new RandomColorModel()._getCalendarDataSource(),
                          calendarTapped,
                          _appointmentDetails),
                    ),
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
        true, 'Student Pickup', Icons.directions_walk));
    // monitorList.add(new ModuleModel(
    //     'IDCardRequest',
    //     _getColorFromHex("#2874A6"),
    //     true,
    //     'ID card request',
    //     Icons.card_travel));
    monitorList.add(new ModuleModel('StudentTracking',
        _getColorFromHex("#34495E"), true, 'Student tracking', Icons.map));
    monitorList.add(new ModuleModel(
        'HolidayCalendar',
        _getColorFromHex("#8E44AD"),
        true,
        'School Calendar',
        Icons.calendar_today));
    return monitorList;
  }

  AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(minutes: 10)),
        subject: 'Public Holiday',
        color: Colors.greenAccent,
        startTimeZone: '',
        endTimeZone: '',
        notes: jsonEncode({
          "type": "Holiday",
          "actual_start_time":
              DateTime.now().add(Duration(hours: 1)).toString(),
          "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
          "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
          "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
        })));
    appointments.add(Appointment(
        startTime: DateTime.now().add(Duration(days: 1)),
        endTime: DateTime.now().add(Duration(days: 1)),
        subject: 'School Holiday',
        color: Colors.redAccent,
        startTimeZone: '',
        endTimeZone: '',
        notes: jsonEncode({
          "type": "Holiday",
          "actual_start_time":
              DateTime.now().add(Duration(hours: 1)).toString(),
          "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
          "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
          "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
        })));
    appointments.add(Appointment(
        startTime: DateTime.now().add(Duration(days: 5)),
        endTime: DateTime.now().add(Duration(days: 6)),
        subject: 'Term Holiday',
        color: Colors.orangeAccent,
        startTimeZone: '',
        endTimeZone: '',
        notes: jsonEncode({
          "type": "Holiday",
          "actual_start_time":
              DateTime.now().add(Duration(hours: 1)).toString(),
          "actual_end_time": DateTime.now().add(Duration(hours: 8)).toString(),
          "clockin_time": DateTime.now().add(Duration(hours: 1)).toString(),
          "clock_out_time": DateTime.now().add(Duration(hours: 8)).toString()
        })));

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
