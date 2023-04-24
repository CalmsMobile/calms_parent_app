import '/common/alert_dialog.dart';
import '/common/widgets/select_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShareMoney extends StatefulWidget {
  const ShareMoney();

  final int senderIndex = 0;
  final int receiverIndex = 1;

  @override
  _ShareMoneyState createState() => _ShareMoneyState();
}

class _ShareMoneyState extends State<ShareMoney> {
  TextEditingController amountController = TextEditingController();

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

    int senderIndex = widget.senderIndex;
    int receiverIndex = widget.receiverIndex;
    return Scaffold(
      appBar: getMyAppbar("Transfer money", []),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                margin: EdgeInsets.all(0),
                width: double.infinity,
                child: Text(
                  "From",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            new Divider(
              height: 0.1,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
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
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                margin: EdgeInsets.all(0),
                width: double.infinity,
                child: Text(
                  "To",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            new Divider(
              height: 0.1,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.only(left: 10),
              color: Colors.grey.shade300,
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                onTap: () => {openMemberBottomSheet(context, familyList)},
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      NetworkImage(familyList[receiverIndex]['image']),
                  radius: 24,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      familyList[receiverIndex]['name'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MYR ${double.parse(familyList[receiverIndex]["balance"]).toStringAsFixed(2)}',
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
            new Divider(
              height: 0.1,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 0.0),
                margin: EdgeInsets.all(0),
                width: double.infinity,
                child: Text(
                  "Transfer Amount",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: double.infinity,
              child: Row(children: [
                Icon(
                  Icons.currency_exchange,
                  size: 14,
                  color: Colors.grey.shade500,
                ),
                Flexible(
                  child: Container(
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      controller: amountController,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                      onChanged: (text) {
                        if (int.parse(amountController.text) >
                            int.parse(familyList[senderIndex]['balance']))
                          amountController.text = amountController.text
                              .substring(0, amountController.text.length - 1);
                        amountController.selection = TextSelection.fromPosition(
                            TextPosition(offset: amountController.text.length));

                        setState(() {});
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
                              " Minimun transfer amount is MYR 1.00.  Maximum transfer amount is MYR 1000.00",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ])),
              ),
            ),
            InkWell(
              onTap: () => showAlert(context),
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

  showAlert(BuildContext buildContext) {
    MyCustomAlertDialog().showCustomAlert(
        context, "Confirmation", "Do you want to trnasfer money?", false, () {
      Navigator.pop(context);
      MyCustomAlertDialog().showToast(context, "Transferred successfully");
      Navigator.of(context).pop();
    }, () {
      Navigator.pop(context);
    });
  }
}
