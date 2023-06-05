import '/common/alert_dialog.dart';
import '/common/widgets/select_member.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails();

  @override
  _InvoiceDetailsState createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  bool isPaid(String totalAmount, String paidAmount) {
    return double.parse(paidAmount) >= double.parse(totalAmount);
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> activityInfo =
        ModalRoute.of(context)?.settings.arguments as Map;
    print(activityInfo);
    return Scaffold(
      appBar: getMyAppbar("Invoice Details", [
        Container(
          height: 30,
          width: 140,
          margin: EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  horizontalTitleGap: 2,
                  contentPadding: EdgeInsets.zero,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        activityInfo['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        activityInfo['memberId'],
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
                    backgroundImage: NetworkImage(activityInfo['user_image']),
                    radius: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 0),
          child: Column(children: <Widget>[
            new Divider(
              height: 0.1,
            ),
            Container(
                padding: EdgeInsets.only(
                    left: 15.0, top: 10.0, bottom: 10.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activityInfo['title'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'MYR ${double.parse(activityInfo['invoice_amount']).toStringAsFixed(2)}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        MyCustomAlertDialog()
                            .showToast(context, "Item added to cart ");
                        setState(() {});
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(left: 3),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Image.asset("assets/images/cart_round.png"),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
                child: Text(
                  "DESCRIPTION",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(
                    left: 15.0, top: 0.0, bottom: 10.0, right: 15),
                child: Text(
                  activityInfo['description'],
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invoice #",
                  ),
                  Text(
                    activityInfo["invoice_no"],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Student Class",
                  ),
                  Text(
                    "Y2C1",
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Student Year & Grade",
                  ),
                  Text(
                    "Year2, Primary",
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                  ),
                  Text(
                    isPaid(activityInfo["invoice_amount"],
                            activityInfo["paid_to_date"])
                        ? "Paid"
                        : "Pending",
                    style: TextStyle(
                        color: isPaid(activityInfo["invoice_amount"],
                                activityInfo["paid_to_date"])
                            ? Colors.green
                            : Colors.red),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invoice date",
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(DateFormat('dd-mm-yyyy')
                        .parse(activityInfo['invoice_date'])),
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Due date",
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(DateFormat('dd-mm-yyyy')
                        .parse(activityInfo['invoice_date'])),
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Invoice amount",
                  ),
                  Text(
                    'MYR ${double.parse(activityInfo['invoice_amount']).toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Paid to date",
                  ),
                  Text(
                    'MYR ${double.parse(activityInfo['paid_to_date']).toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Outstanding amount",
                  ),
                  Text(
                    'MYR ${double.parse(activityInfo['outstanding_amount']).toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Penalty amount",
                  ),
                  Text(
                    'MYR ${double.parse(activityInfo['penalty_amount']).toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 10),
              height: 1,
              color: Colors.grey.shade300,
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
              child: customBottomSheetActionBar(context, "Attachments", false,
                  Colors.grey.shade200, false, true, 14),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: ListTile(
                leading: ClipPath(
                  clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60))),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://103.6.163.49:2008/calmsweb/Parent/Images/Invoice/default.png"),
                            fit: BoxFit.fill)),
                  ),
                ),
                title: Text("Invoice document 1"),
                trailing: Icon(Icons.download),
              ),
            ),
            if (!activityInfo['installment'])
              Container(
                height: 40,
                margin: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
                child: customBottomSheetActionBar(
                    context,
                    "Last transaction history",
                    false,
                    Colors.grey.shade200,
                    false,
                    true,
                    14),
              ),
            if (!activityInfo['installment'])
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          children: [
                            ListTile(
                              title: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Receipt # ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "INV47",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  )
                                ]),
                              ),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.payment,
                                            size: 16,
                                            color: Colors.black,
                                          )),
                                          TextSpan(
                                            text: " Wallet",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          WidgetSpan(
                                              child: Container(
                                            width: 5,
                                          )),
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.attach_money,
                                            size: 16,
                                            color: Colors.black,
                                          )),
                                          TextSpan(
                                            text: "10.00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.calendar_month,
                                            size: 16,
                                            color: Colors.black,
                                          )),
                                          TextSpan(
                                            text:
                                                " ${DateFormat('dd-MMM-yyyy').format(DateFormat('dd-mm-yyyy').parse(activityInfo['invoice_date']))}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                          )
                                        ]),
                                      ),
                                    )
                                  ]),
                              trailing: Container(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.flag_circle,
                                      size: 16,
                                      color: Colors.greenAccent,
                                    )),
                                    TextSpan(
                                      text: " Success",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.greenAccent,
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 15),
                              child: Divider(
                                height: 0.2,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            if (activityInfo['installment'])
              Container(
                height: 40,
                margin: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
                child: customBottomSheetActionBar(context, "Installment", false,
                    Colors.grey.shade200, false, true, 14),
              ),
            if (activityInfo['installment'])
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          children: [
                            ListTile(
                              title: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Installment # ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "$index",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  )
                                ]),
                              ),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.attach_money,
                                            size: 16,
                                            color: Colors.black,
                                          )),
                                          TextSpan(
                                            text: " 15.00",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.calendar_month,
                                            size: 16,
                                            color: Colors.black,
                                          )),
                                          TextSpan(
                                            text:
                                                " ${DateFormat('dd-MMM-yyyy').format(DateFormat('dd-mm-yyyy').parse(activityInfo['invoice_date']))}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                          )
                                        ]),
                                      ),
                                    )
                                  ]),
                              trailing: Container(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.flag_circle,
                                      size: 16,
                                      color: Colors.greenAccent,
                                    )),
                                    TextSpan(
                                      text: " Success",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.greenAccent,
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 15),
                              child: Divider(
                                height: 0.2,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
          ]),
        ),
      ),
    );
  }
}
