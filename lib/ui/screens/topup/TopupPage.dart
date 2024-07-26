import 'dart:convert';

import 'package:calms_parent_latest/ui/screens/widgets/TopupListView.dart';
import 'package:calms_parent_latest/ui/screens/widgets/TopupMemberList.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/HexColor.dart';
import '../../../common/alert_dialog.dart';
import '../../../common/app_settings.dart';
import '../../../common/common_api.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/my_shared_pref.dart';
import '../../../common/widgets/common.dart';
import '/ui/screens/widgets/TopupView.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatefulWidget {
  final arguments;
  final AppTheme_;
  const TopupPage(this.arguments, this.AppTheme_, {Key? key}) : super(key: key);
  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  //var profileData = {};
  //String imgBaseUrl = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    CommonUtil().getFamilyMemberForTopup(
        context,
        widget.arguments['profileData']['RefUserSeqId'],
        widget.arguments['profileData']['RefBranchSeqId'],
        widget.arguments['profileData']['RefMemberTypeSeqId']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: HexColor(widget.AppTheme_['SecondaryBgColor']),
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
                          color: HexColor(widget.AppTheme_['SecondaryFrColor']),
                          width: 2),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: HexColor(widget.AppTheme_['SecondaryFrColor']),
                          size: 30,
                        )))),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Topup",
                style: TextStyle(
                    color: HexColor(widget.AppTheme_['SecondaryFrColor']),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
            // Your widgets here
          ],
        ),
        actions: [
          // Navigate to the Search Screen
          Container(
            height: 30,
            width: 60,
            margin: EdgeInsets.only(right: 10),
            child: Row(children: []),
          ),
        ],
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              HexColor(widget.AppTheme_['PrimaryBgColor']),
              HexColor(widget.AppTheme_['PrimaryBgColor']),
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
                        return TopupMemberListView(
                            widget.arguments['imgBaseUrl'],
                            data.topupMembersList,
                            widget.arguments['profileData']['CurrencyCode'],widget.AppTheme_);
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
        height: 110,
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
                                text: widget.arguments['profileData']
                                        ['CurrencyCode'] +
                                    " ",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        HexColor(AppSettings.colorCurrencyCode),
                                    fontSize: 18)),
                            new TextSpan(
                                text: data.topupTotal.toStringAsFixed(2),
                                style: TextStyle(
                                    color:
                                        HexColor(AppSettings.colorCurrencyCode),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            /* Flexible(
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
                              " Minimum reload amount is ${widget.arguments['profileData']['CurrencyCode']} 1.00.  Maximum reload amount is ${widget.arguments['profileData']['CurrencyCode']} 1000.00",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ])),
              ),
            ), */
            Consumer<MySettingsListener>(builder: (context, data, settingsDta) {
              return Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Choose Payment Option",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "Montserrat",
                                  color: HexColor(widget.AppTheme_['SecondaryFrColor']),
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.arrow_forward_ios,color: HexColor(widget.AppTheme_['SecondaryFrColor']),)
                          ],
                        ),
                        onPressed: data.topupTotal > 0
                            ? () {
                                showPaymentSelectOption(
                                    context,
                                    "Choose payment type",
                                    data.paymentProvidersList,
                                    data.topupTotal,
                                    widget.arguments['profileData'],
                                    AppSettings.paymentTypeTopup,widget.AppTheme_);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor(widget.AppTheme_['SecondaryBgColor']),
                          textStyle: TextStyle(color: HexColor(widget.AppTheme_['SecondaryFrColor'])),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0)),
                        ),
                      )));
            }),
          ],
        ),
      ),
    );
  }
}
