import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import '/common/alert_dialog.dart';
import '/common/app_settings.dart';
import '/common/my_shared_pref.dart';
import '/main.dart';
import 'package:flutter/material.dart';

import '../notifications/notifications.dart';

class PINEnter extends StatefulWidget {
  const PINEnter({Key? key}) : super(key: key);

  @override
  State<PINEnter> createState() => _PINEnterState();
}

class _PINEnterState extends State<PINEnter> {
  var pinItems = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "ok", "0", "D"];
  var enteredPIN = "";
  String appPIN = '';
  String appType = '';
  @override
  void initState() {
    initValues();
    super.initState();
  }

  initValues() async {
    appPIN = await MySharedPref().getData(AppSettings.Sp_AppPIN);
    appType = await MySharedPref().getData(AppSettings.Sp_Key_AppType);
    print(appPIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: Colors.white10,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: 40,
            ),
            Icon(Icons.lock_outline),
            SizedBox(
              height: 20,
            ),
            Text(
              "Please confirm your PIN.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                badges.Badge(
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5),
                  badgeContent: SizedBox(
                    height: 25,
                    width: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0),
                      ),
                      child: Container(
                          color: enteredPIN.length > 0
                              ? Colors.grey.shade800
                              : Colors.white),
                    ),
                  ),
                ),
                badges.Badge(
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5),
                  badgeContent: SizedBox(
                    height: 25,
                    width: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0),
                      ),
                      child: Container(
                          color: enteredPIN.length > 1
                              ? Colors.grey.shade800
                              : Colors.white),
                    ),
                  ),
                ),
                badges.Badge(
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5),
                  badgeContent: SizedBox(
                    height: 25,
                    width: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0),
                      ),
                      child: Container(
                          color: enteredPIN.length > 2
                              ? Colors.grey.shade800
                              : Colors.white),
                    ),
                  ),
                ),
                badges.Badge(
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5),
                  badgeContent: SizedBox(
                    height: 25,
                    width: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0),
                      ),
                      child: Container(
                          color: enteredPIN.length > 3
                              ? Colors.grey.shade800
                              : Colors.white),
                    ),
                  ),
                ),
                badges.Badge(
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5),
                  badgeContent: SizedBox(
                    height: 25,
                    width: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0),
                      ),
                      child: Container(
                          color: enteredPIN.length > 4
                              ? Colors.grey.shade800
                              : Colors.white),
                    ),
                  ),
                ),
                badges.Badge(
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5),
                  badgeContent: SizedBox(
                    height: 25,
                    width: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0),
                      ),
                      child: Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.all(1),
                          color: enteredPIN.length > 5
                              ? Colors.grey.shade800
                              : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: pinItems.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 3
                      : 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: (2 / 1),
                ),
                itemBuilder: (
                  context,
                  index,
                ) {
                  return GestureDetector(
                    onTap: () {
                      print(pinItems[index]);
                      if (pinItems[index] == "D") {
                        if (enteredPIN.length > 0)
                          enteredPIN =
                              enteredPIN.substring(0, enteredPIN.length - 1);
                      } else {
                        if (enteredPIN.length < 6)
                          enteredPIN = enteredPIN + pinItems[index];
                      }
                      print(enteredPIN);
                      setState(() {});
                      if (enteredPIN.length == 6) {
                        if (appPIN == enteredPIN) {
                          /* if (appType == AppSettings.appType_Notification) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Notifications()));
                          } else { */
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          //}
                        } else {
                          MyCustomAlertDialog()
                              .showToast(context, "Wrong PIN entered");
                        }
                      }
                      switch (pinItems[index]) {
                        case "0":
                          break;
                        case "1":
                          break;
                        case "2":
                          break;
                        case "3":
                          break;
                        case "4":
                          break;
                        case "5":
                          break;
                        case "6":
                          break;
                        case "7":
                          break;
                        case "8":
                          break;
                        case "9":
                          break;
                        case "ok":
                          break;
                        case "D":
                          break;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[300]),
                      // decoration: BoxDecoration(
                      //   border: Border(
                      //     right: BorderSide(
                      //         width: ((index) % 3 == 0) ? 1.5 : 0,
                      //         color: Colors.grey.shade300),
                      //     bottom:
                      //         BorderSide(width: 2.0, color: Colors.grey.shade300),
                      //   ),
                      //   // borderRadius: BorderRadius.only(
                      //   //     bottomLeft: Radius.circular(5.0),
                      //   //     bottomRight: Radius.circular(5.0)),
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (pinItems[index] != "D")
                            Text(pinItems[index],
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center),
                          if (pinItems[index] == "D") Icon(Icons.backspace)
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      )),
    );
  }
}
