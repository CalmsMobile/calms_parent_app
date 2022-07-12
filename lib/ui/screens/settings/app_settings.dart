import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/my_shared_pref.dart';
import 'package:calms_parent/ui/screens/scan_qr_registration/QRRegistration.dart';
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
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Align(
              alignment: Alignment(-1.2, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "General Settings",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            "1.0.0",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
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
                                fontSize: 14, fontWeight: FontWeight.bold),
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
          ),
        ));
  }

  getAppSettings() {}

  logoutDevice() {
    MyCustomAlertDialog().showCustomAlert(
        context, "Notification", "Do you want to logout?", false, () {
      Navigator.of(context, rootNavigator: true).pop();
      MySharedPref().clearAllData();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => QRRegistration()));
    }, () {
      print("Close alert");
      Navigator.of(context, rootNavigator: true).pop();
    });
  }
}
