import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MFPTopup extends StatefulWidget {
  const MFPTopup();

  @override
  _MFPTopupState createState() => _MFPTopupState();
}

class _MFPTopupState extends State<MFPTopup> {
  @override
  Widget build(BuildContext context) {
    List<Map> familyList = [
      {
        "name":
            "Desmond Henry King Luther Martin John Abraham Luther Martin John Abraham",
        "category": "PARENT",
        "memberId": "M1001",
        "desc": "",
        "balance": "25012323232",
        "familtid": "FMY0001",
        "relationship": "Father",
        "email": "makame147@gmail.com",
        "image": "https://randomuser.me/api/portraits/men/11.jpg"
      },
      {
        "name": "SITI KHALIDA",
        "category": "PARENT",
        "memberId": "M1002",
        "desc": "Member account does not exist in MFP software",
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
        "desc": "",
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
    return Scaffold(
      appBar: getMyAppbar("MFP Topup", []),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: familyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: <Widget>[
                        new Divider(
                          height: 0.1,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(bottom: 8, top: 8, left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 80,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                      child: familyList[index]['image'] !=
                                                  null &&
                                              familyList[index]['image'] != ""
                                          ? Image.network(
                                              familyList[index]['image'],
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover)
                                          : Image.asset(
                                              "assets/images/no_image.png",
                                              height: 80,
                                              width: 80,
                                            ),
                                    ),
                                  )),
                              Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 3, 0, 0),
                                          child: Text(
                                            familyList[index]['name'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 5, 0, 0),
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              WidgetSpan(
                                                  child: Icon(
                                                Icons.card_membership,
                                                size: 16,
                                                color: Colors.grey.shade500,
                                              )),
                                              TextSpan(
                                                text: " " +
                                                    familyList[index]
                                                        ['memberId'],
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(2, 3, 0, 0),
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              if (familyList[index]['desc'] ==
                                                  "")
                                                WidgetSpan(
                                                    child: Icon(
                                                  Icons.attach_money,
                                                  size: 18,
                                                  color: Colors.grey.shade500,
                                                )),
                                              if (familyList[index]['desc'] ==
                                                  "")
                                                TextSpan(
                                                  text: " balance",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              if (familyList[index]['desc'] ==
                                                  "")
                                                TextSpan(
                                                  text: " MYR  ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                              if (familyList[index]['desc'] ==
                                                  "")
                                                TextSpan(
                                                  text:
                                                      "${double.parse(familyList[index]['balance']).toStringAsFixed(2)}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              if (familyList[index]['desc'] !=
                                                  "")
                                                TextSpan(
                                                  text:
                                                      "${familyList[index]['desc']}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                            ]),
                                          ),
                                        ),
                                        if (familyList[index]['desc'] == "")
                                          Container(
                                            padding:
                                                EdgeInsets.fromLTRB(3, 0, 0, 0),
                                            width: double.infinity,
                                            child: Row(children: [
                                              Icon(
                                                Icons.currency_exchange,
                                                size: 14,
                                                color: Colors.grey.shade500,
                                              ),
                                              Container(
                                                width: 250,
                                                child: TextField(
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  textAlign: TextAlign.left,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: '0.00',
                                                    isDense: true,
                                                    prefixIconConstraints:
                                                        BoxConstraints(
                                                            minWidth: 0,
                                                            minHeight: 0),
                                                    prefixIcon: Text(
                                                      ' MYR ',
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                  keyboardType: TextInputType
                                                      .numberWithOptions(
                                                          decimal: true),
                                                  inputFormatters: [
                                                    // Allow Decimal Number With Precision of 2 Only
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            r'^\d*\.?\d{0,2}')),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ]);
                    }),
              ),
            ],
          ),
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
                              " Minimun reload amount is MYR 1.00.  Maximum reload amount is MYR 1000.00",
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
}
