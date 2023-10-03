import 'dart:convert';

import 'package:calms_parent_latest/common/widgets/no_data_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/app_settings.dart';
import '../../../common/common_api.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/my_shared_pref.dart';
import '../../../common/util/common_funtions.dart';
import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/constants.dart';
import '../../../common/widgets/common.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final imgBaseUrl;
  final profileData;
  const CartPage(this.imgBaseUrl, this.profileData, {Key? key})
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getMyAppbar(context, "My Cart", [
          Consumer<MySettingsListener>(builder: (context, data, settingsDta) {
            return data.finalCartList
                        .where((element) => element['isSelected'] == true)
                        .length >
                    0
                ? Container(
                    height: 30,
                    //width: 100,
                    margin: EdgeInsets.only(right: 10),
                    child: Row(children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(left: 10),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.red, // Button color
                                  child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 18,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                data.finalCartListForBilling != []
                                    ? data.finalCartList
                                        .where((element) =>
                                            element['isSelected'] == true)
                                        .length
                                        .toString()
                                    : "0",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          )
                        ],
                      ),
                    ]),
                  )
                : SizedBox();
          })
        ]),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(child:
            Consumer<MySettingsListener>(builder: (context, data, settingsDta) {
          if (data.finalCartList.isNotEmpty) {
            /* print("==================");
            print(data.finalCartList);
            print("=================="); */
            return Container(
              color: HexColor("#f5f8fd"),
              margin: EdgeInsets.symmetric(horizontal: 0),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 0),
                              child: Text(
                                "Orders",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(right: 0, top: 0),
                              child: Row(
                                children: [
                                  RichText(
                                    maxLines: 2,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "${data.finalCartList.where((element) => element['isSelected'] == true).length}/${data.finalCartList.length} ITEMS SELECTED",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: appFontFmaily,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      activeColor: Colors.blue,
                                      // shape: CircleBorder(),
                                      value: getItemsSelectedState(
                                              data.finalCartList)
                                          ? true
                                          : false,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          // data.finalCartList[index]['isSelected'] = value!;
                                          selectOrDeselectAll(
                                              data.finalCartList, value!);
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
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: data.finalCartList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(0)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 0),
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: double.maxFinite,
                                              margin: EdgeInsets.all(10),
                                              //padding: EdgeInsets.all(5.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,

                                                    /* decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color.fromARGB(
                                                    91, 158, 158, 158),
                                              ), */
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.only(
                                                        bottom: 3, left: 10),

                                                    // color: Color.fromARGB(178, 158, 158, 158),
                                                    child: RichText(
                                                      maxLines: 2,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: data
                                                                    .finalCartList[
                                                                index]['Name'],
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    appFontFmaily,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        1,
                                                                        98,
                                                                        32),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Row(
                                                          children: [
                                                            data.finalCartList[index]
                                                                            [
                                                                            'member'][0]
                                                                        [
                                                                        "UserImgPath"] !=
                                                                    null
                                                                ? CircleAvatar(
                                                                    backgroundImage: NetworkImage(widget
                                                                            .imgBaseUrl +
                                                                        data.finalCartList[index]['member'][0]
                                                                            [
                                                                            "UserImgPath"]),
                                                                  )
                                                                : CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors.blue[
                                                                            700],
                                                                    child: Text(
                                                                      CommonFunctions.getInitials(data.finalCartList[index]['member']
                                                                              [
                                                                              0]
                                                                          [
                                                                          'Name']),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              22.0,
                                                                          color: Colors
                                                                              .white,
                                                                          letterSpacing:
                                                                              2.0,
                                                                          fontWeight:
                                                                              FontWeight.w900),
                                                                    ),
                                                                  ),
                                                            Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                child: Flexible(
                                                                    child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                      Text(
                                                                        "${data.finalCartList[index]['member'][0]['Name']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontFamily:
                                                                                appFontFmaily,
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                      data.finalCartList[index]['member'][0]['Grade'] !=
                                                                              null
                                                                          ? Text(
                                                                              "${data.finalCartList[index]['member'][0]['Grade']}",
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(fontSize: 12, fontFamily: appFontFmaily, color: Colors.black, fontWeight: FontWeight.normal),
                                                                            )
                                                                          : SizedBox()
                                                                    ])))
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        child: Transform.scale(
                                                          scale: 1.5,
                                                          child: Checkbox(
                                                            activeColor:
                                                                Colors.blue,
                                                            value: data.finalCartList[
                                                                            index]
                                                                        [
                                                                        'isSelected'] !=
                                                                    null
                                                                ? data.finalCartList[
                                                                        index][
                                                                    'isSelected']
                                                                : false,
                                                            onChanged:
                                                                (bool? value) {
                                                              //setState(() {

                                                              data.finalCartList[
                                                                          index]
                                                                      [
                                                                      'isSelected'] =
                                                                  value;
                                                              context
                                                                  .read<
                                                                      MySettingsListener>()
                                                                  .removeFromCart();
                                                              /* context
                                                                  .read<
                                                                      MySettingsListener>()
                                                                  .updateSelectedOrderCalculateTotal(
                                                                      data.finalCartList); */
                                                              // });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: RichText(
                                                            maxLines: 2,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      "${widget.profileData['CurrencyCode']} ${data.finalCartList[index]["SellingPrice"].toStringAsFixed(2)}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          appFontFmaily,
                                                                      color: HexColor(
                                                                          AppSettings
                                                                              .colorCurrencyCode),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: RichText(
                                                            maxLines: 2,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      "${data.finalCartList[index]['AvailableOn'] != null ? DateFormat('dd-MMM-yyyy').format(DateTime.parse(data.finalCartList[index]['AvailableOn'])) : DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          appFontFmaily,
                                                                      color: Colors
                                                                          .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
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
                                    ));
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
                ? NoDataCard(AppSettings.imgAssetNoItemInCart,
                    AppSettings.titleNoItemInCart, AppSettings.msgNoItemInCart)
                : SizedBox();
        })),
        bottomNavigationBar:
            Consumer<MySettingsListener>(builder: (context, data, settingsDta) {
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
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
                                      text: widget.profileData['CurrencyCode'] +
                                          " ",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: HexColor(
                                              AppSettings.colorCurrencyCode),
                                          fontSize: 18)),
                                  new TextSpan(
                                      text: data.cartTotal.toStringAsFixed(2),
                                      style: TextStyle(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        showPaymentSelectOption(
                                            context,
                                            "Choose payment type",
                                            data.paymentProvidersList,
                                            data.cartTotal,
                                            widget.profileData,
                                            AppSettings.paymentTypeOrder);
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 6, 105, 199),
                                  textStyle: TextStyle(color: Colors.white),
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
        );
  }

  /* bool isAnySelected() {
    bool result = false;
    for (var item in cartList) {
      List localList = item['items'];
      int index =
          localList.indexWhere((element) => element['isSelected'] == true);
      if (index > -1) {
        result = true;
        break;
      }
    }
    return result;
  } */

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
