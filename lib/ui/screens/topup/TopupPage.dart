import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:calms_parent/ui/screens/widgets/TopupView.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatefulWidget {
  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  List<Map<String, dynamic>> get _values => [];

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
    return Scaffold(
      appBar: getMyAppbar("Topup", []),
      body: getTopupView(context, familyList, _values),
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
                // Navigator.of(buildContext).pop();
                var paymentList = [
                  {
                    "name": "FPX Online Payment",
                    "id": "fpx",
                    "image":
                        "http://124.217.235.107:2008/calmsweb/Images/noimage.png"
                  },
                  {
                    "name": "Boost",
                    "id": "boost",
                    "image":
                        "http://124.217.235.107:2008/calmsweb/Images/noimage.png"
                  },
                  {
                    "name": "Global Payment",
                    "id": "global",
                    "image":
                        "http://124.217.235.107:2008/calmsweb/Images/noimage.png"
                  },
                ];
                showPaymentSelectOption(
                    context, "Choose your payment method", paymentList,
                    (index1) {
                  print(index1);
                  Navigator.of(context).pop();
                });
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
