import 'dart:convert';

import 'package:calms_parent_latest/ui/screens/widgets/TopupListView.dart';
import 'package:calms_parent_latest/ui/screens/widgets/TopupMemberList.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/alert_dialog.dart';
import '../../../common/app_settings.dart';
import '../../../common/common_api.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/my_shared_pref.dart';
import '../../../common/widgets/common.dart';
import '/ui/screens/widgets/TopupView.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatefulWidget {
  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  var profileData = {};
  String imgBaseUrl = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    String profile = await MySharedPref().getData(AppSettings.Sp_ProfileData);
    imgBaseUrl = await MySharedPref().getData(AppSettings.Sp_Img_Base_Url);
    if (profile != "") {
      profileData = jsonDecode(profile);
      CommonUtil().getFamilyMemberForTopup(context, profileData['RefUserSeqId'],
          profileData['RefBranchSeqId'], profileData['RefMemberTypeSeqId']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMyAppbar(context, "Topup", []),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 246, 249, 254),
              Color.fromARGB(255, 230, 231, 239),
            ],
          )),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Consumer<MySettingsListener>(
                        builder: (context, data, settingsDta) {
                      if (data.topupMembersList.isNotEmpty) {
                        return TopupMemberListView(imgBaseUrl,
                            data.topupMembersList, profileData['CurrencyCode']);
                      } else {
                        return SizedBox();
                      }
                    }),
                  ],
                ),
              ),
            ),
          )),
      bottomNavigationBar: SizedBox(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Consumer<MySettingsListener>(
                    builder: (context, data, settingsDta) {
                      return RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'MYR ',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18)),
                            new TextSpan(
                                text: data.topupTotal.toStringAsFixed(2),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Image.asset(
                        "assets/images/alert.png",
                        width: 15,
                        height: 15,
                      )),
                      TextSpan(
                          text:
                              " Minimum reload amount is MYR 1.00.  Maximum reload amount is MYR 1000.00",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ])),
              ),
            ),
            Consumer<MySettingsListener>(
                        builder: (context, data, settingsDta) {
           return InkWell(
              onTap: () {
                showPaymentSelectOption(context,"Choose payment type",data.paymentProvidersList,{});
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    bottom: BorderSide(color: Colors.blue, width: 1),
                    right: BorderSide(color: Colors.blue, width: 1),
                    top: BorderSide(color: Colors.blue, width: 1),
                    left: BorderSide(color: Colors.blue, width: 1),
                  ),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.blue,
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                margin:
                    EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Choose Payment Option",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            );}),
          ],
        ),
      ),
    );
  }
}
