import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:calms_parent/main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  String selectedUser = "";
  String donationType = "";
  String amount = "";
  String modeOfPayment = "";
  List<Map> get getModeOfPaymentList => [
        {
          "name": "Boost",
          "desc": "",
        },
        {
          "name": "Global Payment",
          "desc": "",
        },
        {
          "name": "Cash",
          "desc": "",
        },
        {
          "name": "iPay88",
          "desc": "",
        },
        {
          "name": "FPX Online Payment",
          "desc": "",
        },
        {
          "name": "DuitKu",
          "desc": "",
        },
      ];
  List<Map> get getDonationList => [
        {
          "name": "Education",
          "desc": "",
          "image":
              "https://akm-img-a-in.tosshub.com/indiatoday/images/story/201810/online-3412473_1920.jpeg?meGHIUut1mybIL3pem8eWqk34osmW3Zi"
        },
      ];

  var donationList = ["Test", "Donation 01", "Donation 02"];

  var selectedModalValue = "Test";
  var senderIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map> familyList = [
      {
        "name":
            "Desmond Henry King Luther Martin John Abraham Luther Martin John Abraham",
        "category": "PARENT",
        "memberId": "M1001",
        "desc": "",
        "balance": "25",
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
        "balance": "500010000",
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
    ];
    print(selectedUser);
    return Scaffold(
      appBar: getMyAppbar("Donation", []),
      body: Container(
        margin: EdgeInsets.only(left: 0),
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 5),
              height: 30,
              child: getBottomSheetActionBar(
                  context, "Member", false, Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 20, right: 20),
              padding: EdgeInsets.only(left: 10),
              color: Colors.grey.shade300,
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                onTap: () => {openMemberBottomSheet(context, familyList)},
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      NetworkImage(familyList[senderIndex]['image']),
                  radius: 24,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        familyList[senderIndex]['name'],
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MYR ${double.parse(familyList[senderIndex]["balance"]).toStringAsFixed(2)}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
                trailing: Container(
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 5),
              height: 30,
              child: getBottomSheetActionBar(
                  context, "Donation Type", false, Colors.white),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey.shade300,
              margin: EdgeInsets.only(top: 0, left: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    'Select Donation Type',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: donationList
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedModalValue,
                  onChanged: (value) {
                    setState(() {
                      selectedModalValue = value as String;
                    });
                  },
                  buttonHeight: 70,
                  buttonWidth: 140,
                  itemHeight: 70,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              height: 30,
              child: getBottomSheetActionBar(
                  context, "Amount", false, Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 10, right: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Row(children: [
                Icon(
                  Icons.currency_exchange,
                  size: 14,
                  color: Colors.black,
                ),
                Flexible(
                  child: Container(
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
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
                        // Allow Decimal Number With Precision of 2 Only
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}')),
                      ],
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Image.asset(
                        "assets/images/alert.png",
                        width: 15,
                        height: 15,
                      )),
                      TextSpan(
                          text:
                              " Minimun donation amount is MYR 1.00.  Maximum donation amount is MYR 1000.00",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ])),
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
                    EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      color: Colors.pinkAccent,
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
        ),
      ),
    );
  }

  void openMemberBottomSheet(BuildContext buildContext, getfamilyList) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                title: Text(
                  "Select",
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
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: getfamilyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(getfamilyList[index]['image']),
                          radius: 20,
                        ),
                        title: new Text(
                          getfamilyList[index]["name"],
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        subtitle: Container(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.account_balance_wallet,
                                size: 18,
                                color: Colors.grey.shade500,
                              )),
                              TextSpan(
                                text: " balance",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text: " MYR  ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.redAccent,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${double.parse(getfamilyList[index]['balance']).toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]);
                  })
            ],
          );
        });
  }

  void openDonationTypeBottomSheet(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: getDonationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(getDonationList[index]['image']),
                          radius: 20,
                        ),
                        title: new Text(getDonationList[index]["name"]),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            donationType = getDonationList[index]["name"];
                          });
                        },
                      ),
                    ]);
                  })
            ],
          );
        });
  }

  void openModeOfPaymentBottomSheet(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: getModeOfPaymentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        title: new Text(getModeOfPaymentList[index]["name"]),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            modeOfPayment = getModeOfPaymentList[index]["name"];
                          });
                        },
                      ),
                    ]);
                  })
            ],
          );
        });
  }
}
