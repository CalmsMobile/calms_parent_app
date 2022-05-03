import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MerchantTransaction extends StatefulWidget {
  const MerchantTransaction();

  @override
  _MerchantTransactionState createState() => _MerchantTransactionState();
}

List<Map<dynamic, dynamic>> getMerchantList() {
  return [
    {
      "orderId": "OID10044",
      "transaction_for": "James",
      "category": "Bill Pay",
      "receipt_no": "INV5",
      "transaction_by": "Admin",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Cash",
      "amount": "781.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Fund Transfer from Olivia",
      "receipt_no": "FTN11",
      "transaction_by": "Administrator",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Wallet",
      "amount": "65.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Activities",
      "receipt_no": "ETR8",
      "transaction_by": "Willow smith",
      "date": "25/12/2021 02:14 PM",
      "mode_of_payment": "Wallet",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Cancelled",
      "receipt_no": "VET5",
      "transaction_by": "Admin",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Cash",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Activities",
      "receipt_no": "ETR8",
      "transaction_by": "Willow smith",
      "date": "25/12/2021 02:14 PM",
      "mode_of_payment": "Wallet",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Cancelled",
      "receipt_no": "VET5",
      "transaction_by": "Admin",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Cash",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Cancelled",
      "receipt_no": "VET5",
      "transaction_by": "Admin",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Cash",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10044",
      "transaction_for": "James",
      "category": "Bill Pay",
      "receipt_no": "INV5",
      "transaction_by": "Admin",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Cash",
      "amount": "781.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Fund Transfer from Olivia",
      "receipt_no": "FTN11",
      "transaction_by": "Administrator",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Wallet",
      "amount": "65.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Activities",
      "receipt_no": "ETR8",
      "transaction_by": "Willow smith",
      "date": "25/12/2021 02:14 PM",
      "mode_of_payment": "Wallet",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Cancelled",
      "receipt_no": "VET5",
      "transaction_by": "Admin",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Cash",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Activities",
      "receipt_no": "ETR8",
      "transaction_by": "Willow smith",
      "date": "25/12/2021 02:14 PM",
      "mode_of_payment": "Wallet",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Cancelled",
      "receipt_no": "VET5",
      "transaction_by": "Admin",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Cash",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
    {
      "orderId": "OID10059",
      "transaction_for": "James",
      "category": "Cancelled",
      "receipt_no": "VET5",
      "transaction_by": "Admin",
      "date": "23/12/2021 04:40 PM",
      "mode_of_payment": "Cash",
      "amount": "100.00",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLEoiR0baQCYjpHMu_DEsv6qmGkXs99lvRRxAnhZj3_pM_qsIRdYFnjZ5Lozl4q2KNg&usqp=CAU"
    },
  ];
}

class _MerchantTransactionState extends State<MerchantTransaction> {
  @override
  Widget build(BuildContext context) {
    final profileData = ModalRoute.of(context)?.settings.arguments as Map;
    List<Map<dynamic, dynamic>> statementList = getMerchantList();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -10.0,
        centerTitle: false,
        title: Container(
          margin: EdgeInsets.only(left: 0),
          padding: EdgeInsets.zero,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(profileData["image"]),
              radius: 20,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      profileData['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    )),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    profileData["email"],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Wrap(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                        Text(
                          "20/12/2021",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    onTap: () => {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime.now(),
                          theme: DatePickerTheme(
                              headerColor: Theme.of(context).primaryColor,
                              backgroundColor: Colors.white,
                              itemStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              cancelStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (date) {}, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en)
                    },
                  ),
                  Padding(padding: EdgeInsets.only(left: 6)),
                  Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(right: 6)),
                  InkWell(
                    child: Wrap(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                        Text(
                          "20/12/2021",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    onTap: () => {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime.now(),
                          theme: DatePickerTheme(
                              headerColor: Theme.of(context).primaryColor,
                              backgroundColor: Colors.white,
                              itemStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              cancelStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (date) {}, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en)
                    },
                  ),
                  Padding(padding: EdgeInsets.only(right: 6)),
                ],
              )
            ],
            title: Text(
              "Merchant Transaction",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: statementList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    new Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(statementList[index]['image']),
                        radius: 20,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                statementList[index]['transaction_for'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              )),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              statementList[index]['category'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "Receipt: #" + statementList[index]['receipt_no'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "Transaction by :" +
                                  statementList[index]['transaction_by'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              statementList[index]['date'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      isThreeLine: true,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          new RichText(
                            text: new TextSpan(
                              text: "MYR ",
                              style: new TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: statementList[index]['amount'],
                                    style: new TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          statementList[index]['mode_of_payment'] != ""
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6.0)),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    color: Theme.of(context).primaryColor,
                                    child: Text(
                                      statementList[index]['mode_of_payment'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    )
                  ]);
                }),
          ))
        ],
      ),
    );
  }
}
