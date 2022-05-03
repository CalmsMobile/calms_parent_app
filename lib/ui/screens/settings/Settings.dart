import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings();

  @override
  _SettingsState createState() => _SettingsState();
}

bool isSwitchedTopup = false;
bool isSwitchedMFPTopup = false;
bool isSwitchedCounterTopup = false;
bool isSwitchedMFPCounterTopup = false;

String limitType = '';

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    print(isSwitchedMFPTopup);
    final profileData = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -10.0,
        centerTitle: false,
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
                        "sivanekar@gmail.com",
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
        child: Column(children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Settings",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blue, width: 3)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    margin: EdgeInsets.all(0),
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "TOPUP CONTROL",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Self-Service Topup Terminal",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Do you allow to Topup Wallet?",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14),
                      ),
                      Switch(
                          value: isSwitchedTopup,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedTopup = value;
                            });
                          })
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Do you allow to Topup MFP Topup?",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14),
                      ),
                      Switch(
                          value: isSwitchedMFPTopup,
                          onChanged: (value) {
                            setState(() {
                              print(isSwitchedMFPTopup);
                              print(value);
                              isSwitchedMFPTopup = value;
                            });
                          })
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Counter Topup Terminal",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Do you allow to Topup Wallet?",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14),
                      ),
                      Switch(
                          value: isSwitchedCounterTopup,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedCounterTopup = value;
                            });
                          })
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Do you allow to Topup MFP Topup?",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14),
                      ),
                      Switch(
                          value: isSwitchedMFPCounterTopup,
                          onChanged: (value) {
                            setState(() {
                              print(isSwitchedMFPCounterTopup);
                              print(value);
                              isSwitchedMFPCounterTopup = value;
                            });
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blue, width: 3)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    margin: EdgeInsets.all(0),
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "PURCHASE LIMIT",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 35,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  "http://124.217.235.107:2008/FS/Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg"),
                              radius: 30,
                            ),
                          ),
                          Text(
                            "Cafe",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Limit Type",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey)),
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      limitType == ""
                                          ? "Limit Type"
                                          : limitType,
                                      style: new TextStyle(fontSize: 12)),
                                  Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              onTap: () => openLimitTypeBottomSheet(context),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blue, width: 3)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    margin: EdgeInsets.all(0),
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "TOPUP LOW BALANCE ALERT",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Notify me when Topup balance below",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14),
                      ),
                      Switch(
                          value: isSwitchedMFPCounterTopup,
                          onChanged: (value) {
                            setState(() {
                              print(isSwitchedMFPCounterTopup);
                              print(value);
                              isSwitchedMFPCounterTopup = value;
                            });
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void openLimitTypeBottomSheet(BuildContext buildContext) {
    List<String> limitTypeList = ["BLOCKED", "LIMITTED", "UNLIMITTED"];
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: limitTypeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        title: new Text(limitTypeList[index]),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            limitType = limitTypeList[index];
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
