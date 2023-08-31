import '../../../main.dart';
import '/common/alert_dialog.dart';
import '/common/my_shared_pref.dart';
import '../../../common/widgets/common.dart';
import '/ui/screens/scan_qr_registration/QRRegistration.dart';
import 'package:flutter/material.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({Key? key}) : super(key: key);

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          //titleSpacing: -5,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage("assets/images/ico_back.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "App Settings",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
              // Your widgets here
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                //Color.fromARGB(255, 246, 249, 254),
                Color.fromARGB(255, 246, 249, 254),
                Color.fromARGB(255, 230, 231, 239),
              ],
            )),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      margin: EdgeInsets.all(20),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "General Settings",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 0.0),
                                    minLeadingWidth: 10,
                                    dense: true,
                                    minVerticalPadding: 5,
                                    leading: Icon(
                                      Icons.info_outline,
                                      size: 24,
                                    ),
                                    title: Text(
                                      "App version ",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                Text(
                                  "1.0.1",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            height: 15,
                            color: Colors.grey,
                          ),
                          Container(
                            height: 40.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 0.0),
                                    minLeadingWidth: 10,
                                    minVerticalPadding: -4,
                                    dense: true,
                                    leading: Icon(
                                      Icons.phone_android_outlined,
                                      size: 24,
                                    ),
                                    title: Text(
                                      "Device Name",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            height: 15,
                            color: Colors.grey.shade300,
                          ),
                          Container(
                            height: 40.0,
                            child: InkWell(
                              onTap: () {
                                getAppSettings();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 0.0),
                                      minLeadingWidth: 10,
                                      minVerticalPadding: -4,
                                      dense: true,
                                      leading: Icon(
                                        Icons.browser_updated,
                                        size: 24,
                                      ),
                                      title: Text(
                                        "Sync now",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.sync)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            height: 15,
                            color: Colors.grey.shade300,
                          ),
                          Container(
                            height: 40.0,
                            child: InkWell(
                              onTap: () {
                                logoutDevice();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 0.0),
                                      minLeadingWidth: 10,
                                      minVerticalPadding: -4,
                                      dense: true,
                                      leading: Icon(
                                        Icons.logout_outlined,
                                        size: 24,
                                      ),
                                      title: Text(
                                        "Unregister device",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }

  getAppSettings() {}

  logoutDevice() {
    MyCustomAlertDialog().showCustomAlert(
        context, "Notification", "Do you want to logout?", false, () {
      print("logout proceed");
      MySharedPref().clearAllData();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreen()));
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QRRegistration()));
    }, () {
      print("Close alert");
      Navigator.of(context, rootNavigator: true).pop();
    });
  }
}
