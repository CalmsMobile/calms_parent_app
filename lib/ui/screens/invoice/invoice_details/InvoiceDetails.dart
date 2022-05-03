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
      appBar: AppBar(
        title: Text("Invoice Details"),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: Column(children: <Widget>[
          new Divider(
            height: 0.1,
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              child: activityInfo['image'] != null
                  ? Image.network(activityInfo['image'][0],
                      width: double.infinity, height: 180, fit: BoxFit.cover)
                  : Image.asset("images/user.png"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  topRight: Radius.circular(60.0),
                  bottomLeft: Radius.circular(60.0),
                  bottomRight: Radius.circular(60.0),
                ),
                child: activityInfo['user_image'] != null
                    ? Image.network(activityInfo['user_image'],
                        // width: 300,
                        height: 100,
                        fit: BoxFit.fill)
                    : Image.asset("images/user.png"),
              ),
              title: Text(
                activityInfo['name'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              trailing: Text(
                'MYR ${double.parse(activityInfo['invoice_amount']).toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Text(
                "INVOICE #",
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
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Text(
                activityInfo['invoice_no'],
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
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
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Text(
                activityInfo['description'],
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Text(
                "DUE DATE",
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
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(
                    DateFormat.yMMMEd().format(DateFormat('dd-mm-yyyy')
                        .parse(activityInfo['invoice_date'])),
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Text(
                "PAY STATUS",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: SizedBox(
                height: 25,
                width: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: isPaid(activityInfo["invoice_amount"],
                              activityInfo["paid_to_date"])
                          ? Colors.green
                          : Colors.red,
                      padding: EdgeInsets.zero),
                  onPressed: () => {},
                  child: Text(isPaid(activityInfo["invoice_amount"],
                          activityInfo["paid_to_date"])
                      ? "Paid"
                      : "Pending"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ADD TO CART",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                  height: 25,
                  width: 25,
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent, // Button color
                      child: InkWell(
                        splashColor: Colors.red, // Splash color
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
