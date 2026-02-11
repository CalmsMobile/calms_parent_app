import 'package:calms_parent/common/HexColor.dart';
import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/app_settings.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

PreferredSizeWidget getMyAppbar(var titleText, List<Widget> actions1) {
  return AppBar(
      title: Text(
        titleText,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0,
      backgroundColor: HexColor("#f5f8fd"),
      titleSpacing: -5,
      actions: actions1);
}

PreferredSizeWidget getBottomSheetActionBar(
    BuildContext context, var titleText, bool showClose, Color bgcolor) {
  return AppBar(
    title: titleText == 'Confirmation'
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
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              )),
            ]),
          )
        : Text(
            titleText,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: titleText == 'Summary' || titleText == 'Attendance'
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
    BuildContext buildContext, getfamilyList, imageBaseUrl, callback) {
  print(getfamilyList.toString());
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
                  itemCount: getfamilyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              getfamilyList[index]['UserImgPath'] != null
                                  ? imageBaseUrl +
                                      getfamilyList[index]['UserImgPath']
                                  : AppSettings.avatarPlaceholder),
                          radius: 20,
                        ),
                        title: new Text(getfamilyList[index]["Name"]),
                        subtitle: new Text(
                          getfamilyList[index]["MemberId"].toString(),
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

void showCustomPaymentAlert(BuildContext buildContext) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.pinkAccent,
    textStyle: TextStyle(color: Colors.white),
  );

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
                          margin: EdgeInsets.only(top: 0),
                          padding: EdgeInsets.symmetric(horizontal: 20),
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Top-up Amount",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Admin Fee",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Global Payment",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "MYR 1.00",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "MYR 5.00",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "MYR 6.00",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 10),
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 10),
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 10),
                        //   padding: EdgeInsets.symmetric(horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [],
                        //   ),
                        // ),

                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: /* RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Topup",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.pinkAccent,
                            ), */
                                ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {},
                              child: Text('Topup'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      });
}

void showPaymentSelectOption(
    BuildContext buildContext, titleText, paymentList, callback) {
  var selectedPaymentMethod = "FPX Online Payment";
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            AppBar(
                              title: Text(
                                titleText,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
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
                                    new Divider(
                                      height: 0.1,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      height: 45,
                                      child: ListTile(
                                        horizontalTitleGap: -8,
                                        title: new Text(
                                          paymentList[index]["name"],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        leading: Icon(
                                          Icons.done_sharp,
                                          size: 16,
                                          color: selectedPaymentMethod ==
                                                  paymentList[index]["name"]
                                              ? Colors.pinkAccent
                                              : Colors.grey,
                                        ),
                                        trailing: Container(
                                          height: 45,
                                          width: 45,
                                          child: Image.network(
                                              paymentList[index]["image"]),
                                        ),
                                        onTap: () {
                                          selectedPaymentMethod =
                                              paymentList[index]["name"];
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ]);
                                }),
                            if (selectedPaymentMethod == "FPX Online Payment")
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
                                              color:
                                                  Theme.of(context).hintColor,
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
                                              color:
                                                  Theme.of(context).hintColor,
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
                                              selectedBankValue =
                                                  value as String;
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
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: CheckboxListTile(
                                checkColor: Colors.white,
                                activeColor: Colors.pinkAccent,
                                contentPadding: EdgeInsets.zero,
                                title: RichText(
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                      text:
                                          'Click here to indicate that you have read and agree to the terms presented in the ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: 'Terms and Conditions',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
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
                                      ]),
                                ),
                                value: checkedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue!;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (checkedValue &&
                                    selectedPaymentMethod != "") {
                                  Navigator.of(buildContext).pop();
                                  showCustomPaymentAlert(context);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: checkedValue &&
                                          selectedPaymentMethod != ""
                                      ? Colors.pinkAccent
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border(
                                    bottom: BorderSide(
                                        color: checkedValue &&
                                                selectedPaymentMethod != ""
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                        width: 1),
                                    right: BorderSide(
                                        color: checkedValue &&
                                                selectedPaymentMethod != ""
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                        width: 1),
                                    top: BorderSide(
                                        color: checkedValue &&
                                                selectedPaymentMethod != ""
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                        width: 1),
                                    left: BorderSide(
                                        color: checkedValue &&
                                                selectedPaymentMethod != ""
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                        width: 1),
                                  ),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: checkedValue &&
                                              selectedPaymentMethod != ""
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
                                              selectedPaymentMethod != ""
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
                            )
                          ],
                        ),
                      ));
            });
      });
}
