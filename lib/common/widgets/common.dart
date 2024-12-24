import 'package:calms_parent_latest/common/common_api.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/screens/home/Home.dart';
import '../listener/settings_listener.dart';
import '../util/common_funtions.dart';
import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/app_settings.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

PreferredSizeWidget getMyAppbar(
    backButtonToHome, context, var titleText, List<Widget> actions1) {
  return AppBar(
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
              if (backButtonToHome)
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              else
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
              titleText,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
          // Your widgets here
        ],
      ),
      /* title: Text(
        titleText,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ), */
      /* iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ), */
      // titleSpacing: -5,
      actions: actions1);
}

PreferredSizeWidget getBottomSheetActionBar(
    BuildContext context, var titleText, bool showClose, Color bgcolor) {
  return AppBar(
    title: titleText == 'Confirmation' ||
            titleText.toString().contains("verification")
        ? RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              WidgetSpan(
                  child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Image.asset(
                  "assets/images/alert.png",
                  width: 25,
                  height: 25,
                ),
              )),
              WidgetSpan(
                  child: Container(
                padding: EdgeInsets.only(bottom: 3, left: 5),
                child: Text(
                  titleText,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )),
            ]),
          )
        : Text(
            titleText,
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: titleText == 'Summary' ||
                        titleText == 'Attendance' ||
                        titleText == 'Select Model' ||
                        titleText == 'Package' ||
                        titleText.toString().contains("verification")
                    ? FontWeight.bold
                    : FontWeight.normal),
          ),
    elevation: 0,
    backgroundColor: bgcolor,
    automaticallyImplyLeading: false,
    actions: [
      if (showClose)
        IconButton(
          icon: Icon(Icons.close_sharp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    ],
  );
}

PreferredSizeWidget customBottomSheetActionBar(
    BuildContext context,
    var titleText,
    bool showClose,
    Color bgColor,
    bool showLeadingIcon,
    bool showBold,
    double textSize) {
  return AppBar(
    toolbarHeight: 50,
    title: Text(
      titleText,
      style: TextStyle(
          color: Colors.black,
          fontSize: textSize,
          fontWeight: showBold ? FontWeight.bold : FontWeight.normal),
    ),
    elevation: 0,
    backgroundColor: bgColor,
    automaticallyImplyLeading: false,
    actions: [
      if (showClose)
        IconButton(
          icon: Icon(Icons.close_sharp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    ],
  );
}

void openMemberBottomSheet(
    BuildContext buildContext, familyList, imageBaseUrl, callback) {
  print(familyList.toString());
  showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                title: Text(
                  "Select Member",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                elevation: 1,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.close_sharp, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: familyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        leading: familyList[index]['UserImgPath'] != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(imageBaseUrl +
                                    familyList[index]["UserImgPath"]),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.blue[700],
                                child: Text(
                                  CommonFunctions.getInitials(
                                          familyList[index]['Name'])
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                        /* CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              familyList[index]['UserImgPath'] != null
                                  ? imageBaseUrl +
                                      familyList[index]['UserImgPath']
                                  : "assets/images/user.png"),
                          radius: 20,
                        ), */
                        title: new Text(familyList[index]["Name"]),
                        subtitle: new Text(
                          familyList[index]["MemberId"].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                        onTap: () {
                          callback(index);
                        },
                      ),
                    ]);
                  })
            ],
          ),
        );
      });
}

void openNotificationMemberBottomSheet(
    BuildContext buildContext, familyList, imageBaseUrl, callback, enableAll) {
  print(familyList.toString());
  showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                title: Text(
                  "Select Member",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                elevation: 1,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.close_sharp, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              if (enableAll)
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: HexColor("#ffb703"),
                    child: Text(
                      "AN",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  title: Text("All Notifications"),
                  onTap: () {
                    callback(9999);
                  },
                ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: familyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        leading: familyList[index]['UserImgPath'] != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(imageBaseUrl +
                                    familyList[index]["UserImgPath"]),
                              )
                            : CircleAvatar(
                                backgroundColor: HexColor("#ffb703"),
                                child: Text(
                                  CommonFunctions.getInitials(
                                          familyList[index]['Name'])
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                        /* CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              familyList[index]['UserImgPath'] != null
                                  ? imageBaseUrl +
                                      familyList[index]['UserImgPath']
                                  : "assets/images/user.png"),
                          radius: 20,
                        ), */
                        title: new Text(familyList[index]["Name"]),
                        subtitle: new Text(
                          familyList[index]["MemberId"].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                        onTap: () {
                          callback(index);
                        },
                      ),
                    ]);
                  })
            ],
          ),
        );
      });
}

void showPaymentSelectOptionForTopup(BuildContext buildContext, titleText,
    List paymentList, topupAmount, profileData, paymentFor, AppTheme_) {
  var selectedPaymentMethod = {};
  var checkedValue = false;
  final List<String> modalList = [
    'B2C - Retail Banking',
    'Other',
  ];
  final List<String> bankList = [
    'CIMB Clicks',
    'MAY Bank',
    'SBI A',
    'SBI B',
    'ICICI Bank'
  ];
  String? selectedModalValue;
  String? selectedBankValue;
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60.0))),
      context: buildContext,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheet(
            enableDrag: true,
            onClosing: () {},
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, setState) =>
                      SingleChildScrollView(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: <
                                Widget>[
                          AppBar(
                            title: Text(
                              titleText,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            elevation: 1,
                            backgroundColor: Colors.white,
                            automaticallyImplyLeading: false,
                            actions: [
                              IconButton(
                                icon: Icon(Icons.close_sharp,
                                    color: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: paymentList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(children: <Widget>[
                                  Container(
                                    color: Colors.white,
                                    height: 45,
                                    child: ListTile(
                                      horizontalTitleGap: -8,
                                      title: paymentList[index]["IsWallet"] == 1
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                  Text(
                                                    paymentList[index]["Name"],
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  ),
                                                  Text(
                                                    "Wallet Balance = ${profileData['CurrencyCode']} " +
                                                        paymentList[index]
                                                                ["Balance"]
                                                            .toStringAsFixed(2),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: HexColor(AppSettings
                                                            .colorCurrencyCode),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ])
                                          : Text(
                                              paymentList[index]["Name"],
                                              style: TextStyle(fontSize: 22),
                                            ),
                                      leading: Icon(
                                        Icons.check_circle_rounded,
                                        size: 25,
                                        color: selectedPaymentMethod[
                                                    'PayMode'] ==
                                                paymentList[index]['PayMode']
                                            ? HexColor(
                                                AppTheme_['IconOutlineColor'])
                                            : Color.fromARGB(
                                                102, 158, 158, 158),
                                      ),
                                      trailing: Container(
                                        height: 45,
                                        width: 45,
                                        child: paymentList[index]
                                                    ["ImgPathUrl"] !=
                                                ""
                                            ? Image.network(paymentList[index]
                                                ["ImgPathUrl"])
                                            : null,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod =
                                              paymentList[index];
                                          if (selectedPaymentMethod[
                                                  'IsWallet'] ==
                                              1) {
                                            selectedPaymentMethod['Balance'] <
                                                    topupAmount
                                                ? checkedValue = false
                                                : checkedValue = true;
                                          } else {
                                            checkedValue = true;
                                          }
                                          print(selectedPaymentMethod);
                                        });
                                      },
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                  ),
                                ]);
                              }),
                          if (selectedPaymentMethod['PayMode'] == "FPX")
                            Container(
                              margin: EdgeInsets.only(left: 0),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 30,
                                    child: getBottomSheetActionBar(context,
                                        "Select Model", false, Colors.white),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: Colors.grey.shade400,
                                    margin: EdgeInsets.only(
                                        top: 0, left: 20, right: 20),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'Select Model',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: modalList
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedModalValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedModalValue =
                                                value as String;
                                          });
                                        },
                                        buttonHeight: 40,
                                        buttonWidth: 140,
                                        itemHeight: 40,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 30,
                                    child: getBottomSheetActionBar(context,
                                        "Select Bank", false, Colors.white),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: Colors.grey.shade400,
                                    margin: EdgeInsets.only(
                                        top: 0, left: 20, right: 20),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'Select Bank',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        items: bankList
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedBankValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedBankValue = value as String;
                                          });
                                        },
                                        buttonHeight: 40,
                                        buttonWidth: 140,
                                        itemHeight: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (selectedPaymentMethod['IsWallet'] == 1 &&
                              selectedPaymentMethod['Balance'] < topupAmount)
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Your balance is less than purchase amount",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold)),
                                    ])),
                          Container(
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.all(10),
                              child: SizedBox(
                                  height: 45,
                                  child: ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Next",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: "Montserrat",
                                              color: HexColor(
                                                  AppTheme_['ButtonFontColor']),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            color: HexColor(
                                                AppTheme_['ButtonFontColor']))
                                      ],
                                    ),
                                    onPressed: checkedValue == true &&
                                            selectedPaymentMethod != {}
                                        ? () {
                                            Navigator.of(buildContext).pop();
                                            CommonUtil().getGatewayDetails(
                                                buildContext,
                                                selectedPaymentMethod[
                                                    'RefBranchSeqId'],
                                                selectedPaymentMethod[
                                                    'SettingsSeqId'],
                                                topupAmount,
                                                profileData,
                                                selectedPaymentMethod[
                                                    'IsWallet'],
                                                selectedPaymentMethod[
                                                            'Balance'] !=
                                                        null
                                                    ? selectedPaymentMethod[
                                                        'Balance']
                                                    : 0,
                                                paymentFor,
                                                AppTheme_);
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          HexColor(AppTheme_['ButtonBgColor']),
                                      textStyle: TextStyle(
                                          color: HexColor(
                                              AppTheme_['ButtonFontColor'])),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60.0)),
                                    ),
                                  )))
                          /* InkWell(
                              onTap: () {
                                if (checkedValue &&
                                    selectedPaymentMethod != {}) {
                                  Navigator.of(buildContext).pop();
                                  CommonUtil().getGatewayDetails(
                                      context,
                                      selectedPaymentMethod['RefBranchSeqId'],
                                      selectedPaymentMethod['SettingsSeqId'],topupAmount,CurrencyCode);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: checkedValue &&
                                          selectedPaymentMethod != {}
                                      ? Colors.pinkAccent
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border(
                                    bottom: BorderSide(
                                        color: checkedValue &&
                                                selectedPaymentMethod != {}
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                        width: 1),
                                    right: BorderSide(
                                        color: checkedValue &&
                                                selectedPaymentMethod != {}
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                        width: 1),
                                    top: BorderSide(
                                        color: checkedValue &&
                                                selectedPaymentMethod != {}
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                        width: 1),
                                    left: BorderSide(
                                        color: checkedValue &&
                                                selectedPaymentMethod != {}
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                        width: 1),
                                  ),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: checkedValue &&
                                              selectedPaymentMethod != {}
                                          ? Colors.pinkAccent
                                          : Colors.grey,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                margin: EdgeInsets.only(
                                    top: 20, left: 10, right: 10, bottom: 20),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      color: checkedValue &&
                                              selectedPaymentMethod != {}
                                          ? Colors.pinkAccent
                                          : Colors.grey,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 30),
                                      child: Text(
                                        "Submit",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                            )*/
                          ,
                        ]),
                      ));
            });
      });
}

void showPaymentSelectOptionForOrder(
    BuildContext buildContext,
    titleText,
    List paymentList,
    paymentSetting,
    orderAmount,
    profileData,
    paymentFor,
    AppTheme_) {
  var selectedPaymentMethod = {};
  var checkedValue = false;
  var disableGatewayPayments = false;
  var disableWallet = false;
  var walletPayment = {};
  var actualOrderAmount = orderAmount;
  var deductAmountFromWallet = 0;
  var selectWallet = false;
  List pl = List.from(paymentList);
  if (paymentSetting['MixedModePayment']) {
    walletPayment =
        paymentList.where((element) => element['IsWallet'] == 1).toList()[0];
    pl.removeWhere((element) => element['IsWallet'] == 1);
   // orderAmount = 65;
    /*  if (paymentSetting['MustDetectFromWallet']) {
      disableWallet = true;
      if (walletPayment['Balance'] >= orderAmount) {
        selectedPaymentMethod = walletPayment;
        disableGatewayPayments = true;
        checkedValue = true;
      } else {
        orderAmount = orderAmount - walletPayment['Balance'];
        deductAmountFromWallet = walletPayment['Balance'];
        disableGatewayPayments = false;
        checkedValue = false;
      }
    } */

    print("walletPayment");
    print(walletPayment);
    print(pl);
  }

  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60.0))),
      context: buildContext,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheet(
            enableDrag: true,
            onClosing: () {},
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, setState) =>
                      SingleChildScrollView(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: <
                                Widget>[
                          AppBar(
                            title: Text(
                              titleText,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            elevation: 1,
                            backgroundColor: Colors.white,
                            automaticallyImplyLeading: false,
                            actions: [
                              IconButton(
                                icon: Icon(Icons.close_sharp,
                                    color: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          if (paymentSetting['MixedModePayment'] &&
                              walletPayment != {})
                            Container(
                              color: Colors.white,
                              height: 45,
                              child: ListTile(
                                enabled: disableWallet ? false : true,
                                horizontalTitleGap: -8,
                                title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        walletPayment["Name"],
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      Text(
                                        "Wallet Balance = ${profileData['CurrencyCode']} " +
                                            walletPayment["Balance"]
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: HexColor(
                                                AppSettings.colorCurrencyCode),
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                leading: Icon(
                                  Icons.check_box_rounded,
                                  size: 25,
                                  color: selectWallet
                                      ? HexColor(AppTheme_['IconOutlineColor'])
                                      : Color.fromARGB(102, 158, 158, 158),
                                ),
                                trailing: Container(
                                  height: 45,
                                  width: 45,
                                  child: walletPayment["ImgPathUrl"] != ""
                                      ? Image.network(
                                          walletPayment["ImgPathUrl"])
                                      : null,
                                ),
                                onTap: () {
                                  setState(() {
                                    if (selectWallet) {
                                      selectWallet = false;
                                      orderAmount = actualOrderAmount;
                                      if (selectedPaymentMethod['IsWallet'] ==
                                          1) {
                                        selectedPaymentMethod = {};
                                        checkedValue = false;
                                      }
                                      disableGatewayPayments = false;
                                    } else {
                                      selectWallet = true;
                                      if (walletPayment['Balance'] >=
                                          orderAmount) {
                                        selectedPaymentMethod = walletPayment;
                                        disableGatewayPayments = true;
                                        checkedValue = true;
                                      } else {
                                        orderAmount = orderAmount -
                                            walletPayment['Balance'];
                                        deductAmountFromWallet =
                                            walletPayment['Balance'];
                                        disableGatewayPayments = false;

                                        checkedValue = false;
                                        print("selectedPaymentMethod");
                                        print(selectedPaymentMethod);
                                        if (selectedPaymentMethod['IsWallet'] ==
                                            0) {
                                         
                                          checkedValue = true;
                                        }
                                      }
                                    }

                                    /* selectedPaymentMethod = walletPayment;
                                    if (selectedPaymentMethod['IsWallet'] ==
                                        1) {
                                      selectedPaymentMethod['Balance'] <
                                              topupAmount
                                          ? checkedValue = false
                                          : checkedValue = true;
                                    } else {
                                      checkedValue = true;
                                    }
                                    print(selectedPaymentMethod); */
                                  });
                                },
                              ),
                            ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: pl.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(children: <Widget>[
                                  Container(
                                    color: Colors.white,
                                    height: 45,
                                    child: ListTile(
                                      enabled:
                                          disableGatewayPayments ? false : true,
                                      horizontalTitleGap: -8,
                                      title: pl[index]["IsWallet"] == 1
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                  Text(
                                                    pl[index]["Name"],
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  ),
                                                  Text(
                                                    "Wallet Balance = ${profileData['CurrencyCode']} " +
                                                        pl[index]["Balance"]
                                                            .toStringAsFixed(2),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: HexColor(AppSettings
                                                            .colorCurrencyCode),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ])
                                          : Text(
                                              pl[index]["Name"],
                                              style: TextStyle(fontSize: 22),
                                            ),
                                      leading: Icon(
                                        Icons.check_circle_rounded,
                                        size: 25,
                                        color: selectedPaymentMethod[
                                                    'PayMode'] ==
                                                pl[index]['PayMode']
                                            ? HexColor(
                                                AppTheme_['IconOutlineColor'])
                                            : Color.fromARGB(
                                                102, 158, 158, 158),
                                      ),
                                      trailing: Container(
                                        height: 45,
                                        width: 45,
                                        child: pl[index]["ImgPathUrl"] != ""
                                            ? Image.network(
                                                pl[index]["ImgPathUrl"])
                                            : null,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedPaymentMethod = pl[index];
                                          if (selectedPaymentMethod[
                                                  'IsWallet'] ==
                                              1) {
                                            selectedPaymentMethod['Balance'] <
                                                    orderAmount
                                                ? checkedValue = false
                                                : checkedValue = true;
                                          } else {
                                            checkedValue = true;
                                          }
                                          print(selectedPaymentMethod);
                                        });
                                      },
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                  ),
                                ]);
                              }),
                          if (selectedPaymentMethod['IsWallet'] == 1 &&
                              selectedPaymentMethod['Balance'] < orderAmount)
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Your balance is less than purchase amount",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold)),
                                    ])),
                          Container(
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.all(10),
                              child: SizedBox(
                                  height: 45,
                                  child: ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Next",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: "Montserrat",
                                              color: HexColor(
                                                  AppTheme_['ButtonFontColor']),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            color: HexColor(
                                                AppTheme_['ButtonFontColor']))
                                      ],
                                    ),
                                    onPressed: checkedValue == true &&
                                            selectedPaymentMethod != {}
                                        ? () {
                                            Navigator.of(buildContext).pop();
                                            CommonUtil().getGatewayDetails(
                                                buildContext,
                                                selectedPaymentMethod[
                                                    'RefBranchSeqId'],
                                                selectedPaymentMethod[
                                                    'SettingsSeqId'],
                                                orderAmount,
                                                profileData,
                                                selectedPaymentMethod[
                                                    'IsWallet'],
                                                selectedPaymentMethod[
                                                            'Balance'] !=
                                                        null
                                                    ? selectedPaymentMethod[
                                                        'Balance']
                                                    : 0,
                                                paymentFor,
                                                AppTheme_);
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          HexColor(AppTheme_['ButtonBgColor']),
                                      textStyle: TextStyle(
                                          color: HexColor(
                                              AppTheme_['ButtonFontColor'])),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60.0)),
                                    ),
                                  )))
                        ]),
                      ));
            });
      });
}

double calAdminGst(AdminTransFee, AdminGstType, AdminGstPercentage) {
  double lsval = 0;
  if (AdminGstType == 10) {
    lsval = (AdminTransFee * AdminGstPercentage) / (100 + AdminGstPercentage);
  } else if (AdminGstType == 20) {
    lsval = (AdminTransFee * AdminGstPercentage) / (100);
  } else if (AdminGstType == 00) {
    lsval = AdminTransFee * (AdminGstPercentage / 100);
  }
  return lsval;
}

double calTopupGst(topupAmount, GstType, GstPercentage) {
  double lsval = 0;
  if (GstType == 10) {
    lsval = (topupAmount * GstPercentage) / (100 + GstPercentage);
  } else if (GstType == 20) {
    lsval = (topupAmount * GstPercentage) / (100);
  } else if (GstType == 00) {
    lsval = topupAmount * (GstPercentage / 100);
  }
  return lsval;
}

double calWithAdminFee(topupAmount, gatewayDetail) {
  double total = 0;
  if (gatewayDetail['IsAdminFee']) {
    if (gatewayDetail['IsAdminFeeGst']) {
      if (gatewayDetail['AdminGstType'] == 20) {
        total = topupAmount +
            gatewayDetail['AdminTransFee'] +
            calAdminGst(
                gatewayDetail['AdminTransFee'],
                gatewayDetail['AdminGstType'],
                gatewayDetail['AdminGstPercentage']);
      } else
        total = topupAmount + gatewayDetail['AdminTransFee'];
    } else
      total = topupAmount + gatewayDetail['AdminTransFee'];
  } else {
    total = topupAmount;
  }

  return total;
}

double grandTotal(amountwithAdminFee, gatewayDetail, topupAmount) {
  double total = 0;
  if (gatewayDetail['IsGst']) {
    if (gatewayDetail['GstType'] == 20) {
      total = amountwithAdminFee +
          double.parse(calTopupGst(topupAmount, gatewayDetail['GstType'],
                  gatewayDetail['GstPercentage'])
              .toStringAsFixed(2));
    } else
      total = amountwithAdminFee;
  } else
    total = amountwithAdminFee;
  return total;
}

void showCustomPaymentAlert(BuildContext buildContext, gatewayDetail,
    topupAmount, profileData, IsWallet, Balance, paymentFor, AppTheme_) {
  var checkedValue = false;
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60.0))),
      context: buildContext,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheet(
            enableDrag: true,
            onClosing: () {},
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context, setState) =>
                    SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getBottomSheetActionBar(
                            context, "Confirmation", true, Colors.white),
                        Container(
                          margin: EdgeInsets.all(10),
                          //padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Payment Method",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${paymentFor == AppSettings.paymentTypeTopup ? "Top-up" : "Order"} Amount",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  gatewayDetail['IsGst']
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            gatewayDetail['GstType'] == 20
                                                ? "${paymentFor == AppSettings.paymentTypeTopup ? "Top-up" : "Order"} Amount GST (Excl.)"
                                                : "${paymentFor == AppSettings.paymentTypeTopup ? "Top-up" : "Order"} Amount GST (Incl.)",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        )
                                      : SizedBox(),
                                  gatewayDetail['IsAdminFee']
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Admin Fee",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        )
                                      : SizedBox(),
                                  gatewayDetail['IsAdminFee'] &&
                                          gatewayDetail['IsAdminFeeGst']
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            gatewayDetail['AdminGstType'] == 20
                                                ? "Admin Fee GST (Excl.)"
                                                : "Admin Fee GST (Incl.)",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        )
                                      : SizedBox(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      gatewayDetail['EnvName'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${profileData['CurrencyCode']} ${topupAmount.toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  gatewayDetail['IsGst']
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${profileData['CurrencyCode']} ${calTopupGst(topupAmount, gatewayDetail['GstType'], gatewayDetail['GstPercentage']).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : SizedBox(),
                                  gatewayDetail['IsAdminFee']
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${profileData['CurrencyCode']} " +
                                                gatewayDetail['AdminTransFee']
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : SizedBox(),
                                  gatewayDetail['IsAdminFee'] &&
                                          gatewayDetail['IsAdminFeeGst']
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${profileData['CurrencyCode']} ${calAdminGst(gatewayDetail['AdminTransFee'], gatewayDetail['AdminGstType'], gatewayDetail['AdminGstPercentage']).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : SizedBox(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${profileData['CurrencyCode']} ${grandTotal(calWithAdminFee(topupAmount, gatewayDetail), gatewayDetail, topupAmount).toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (gatewayDetail['EnableTnC'])
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Terms & Conditions",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    CheckboxListTile(
                                      checkColor: HexColor(
                                          AppTheme_['IconOutlineColor']),
                                      activeColor:
                                          HexColor(AppTheme_['IconBgColor']),
                                      contentPadding: EdgeInsets.zero,
                                      title: HtmlWidget(
                                        gatewayDetail['TnC_Desc'],
                                        onTapUrl: (url) =>
                                            launchUrl(Uri.parse(url)),
                                        enableCaching: false,
                                        textStyle: TextStyle(fontSize: 16),
                                      ),
                                      /* title: Text(gatewayDetail['TnC_Desc'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal)), */

                                      /*  RichText(
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: gatewayDetail['TnC_Desc'],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  /* children: [
                                    TextSpan(
                                      text: 'Terms and Conditions',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: ' agreement',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ] */
                                ),
                              ),
                               */
                                      value: checkedValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          checkedValue = newValue!;
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                    ),
                                  ])),
                        if (topupAmount < gatewayDetail['TopMinAmt'] &&
                            paymentFor == AppSettings.paymentTypeTopup)
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "The eWallet has a top-up limitation with a minimum amount of " +
                                            profileData['CurrencyCode'] +
                                            ' ' +
                                            gatewayDetail['TopMinAmt']
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                  ])),
                        if (topupAmount > gatewayDetail['TopMaxAmt'] &&
                            paymentFor == AppSettings.paymentTypeTopup)
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "The eWallet has a top-up limitation with a maximum amount of " +
                                            profileData['CurrencyCode'] +
                                            ' ' +
                                            gatewayDetail['TopMaxAmt']
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                  ])),
                        if (!(topupAmount < gatewayDetail['TopMinAmt']) &&
                            !(topupAmount > gatewayDetail['TopMaxAmt']) &&
                            paymentFor == AppSettings.paymentTypeTopup)
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            //padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.all(10),
                                    child: SizedBox(
                                        height: 45,
                                        child: ElevatedButton(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Proceed & Pay",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontFamily: "Montserrat",
                                                    color: HexColor(AppTheme_[
                                                        'ButtonFontColor']),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              //Icon(Icons.payment)
                                            ],
                                          ),
                                          onPressed: (gatewayDetail['EnableTnC']
                                                  ? checkedValue == true
                                                  : checkedValue == false)
                                              ? () {
                                                  if (paymentFor ==
                                                      AppSettings
                                                          .paymentTypeTopup)
                                                    buildContext
                                                        .read<
                                                            MySettingsListener>()
                                                        .updateTopupHeaderAndDetails(
                                                            buildContext,
                                                            gatewayDetail,
                                                            profileData,
                                                            paymentFor,
                                                            AppTheme_);
                                                  if (paymentFor ==
                                                      AppSettings
                                                          .paymentTypeOrder)
                                                    buildContext
                                                        .read<
                                                            MySettingsListener>()
                                                        .updateOrderHeaderAndDetails(
                                                            buildContext,
                                                            gatewayDetail,
                                                            profileData,
                                                            IsWallet,
                                                            Balance,
                                                            paymentFor,
                                                            AppTheme_);
                                                }
                                              : null,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: HexColor(
                                                AppTheme_['ButtonBgColor']),
                                            textStyle: TextStyle(
                                                color: HexColor(AppTheme_[
                                                    'ButtonFontColor'])),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        60.0)),
                                          ),
                                        )))),
                          ),
                        if (paymentFor == AppSettings.paymentTypeOrder)
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            //padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.all(10),
                                    child: SizedBox(
                                        height: 45,
                                        child: ElevatedButton(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Proceed & Pay",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontFamily: "Montserrat",
                                                    color: HexColor(AppTheme_[
                                                        'ButtonFontColor']),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              //Icon(Icons.payment)
                                            ],
                                          ),
                                          onPressed: (gatewayDetail['EnableTnC']
                                                  ? checkedValue == true
                                                  : checkedValue == false)
                                              ? () {
                                                  if (paymentFor ==
                                                      AppSettings
                                                          .paymentTypeTopup)
                                                    buildContext
                                                        .read<
                                                            MySettingsListener>()
                                                        .updateTopupHeaderAndDetails(
                                                            buildContext,
                                                            gatewayDetail,
                                                            profileData,
                                                            paymentFor,
                                                            AppTheme_);
                                                  if (paymentFor ==
                                                      AppSettings
                                                          .paymentTypeOrder)
                                                    buildContext
                                                        .read<
                                                            MySettingsListener>()
                                                        .updateOrderHeaderAndDetails(
                                                            buildContext,
                                                            gatewayDetail,
                                                            profileData,
                                                            IsWallet,
                                                            Balance,
                                                            paymentFor,
                                                            AppTheme_);
                                                }
                                              : null,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: HexColor(
                                                AppTheme_['ButtonBgColor']),
                                            textStyle: TextStyle(
                                                color: HexColor(AppTheme_[
                                                    'ButtonFontColor'])),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        60.0)),
                                          ),
                                        )))),
                          )
                      ],
                    ),
                  ),
                ),
              );
            });
      });
}
