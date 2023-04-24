import '/common/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

List<Map<dynamic, dynamic>> getStatementList() {
  return [
    {
      "orderId": "OID10044",
      "date": "23/12/2021 04:40 PM",
      "category": "Cancelled",
      "desc": "Activities Cancelled To James",
      "in": "100.00",
      "out": "0.00",
      "balance": "781.00"
    },
    {
      "orderId": "OID10053",
      "date": "22/12/2021 02:46 PM",
      "category": "Fund Transfer In",
      "desc": "Fund Transfer In From Olivia",
      "in": "5.00	",
      "out": "0.00",
      "balance": "616.00"
    },
    {
      "orderId": "OID10046",
      "date": "22/12/2021 02:08 PM",
      "category": "Refund",
      "desc": "Refund To James",
      "in": "50.00",
      "out": "0.00",
      "balance": "611.00"
    },
    {
      "orderId": "OID10039",
      "date": "20/12/2021 01:29 PM",
      "category": "MFP TopUp",
      "desc": "MFP TopUp To James",
      "in": "0.00",
      "out": "100.00	",
      "balance": "0.00"
    },
    {
      "orderId": "OID10044",
      "date": "23/12/2021 04:40 PM",
      "category": "Cancelled",
      "desc": "Activities Cancelled To James",
      "in": "100.00",
      "out": "0.00",
      "balance": "781.00"
    },
    {
      "orderId": "OID10053",
      "date": "22/12/2021 02:46 PM",
      "category": "Fund Transfer In",
      "desc": "Fund Transfer In From Olivia",
      "in": "5.00	",
      "out": "0.00",
      "balance": "616.00"
    },
    {
      "orderId": "OID10046",
      "date": "22/12/2021 02:08 PM",
      "category": "Refund",
      "desc": "Refund To James",
      "in": "50.00",
      "out": "0.00",
      "balance": "611.00"
    },
    {
      "orderId": "OID10039",
      "date": "20/12/2021 01:29 PM",
      "category": "MFP TopUp",
      "desc": "MFP TopUp To James",
      "in": "0.00",
      "out": "100.00	",
      "balance": "0.00"
    }
  ];
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profileData = ModalRoute.of(context)?.settings.arguments as Map;
    return ProfileSLPage(profileData, getStatementList());
  }
}

class ProfileSLPage extends StatelessWidget {
  const ProfileSLPage(this.profileData, this.statementList);

  final List<Map<dynamic, dynamic>> statementList;
  final Map<dynamic, dynamic> profileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -10.0,
        centerTitle: false,
        backgroundColor: HexColor("#f5f8fd"),
        title: Column(
          children: [
            Container(
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
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
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
                                cancelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                doneStyle: TextStyle(
                                    color: Colors.white, fontSize: 16)),
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
                                cancelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                doneStyle: TextStyle(
                                    color: Colors.white, fontSize: 16)),
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
                "Wallet Transaction",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            new Divider(
              height: 0.1,
            ),
            Container(
              color: Colors.grey.shade300,
              child: ListTile(
                  title: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      )),
                  isThreeLine: false,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "IN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            new RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: "OUT",
                                      style: new TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
                child: Container(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: statementList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    statementList[index]['category'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  statementList[index]['desc'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  "Order ID: #" +
                                      statementList[index]['orderId'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  statementList[index]['date'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          isThreeLine: true,
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      statementList[index]['in'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    new RichText(
                                      text: new TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text: statementList[index]['out'],
                                              style: new TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ))
                    ]);
                  }),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              new RichText(
                text: new TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: 'OPENING BALANCE: ',
                        style:
                            new TextStyle(color: Colors.white, fontSize: 12)),
                    new TextSpan(
                        text: "MYR 00.00",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              new RichText(
                text: new TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: 'CLOSING BALANCE: ',
                        style:
                            new TextStyle(color: Colors.white, fontSize: 12)),
                    new TextSpan(
                        text: "MYR 781.00",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
