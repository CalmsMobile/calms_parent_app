import 'dart:convert';

import 'package:calms_parent_latest/common/common_api.dart';

import '../../../common/HexColor.dart';
import '../../../common/app_settings.dart';
import '../../../main.dart';
import '/common/alert_dialog.dart';
import '/common/my_shared_pref.dart';
import '../../../common/widgets/common.dart';
import '/ui/screens/scan_qr_registration/QRRegistration.dart';
import 'package:flutter/material.dart';

class AppSettingsPage extends StatefulWidget {
  final AppTheme_;
  const AppSettingsPage(this.AppTheme_, {Key? key}) : super(key: key);

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: HexColor(widget.AppTheme_['AppHeaderBgColor']),
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
                  child: Container(
                      //margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                HexColor(widget.AppTheme_['IconOutlineColor']),
                            width: 0.5),
                        color: HexColor(widget.AppTheme_['IconBgColor']),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color:
                                HexColor(widget.AppTheme_['IconOutlineColor']),
                            size: 25,
                          )))),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: HexColor(widget.AppTheme_['AppHeaderFontColor']),
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
                HexColor(widget.AppTheme_['AppBgColor']),
                HexColor(widget.AppTheme_['AppBgColor']),
              ],
            )),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                        color:  HexColor(widget.AppTheme_['PanelBgColor']),
                        shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                        elevation: 10,
                        shadowColor: Colors.black,
                        borderOnForeground: true,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20,top: 20),
                        child: Column(
                          children: [
                            Container(
                                  decoration: BoxDecoration(
                                    color: HexColor(
                                         widget.AppTheme_['PanelHeaderBgColor']),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    ),
                                  ),
                                  child: ListTile(
                                    visualDensity: VisualDensity(
                                        vertical:
                                            -2), // Further reduces vertical padding
                                    title: Text("General Settings"),
                                    textColor: HexColor(
                                        widget.AppTheme_['PanelHeaderFontColor']),
                                  ),
                                ),
                           
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.0,
                                                    horizontal: 0.0),
                                            minLeadingWidth: 10,
                                            dense: true,
                                            minVerticalPadding: 5,
                                            leading: Icon(
                                              Icons.info_outline,
                                              size: 24,
                                              color: HexColor(widget.AppTheme_['IconOutlineColor']),
                                            ),
                                            title: Text(
                                              "App version ",
                                              style: TextStyle(fontSize: 14,color: HexColor(widget.AppTheme_['SubTitleFontColor'])),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "3.1.4",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,color: HexColor(widget.AppTheme_['ContentFontColor'])),
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
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 0.0),
                                              minLeadingWidth: 10,
                                              minVerticalPadding: -4,
                                              dense: true,
                                              leading: Icon(
                                                Icons.browser_updated,
                                                size: 24,
                                                color: HexColor(widget.AppTheme_['IconOutlineColor'])
                                              ),
                                              title: Text(
                                                "Sync now",
                                                style: TextStyle(fontSize: 14,color: HexColor(widget.AppTheme_['SubTitleFontColor'])),
                                                
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.sync,color: HexColor(widget.AppTheme_['IconOutlineColor']),)
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
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 0.0),
                                              minLeadingWidth: 10,
                                              minVerticalPadding: -4,
                                              dense: true,
                                              leading: Icon(
                                                Icons.logout_outlined,
                                                size: 24,
                                                color: HexColor('#ca282c'),
                                              ),
                                              title: Text(
                                                "Unregister device",
                                                style: TextStyle(fontSize: 14,color: HexColor('#ca282c')),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ]),
            ),
          ),
        ));
  }

  getAppSettings() {
    //CommonUtil().getAppTheme(context);
    CommonUtil()
        .getEntryToDashboard(context, profileData['RefUserSeqId'], true);
  }

  var profileData = {};

  Future<void> getData(BuildContext context) async {
    // imgBaseUrl = await MySharedPref().getData(AppSettings.Sp_Img_Base_Url);
    String profile = await MySharedPref().getData(AppSettings.Sp_ProfileData);
    profileData = jsonDecode(profile);
    print("profileData");
    print(profileData);
  }

  logoutDevice() {
    MyCustomAlertDialog().showCustomAlert(
        context, "Notification", "Do you want to logout?", false, () async {
      print("logout proceed");
      String FCMToken = await MySharedPref().getData(AppSettings.fcmId);
      MySharedPref().clearAllData();
      MySharedPref().saveData(FCMToken, AppSettings.fcmId);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreen()));
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QRRegistration()));
    }, () {
     
    }, "Logout", "Cancel");
  }
}
