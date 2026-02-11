import 'dart:convert';
import 'dart:developer';

import 'package:calms_parent_latest/common/widgets/no_data_card.dart';
import 'package:calms_parent_latest/ui/screens/home/Home.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/app_settings.dart';
import '../../../common/common_api.dart';
import '../../../common/date_util.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/my_shared_pref.dart';
import '../../../common/util/common_funtions.dart';
import '../notifications/notifications.dart';
import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/constants.dart';
import '../../../common/widgets/common.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final imgBaseUrl;
  final profileData;
  final AppTheme_;
  const CartPage(this.imgBaseUrl, this.profileData, this.AppTheme_, {Key? key})
      : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //var cartList = [];
  int selectedBoxIndex = 0;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    initValues();
  }

  Future<void> viewWillAppear() async {
    print("onResume / viewWillAppear / onFocusGained");
    var currentDate = DateUtil().convertDateNow(DateTime.now(), "yyyy/MM/dd");
    var cartAddedDate =
        await MySharedPref().getData(AppSettings.Sp_cartAddedDate);
    if (currentDate != cartAddedDate) {
      print(currentDate + " == " + cartAddedDate);
      print("same date");

      context.read<MySettingsListener>().clearCartListAfterPayment();
      MyCustomAlertDialog().showToast(context, "Cleared old cart records");
    }
  }

  void viewWillDisappear() {
    print("onPause / viewWillDisappear / onFocusLost");
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
        onFocusGained: viewWillAppear,
        onFocusLost: viewWillDisappear,
        child: Scaffold(
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                          //margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: HexColor(
                                    widget.AppTheme_['IconOutlineColor']),
                                width: 0.5),
                            color: HexColor(widget.AppTheme_['IconBgColor']),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: HexColor(
                                    widget.AppTheme_['IconOutlineColor']),
                                size: 25,
                              )))),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "My Cart",
                      style: TextStyle(
                          color:
                              HexColor(widget.AppTheme_['AppHeaderFontColor']),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                  // Your widgets here
                ],
              ),
              /*  actions: [
            Container(
              height: 30,
              //width: 100,
              margin: EdgeInsets.only(right: 10),
              child: Row(children: [
                Consumer<MySettingsListener>(
                    builder: (context, data, settingsDta) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications(
                                      NotifyOnly: profileData['NotifyOnly'],
                                      categoryList:
                                          data.NotificationCategoryList,
                                      name: 'NotificationDashboard'
                                    )));
                      },
                      child: Container(
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
                                Icons.notifications_outlined,
                                color: HexColor(widget.AppTheme_['SecondaryFrColor']),
                                size: 30,
                              ))));
                }),
                Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      HexColor(widget.AppTheme_['SecondaryFrColor']),
                                  width: 2),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Icon(
                                  Icons.delete_outline_sharp,
                                  color:
                                      HexColor(widget.AppTheme_['SecondaryFrColor']),
                                  size: 30,
                                )))),
                    Consumer<MySettingsListener>(
                        builder: (context, data, settingsDta) {
                      return Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            data.cartList != []
                                ? data.finalCartListForBilling.length.toString()
                                : "0",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      );
                    })
                  ],
                ),
               ]),
            ),
          ],
        
            */
            ),
            resizeToAvoidBottomInset: false,
            body: Container(
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
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(child:
                        Consumer<MySettingsListener>(
                            builder: (context, data, settingsDta) {
                      if (data.finalCartList.isNotEmpty) {
                        /* print("==================");
            print(data.finalCartList);
            print("=================="); */
                        return Container(
                          color: HexColor(widget.AppTheme_['PanelBgColor']),
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          child: Column(children: [
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    color: HexColor(
                                        widget.AppTheme_['PanelBgColor']),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 15, top: 0),
                                          child: Text(
                                            "Orders",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: HexColor(
                                                    widget.AppTheme_[
                                                        'TitleFontColor'])),
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          margin:
                                              EdgeInsets.only(right: 0, top: 0),
                                          child: Row(
                                            children: [
                                              RichText(
                                                maxLines: 2,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "${data.finalCartList.where((element) => element['isSelected'] == true).length}/${data.finalCartList.length} Items Selected",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily:
                                                            appFontFmaily,
                                                        color: HexColor(widget
                                                                .AppTheme_[
                                                            'ContentFontColor']),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Transform.scale(
                                                scale: 0.7,
                                                child: Checkbox(
                                                  checkColor: HexColor(
                                                      widget.AppTheme_[
                                                          'IconOutlineColor']),
                                                  activeColor: HexColor(
                                                      widget.AppTheme_[
                                                          'IconBgColor']),
                                                  side: BorderSide(
                                                    // ======> CHANGE THE BORDER COLOR HERE <======
                                                    color: HexColor(
                                                        widget.AppTheme_[
                                                            'IconBgColor']),
                                                    // Give your checkbox border a custom width
                                                    width: 1.5,
                                                  ),
                                                 
                                                  // shape: CircleBorder(),
                                                  value: getItemsSelectedState(
                                                          data.finalCartList)
                                                      ? true
                                                      : false,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      // data.finalCartList[index]['isSelected'] = value!;
                                                      selectOrDeselectAll(
                                                          data.finalCartList,
                                                          value!);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    child: Container(
                                      //width: double.infinity,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(
                                              parent:
                                                  AlwaysScrollableScrollPhysics()),
                                          itemCount: data.finalCartList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(0)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 0),
                                              margin:
                                                  EdgeInsets.only(bottom: 8),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      width: double.maxFinite,
                                                      margin:
                                                          EdgeInsets.all(10),
                                                      //padding: EdgeInsets.all(5.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              3,
                                                                          left:
                                                                              10),

                                                                  // color: Color.fromARGB(178, 158, 158, 158),
                                                                  child: Text(
                                                                    data.finalCartList[index]
                                                                            [
                                                                            'PreOrderType'] +
                                                                        ' (' +
                                                                        data.finalCartList[index]
                                                                            [
                                                                            'Name'] +
                                                                        ')',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            appFontFmaily,
                                                                        color: HexColor(widget.AppTheme_[
                                                                            'SubTitleFontColor']),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (data.finalCartList[
                                                                              index]
                                                                          [
                                                                          'isSelected'] !=
                                                                      null &&
                                                                  !data.finalCartList[
                                                                          index]
                                                                      [
                                                                      'isSelected'])
                                                                InkWell(
                                                                  onTap: () {
                                                                    MyCustomAlertDialog().mealCustomAlert(
                                                                        context,
                                                                        "Alert!",
                                                                        'Do you want to delete?',
                                                                        true,
                                                                        true,
                                                                        true,
                                                                        true,
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        context.read<MySettingsListener>().removeFromCart(
                                                                            data.finalCartList[index],
                                                                            data.finalCartList);
                                                                      });
                                                                      Navigator.pop(
                                                                          context);
                                                                    }, () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    }, "Yes",
                                                                        "No");
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 30,
                                                                    height: 30,
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                10),
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete_outlined,
                                                                      color: Colors
                                                                          .red,
                                                                      size: 25,
                                                                    ),
                                                                  ),
                                                                ),

                                                              /*  InkWell(
                                                          onTap: () => context
                                                              .read<
                                                                  MySettingsListener>()
                                                              .removeFromCart(
                                                                  index),
                                                          child: Icon(
                                                            Icons.delete,
                                                            size: 22,
                                                            color: Colors.red,
                                                          )) */
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                child: Row(
                                                                  children: [
                                                                    data.finalCartList[index]['member'][0]["UserImgPath"] !=
                                                                            null
                                                                        ? CircleAvatar(
                                                                            backgroundImage:
                                                                                NetworkImage(widget.imgBaseUrl + data.finalCartList[index]['member'][0]["UserImgPath"]),
                                                                          )
                                                                        : CircleAvatar(
                                                                            backgroundColor:
                                                                                HexColor(widget.AppTheme_['IconBgColor']),
                                                                            child:
                                                                                Text(
                                                                              CommonFunctions.getInitials(data.finalCartList[index]['member'][0]['Name']).toUpperCase(),
                                                                              style: TextStyle(fontSize: 22.0, color: HexColor(widget.AppTheme_['IconOutlineColor']), letterSpacing: 2.0, fontWeight: FontWeight.w900),
                                                                            ),
                                                                          ),
                                                                    Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                "${data.finalCartList[index]['member'][0]['Name']}",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(fontSize: 14, fontFamily: appFontFmaily, color: HexColor(widget.AppTheme_['TitleFontColor']), fontWeight: FontWeight.bold),
                                                                              ),
                                                                              data.finalCartList[index]['member'][0]['Grade'] != null
                                                                                  ? Text(
                                                                                      "${data.finalCartList[index]['member'][0]['Grade']}",
                                                                                      maxLines: 1,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: TextStyle(fontSize: 12, fontFamily: appFontFmaily, color: HexColor(widget.AppTheme_['SubTitleFontColor']), fontWeight: FontWeight.normal),
                                                                                    )
                                                                                  : SizedBox()
                                                                            ]))
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                child: Transform
                                                                    .scale(
                                                                  scale: 1.5,
                                                                  child:
                                                                      Checkbox(
                                                                    checkColor:
                                                                        HexColor(
                                                                            widget.AppTheme_['IconOutlineColor']),
                                                                    activeColor:
                                                                        HexColor(
                                                                            widget.AppTheme_['IconBgColor']),
                                                                    value: data.finalCartList[index]['isSelected'] !=
                                                                            null
                                                                        ? data.finalCartList[index]
                                                                            [
                                                                            'isSelected']
                                                                        : false,
                                                                    onChanged:
                                                                        (bool?
                                                                            value) {
                                                                      //setState(() {

                                                                      data.finalCartList[index]
                                                                              [
                                                                              'isSelected'] =
                                                                          value;
                                                                      context
                                                                          .read<
                                                                              MySettingsListener>()
                                                                          .updateSelectedOrderCalculateTotal(
                                                                              data.finalCartList);
                                                                      // });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child:
                                                                      RichText(
                                                                    maxLines: 2,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              "${widget.profileData['CurrencyCode']} ${data.finalCartList[index]["SellingPrice"].toStringAsFixed(2)}",
                                                                          style: TextStyle(
                                                                              fontSize: 16,
                                                                              fontFamily: appFontFmaily,
                                                                              color: HexColor(AppSettings.colorCurrencyCode),
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child:
                                                                      RichText(
                                                                    maxLines: 2,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              "${data.finalCartList[index]['PreOrderType'] == 'Daily' ? data.finalCartList[index]['Category'] + ' (' + DateFormat('dd-MMM-yyyy').format(DateTime.parse(data.finalCartList[index]['PurchaseDate'])) + ')' : DateFormat('dd-MMM-yyyy').format(DateTime.parse(data.finalCartList[index]['FromDate'])) + ' - ' + DateFormat('dd-MMM-yyyy').format(DateTime.parse(data.finalCartList[index]['ToDate']))}",
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              fontFamily: appFontFmaily,
                                                                              color: HexColor(widget.AppTheme_['ContentFontColor']),
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                    /* Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.close,
                                            size: 18,
                                          ),
                                        ),
                                      ) */
                                                  ]),
                                            );
                                          }),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        );
                      } else
                        return data.cartList.isEmpty
                            ? NoDataCard(
                                AppSettings.imgAssetNoItemInCart,
                                AppSettings.titleNoItemInCart,
                                AppSettings.msgNoItemInCart,
                                20,
                                widget.AppTheme_)
                            : SizedBox();
                    })))),
            bottomNavigationBar: Consumer<MySettingsListener>(
                builder: (context, data, settingsDta) {
              return data.cartTotal > 0
                  ? SizedBox(
                      height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                RichText(
                                  text: new TextSpan(
                                    // Note: Styles for TextSpans must be explicitly defined.
                                    // Child text spans will inherit styles from parent
                                    style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                          text: widget
                                                  .profileData['CurrencyCode'] +
                                              " ",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: HexColor(AppSettings
                                                  .colorCurrencyCode),
                                              fontSize: 18)),
                                      new TextSpan(
                                          text:
                                              data.cartTotal.toStringAsFixed(2),
                                          style: TextStyle(
                                            color: HexColor(AppSettings
                                                  .colorCurrencyCode),
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
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
                                          "Choose Payment Option",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.arrow_forward_ios)
                                      ],
                                    ),
                                    onPressed: data.cartTotal > 0
                                        ? () {
                                            if (data.paymentProvidersList == null || 
                                                data.paymentProvidersList.isEmpty) {
                                              MyCustomAlertDialog().showCustomAlert(
                                                context,
                                                "Error",
                                                "No payment options available",
                                                true,
                                                () {
                                                  Navigator.pop(context);
                                                },
                                                null,
                                                "Ok",
                                                ""
                                              );
                                              return;
                                            }
                                            
                                            showPaymentSelectOptionForOrder(
                                              context,
                                              "Choose payment type",
                                              data.paymentProvidersList,
                                              Map<String, dynamic>.from(data.paymentSetting ?? {}),
                                              data.cartTotal,
                                              widget.profileData,
                                              AppSettings.paymentTypeOrder,
                                              widget.AppTheme_
                                            );
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: HexColor(
                                          widget.AppTheme_['ButtonBgColor']),
                                      textStyle: TextStyle(
                                          color: HexColor(widget
                                              .AppTheme_['ButtonFontColor'])),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60.0)),
                                    ),
                                  ))),
                        ],
                      ),
                    )
                  : SizedBox();
            })
            /* bottomSheet: isAnySelected()
          ? Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0)),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "4 ITEM SELECTED FOR ORDER",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "RM 54.00",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    MyCustomAlertDialog()
                        .showToast(context, "Item added to cart ");
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue, width: 1),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.blue,
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          color: Colors.blue,
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Proceed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ]),
            )
          : Container(
              height: 0,
            ),
     */
            ));
  }

  void selectOrDeselectAll(List list, bool value) {
    for (var item in list) {
      item['isSelected'] = value;
    }
    context.read<MySettingsListener>().updateSelectedOrderCalculateTotal(list);
  }

  bool getItemsSelectedState(list) {
    for (var element in list) {
      if (element['isSelected']) return true;
    }
    return false;
  }

  var profileData = {};
  void initValues() {
    initData();
  }

  Future<void> initData() async {
    //imgBaseUrl = await MySharedPref().getData(AppSettings.Sp_Img_Base_Url);
    String profile = await MySharedPref().getData(AppSettings.Sp_ProfileData);
    profileData = jsonDecode(profile);
    print(profileData);
    CommonUtil().getCartPageSettings(context, profileData);
  }
}
