import 'package:calms_parent/common/HexColor.dart';
import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:calms_parent/ui/screens/activities/Activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InvoicePayment extends StatefulWidget {
  const InvoicePayment();
  List<Map<dynamic, dynamic>> getStoreList() {
    return [
      {
        "invoice_no": "TF-X01-11032022-33",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "School fees",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "5",
        "paid_to_date": "2",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "4",
        "invoice_date": "01-12-2021",
        "installment": false,
      },
      {
        "invoice_no": "TF-X01-11032022-23",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "Transportation Fee",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "56.50",
        "paid_to_date": "6",
        "outstanding_amount": "0",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "10",
        "invoice_date": "31-12-2021",
        "installment": true
      },
      {
        "invoice_no": "TF-X01-11032022-22",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "School Fee",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "20",
        "paid_to_date": "20",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "4",
        "invoice_date": "01-12-2021",
        "installment": false
      },
      {
        "invoice_no": "TF-X01-11032022-12",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "Book Fee",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "5",
        "paid_to_date": "2",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "10",
        "invoice_date": "01-12-2021",
        "installment": false
      },
      {
        "invoice_no": "TF-X01-11032022-11",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "School Fee",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "5",
        "paid_to_date": "2",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "4",
        "invoice_date": "01-12-2021",
        "installment": false
      },
      {
        "invoice_no": "TF-X01-11032022-00",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "Transportation Fee",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "5",
        "paid_to_date": "2",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "12",
        "invoice_date": "01-12-2021",
        "installment": false
      },
      {
        "invoice_no": "TF-X01-11032022-01",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "Book Fee",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "5",
        "paid_to_date": "2",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "4",
        "invoice_date": "01-12-2021",
        "installment": false
      },
      {
        "invoice_no": "TF-X01-11032022-02",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "Tution Fee",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "5",
        "paid_to_date": "2",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "40",
        "invoice_date": "01-12-2021",
        "installment": true
      },
      {
        "invoice_no": "TF-X01-11032022-03",
        "name": "James",
        "memberId": "M0001",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "School fees",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "5",
        "paid_to_date": "2",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "4",
        "invoice_date": "01-12-2021",
        "installment": false
      },
      {
        "invoice_no": "TRA1234",
        "memberId": "M0001",
        "name": "James",
        "user_image": "https://randomuser.me/api/portraits/men/2.jpg",
        "class": "Y5C1",
        "title": "Transportation Fee",
        "description":
            "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
        "invoice_amount": "15",
        "paid_to_date": "8",
        "outstanding_amount": "3",
        "image": [
          "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
          "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
        ],
        "penalty_amount": "3",
        "invoice_date": "01-12-2021",
        "installment": false
      },
    ];
  }

  @override
  _InvoicePaymentState createState() => _InvoicePaymentState();
}

class _InvoicePaymentState extends State<InvoicePayment> {
  // This list holds the data for the list view
  List<Map<dynamic, dynamic>> _foundInvoice = [];
  var sortList = ["Paid", "Pending"];

  var selectedSortby = "Paid";
  bool searchEnable = false;

  int cartCount = 0;

  int senderIndex = 2;

  @override
  void initState() {
    _foundInvoice = widget.getStoreList();
    super.initState();
  }

  List<Map> familyList = [
    {
      "name": "Desmond",
      "category": "PARENT",
      "memberId": "M1001",
      "desc": "",
      "balance": "250",
      "familtid": "FMY0001",
      "relationship": "Father",
      "email": "makame147@gmail.com",
      "image": "https://randomuser.me/api/portraits/men/11.jpg"
    },
    {
      "name": "SITI KHALIDA",
      "category": "PARENT",
      "memberId": "M1002",
      "desc": "",
      "balance": "50",
      "familtid": "FMY0001",
      "relationship": "Mother",
      "email": "calms.rnd@gmail.com",
      "image": "https://randomuser.me/api/portraits/women/11.jpg"
    },
    {
      "name": "HAZIM",
      "category": "STUDENT",
      "email": "",
      "balance": "100.00",
      "class": "Class3",
      "contact": "0123467589",
      "memberId": "M1001",
      "desc": "Member account does not exist in MFP software",
      "image": "https://randomuser.me/api/portraits/men/2.jpg"
    },
    {
      "name": "MARIE LIM",
      "category": "STUDENT",
      "email": "",
      "balance": "0.00",
      "class": "Class4",
      "memberId": "M1001",
      "contact": "1345657",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/3.jpg"
    },
    {
      "name": "Danny",
      "category": "STUDENT",
      "email": "",
      "balance": "30.00",
      "contact": "565467898",
      "memberId": "M1001",
      "class": "Class6",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/4.jpg"
    },
  ];

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<dynamic, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget.getStoreList();
    } else {
      results = widget
          .getStoreList()
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundInvoice = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: HexColor("#f5f8fd"),
          titleSpacing: -5,
          title: searchEnable
              ? Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: TextField(
                      autofocus: true,
                      onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              searchEnable = !searchEnable;
                              setState(() {});
                            },
                          ),
                          hintText: 'Search by Item name',
                          border: InputBorder.none),
                    ),
                  ),
                )
              : Text(
                  "Invoice Payment",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
          actions: [
            if (!searchEnable)
              if (familyList.length > 0 && senderIndex > -1)
                Container(
                  height: 30,
                  width: 140,
                  child: Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          onTap: () => {
                            openMemberBottomSheet(context, familyList, (index) {
                              Navigator.pop(context);
                              senderIndex = index;
                              setState(() {});
                            })
                          },
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                familyList[senderIndex]['name'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                familyList[senderIndex]['memberId'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(familyList[senderIndex]['image']),
                            radius: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            // if (!searchEnable)
            //   IconButton(
            //     onPressed: () {
            //       searchEnable = !searchEnable;
            //       setState(() {});
            //     },
            //     icon: Icon(Icons.search),
            //   ),
            // if (!searchEnable)
            //   IconButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .pushNamed('/FilterActivities', arguments: "");
            //     },
            //     icon: Icon(Icons.filter_alt_outlined),
            //   ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              new BoxShadow(
                color: Colors.grey,
                blurRadius: 1.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  openSortByBottomSheet(context, sortList, (index1) {
                    selectedSortby = sortList[index1];
                    setState(() {});
                    Navigator.of(context).pop();
                  }, selectedSortby);
                },
                child: Container(
                  height: 45,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.sort,
                          size: 18,
                          color: Colors.black54,
                        )),
                        TextSpan(
                          text: " SORT BY",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  searchEnable = !searchEnable;
                  setState(() {});
                },
                child: Container(
                  height: 45,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.search_rounded,
                          size: 18,
                          color: Colors.black54,
                        )),
                        TextSpan(
                          text: " SEARCH",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: _foundInvoice.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: <Widget>[
                        new Divider(
                          height: 0.1,
                        ),
                        ListTile(
                          horizontalTitleGap: 5,
                          leading: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.0)),
                            child: _foundInvoice[index]['user_image'] != null
                                ? Image.network(
                                    _foundInvoice[index]['user_image'],
                                    // width: 300,
                                    height: 100,
                                    fit: BoxFit.fill)
                                : Image.asset("assets/images/user.png"),
                          ),
                          title: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Invoice #:",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5, left: 3),
                                    child: Text(
                                      _foundInvoice[index]['invoice_no'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.emoji_transportation,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(top: 5, left: 3),
                                        child: Text(
                                          _foundInvoice[index]['title'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 5,
                                        ),
                                        child: Icon(
                                          Icons.account_balance_wallet,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(top: 5, left: 3),
                                        child: Text(
                                          'MYR ${double.parse(_foundInvoice[index]['invoice_amount']).toStringAsFixed(2)}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 5,
                                        ),
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(top: 5, left: 3),
                                        child: Text(
                                          'Due date : ${_foundInvoice[index]['invoice_date']?.toString() ?? _foundInvoice[index]['invoice_date']}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: isPaid(
                                                    _foundInvoice[index]
                                                        ["invoice_amount"],
                                                    _foundInvoice[index]
                                                        ["paid_to_date"])
                                                ? Color.fromARGB(
                                                    255, 72, 214, 87)
                                                : Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Text(storeList[index]['invoice_date'])
                            ],
                          ),
                          isThreeLine: true,
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                isPaid(_foundInvoice[index]["invoice_amount"],
                                        _foundInvoice[index]["paid_to_date"])
                                    ? "PAID"
                                    : "PENDING",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: isPaid(
                                          _foundInvoice[index]
                                              ["invoice_amount"],
                                          _foundInvoice[index]["paid_to_date"])
                                      ? Color.fromARGB(255, 72, 214, 87)
                                      : Colors.redAccent,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              isPaid(_foundInvoice[index]["invoice_amount"],
                                      _foundInvoice[index]["paid_to_date"])
                                  ? Text(
                                      "Dummy",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        openDonationBottomSheet(
                                            context, _foundInvoice[index]);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        margin:
                                            EdgeInsets.only(right: 3, top: 2),
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.black, width: 2)),
                                        child: Image.asset(
                                            "assets/images/cart_round.png"),
                                      ),
                                    ),
                            ],
                          ),
                          onTap: () => {
                            Navigator.of(context).pushNamed('/InvoiceDetails',
                                arguments: _foundInvoice[index])
                          },
                        )
                      ]);
                    }),
              ),
            )
          ]),
        ));
  }

  void openFilterBottomSheet(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          print("bottomsheet clicked");
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                title: Text("Filter"),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.close_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    "Pending",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 0.3,
                  color: Colors.grey,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text(
                    "Paid",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

bool isPaid(String totalAmount, String paidAmount) {
  return double.parse(paidAmount) >= double.parse(totalAmount);
}

void openDonationBottomSheet(BuildContext buildContext, invoice) {
  TextEditingController amountController = TextEditingController();

  showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        print("bottomsheet clicked");
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppBar(
              title: Text(
                "Payment Summary",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              elevation: 1,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.close_sharp, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  invoice["description"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invoice Amount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'MYR ${double.parse(invoice['invoice_amount']).toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Already you have paid",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'MYR ${double.parse(invoice['paid_to_date']).toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pay amount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      controller: amountController,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                      onChanged: (text) {
                        if (int.parse(amountController.text) >
                            (int.parse(invoice['invoice_amount']) -
                                int.parse(invoice['paid_to_date'])))
                          amountController.text = amountController.text
                              .substring(0, amountController.text.length - 1);
                        amountController.selection = TextSelection.fromPosition(
                            TextPosition(offset: amountController.text.length));
                      },
                      decoration: const InputDecoration(
                        hintText: '0.00',
                        isDense: true,
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        prefixIcon: Text(
                          ' MYR ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                        // Allow Decimal Number With Precision of 2 Only
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                MyCustomAlertDialog().showToast(context, "Item added to cart ");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(1),
                  border: Border(
                    bottom: BorderSide(color: Colors.pinkAccent, width: 1),
                    right: BorderSide(color: Colors.pinkAccent, width: 1),
                    top: BorderSide(color: Colors.pinkAccent, width: 1),
                    left: BorderSide(color: Colors.pinkAccent, width: 1),
                  ),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.pinkAccent,
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                margin:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Proceed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            )
          ],
        );
      });
}
