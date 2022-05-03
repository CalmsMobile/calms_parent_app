import 'package:flutter/material.dart';

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
  List<Map> get getfamilyList => [
        {
          "name": "Desmond",
          "category": "PARENT",
          "desc": "",
          "balance": "250.00",
          "email": "makame147@gmail.com",
          "image": "https://randomuser.me/api/portraits/men/1.jpg"
        },
        {
          "name": "SITI KHALIDA",
          "category": "PARENT",
          "desc": "",
          "balance": "50.00",
          "email": "calms.rnd@gmail.com",
          "image": "https://randomuser.me/api/portraits/women/1.jpg"
        },
        {
          "name": "HAZIM",
          "category": "STUDENT",
          "email": "",
          "balance": "100.00",
          "contact": "0123467589",
          "desc": "Member account does not exist in MFP software",
          "image": "https://randomuser.me/api/portraits/men/2.jpg"
        },
        {
          "name": "MARIE LIM",
          "category": "STUDENT",
          "email": "",
          "balance": "0.00",
          "contact": "",
          "desc": "",
          "image": "https://randomuser.me/api/portraits/men/3.jpg"
        },
        {
          "name": "Danny",
          "category": "STUDENT",
          "email": "",
          "balance": "30.00",
          "contact": "",
          "desc": "",
          "image": "https://randomuser.me/api/portraits/men/4.jpg"
        },
      ];

  @override
  Widget build(BuildContext context) {
    print(selectedUser);
    return Scaffold(
      appBar: AppBar(
        title: Text("Donation"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PAID BY",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              (selectedUser != null && selectedUser != "")
                                  ? selectedUser
                                  : "Select Member",
                              style: new TextStyle(fontSize: 12)),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      onTap: () => openMemberBottomSheet(context),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              new Divider(
                height: 0.1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DONATION TYPE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              (donationType != null && donationType != "")
                                  ? donationType
                                  : "Select Donation Type",
                              style: new TextStyle(fontSize: 12)),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      onTap: () => openDonationTypeBottomSheet(context),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              new Divider(
                height: 0.1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AMOUNT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: TextField(
                                style: TextStyle(fontSize: 14),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    hintText: 'Amount',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.only(
                                        left: 0, right: 0, top: 0, bottom: 0))),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              new Divider(
                height: 0.1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MODE OF PAYMENT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              (modeOfPayment != null && modeOfPayment != "")
                                  ? modeOfPayment
                                  : "Select mode of payment",
                              style: new TextStyle(fontSize: 12)),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      onTap: () => openModeOfPaymentBottomSheet(context),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              new Divider(
                height: 0.1,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: OutlinedButton(
                          onPressed: () => {},
                          style: OutlinedButton.styleFrom(
                            primary: Colors.teal,
                            side: BorderSide(color: Colors.teal, width: 2),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          child: Text('PROCEED'),
                        ),
                      ),
                    )),
              ),
            ],
          )),
    );
  }

  void openMemberBottomSheet(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
                        title: new Text(getfamilyList[index]["name"]),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            selectedUser = getfamilyList[index]["name"];
                          });
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
