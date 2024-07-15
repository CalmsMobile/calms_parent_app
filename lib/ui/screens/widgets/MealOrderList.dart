import 'package:calms_parent_latest/common/common_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/HexColor.dart';
import '../../../common/alert_dialog.dart';
import '../../../common/app_settings.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/util/common_funtions.dart';
import '../../../provider/rest_api.dart';

class MealOrderListView extends StatelessWidget {
  //final String imgBaseUrl;
  String CurrencyCode;
  final profileData;
  final AppTheme_;
  List poSettings;
  List poTypesList;
  Map<dynamic, List<dynamic>> poList;
  List poPackagesList;
  var memberDetails = {};
  String imgBaseUrl;
  Future<void> Function() getData;
  MealOrderListView(
      this.poSettings,
      this.poTypesList,
      this.poPackagesList,
      this.CurrencyCode,
      this.poList,
      this.memberDetails,
      this.imgBaseUrl,
      this.profileData,
      this.AppTheme_,
      this.getData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: poTypesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    elevation: 10,
                    shadowColor: Colors.black,
                    color: Color.fromARGB(255, 249, 249, 249),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: poTypesList[index][0]
                                                  ['PreOrderType'] ==
                                              "Daily"
                                          ? Text(
                                              "Daily Meals",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          : Text(
                                              "Package Meals",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                    ),
                                    Text(
                                      poTypesList[index][0]['ConfigName'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize:16,
                                        color:  HexColor(AppTheme_['SecondaryBgColor']),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    poTypesList[index][0]['PreOrderType'] ==
                                            "Terms"
                                        ? Text(
                                            "(${DateFormat('dd-MMM-yyyy').format(DateTime.parse(poTypesList[index][0]['FromDate']))} - ${DateFormat('dd-MMM-yyyy').format(DateTime.parse(poTypesList[index][0]['ToDate']))})",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              ),
                              Container(
                                  child: (poTypesList[index][0]
                                                  ['PreOrderType'] ==
                                              "Daily" &&
                                          poTypesList[index][0]['AllowToView'])
                                      ? InkWell(
                                          onTap: () {
                                            CommonUtil().getMealItemsForUser(
                                                context,
                                                memberDetails['UserSeqId'],
                                                memberDetails['RefBranchSeqId'],
                                                poTypesList[index][0],
                                                CurrencyCode,
                                                imgBaseUrl,
                                                profileData,AppTheme_,
                                                false);
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.only(left:10,right: 10,top: 25),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors
                                                    .orange, // Button color
                                                child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: Icon(
                                                      Icons
                                                          .shopping_bag_rounded,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox()),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          (poTypesList[index].length > 0 &&
                                  poTypesList[index][0]['PreOrderType'] ==
                                      "Terms")
                              ? Container(
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: poTypesList[index].length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.white,
                                                    blurRadius: 3.0,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Colors.white)),
                                            // color: Colors.grey,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  // color: Colors.amberAccent,
                                                  child: Expanded(
                                                      child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${poTypesList[index][i]["Name"]}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        /*  "${CurrencyCode} " +
                                                          "${poTypesList[index][i]["Amount"].toStringAsFixed(2)}", */
                                                        /* "${CurrencyCode} ${CommonFunctions.getProRatedAmount(poTypesList[index][i]['PackageSeqId'], poTypesList[index][i]['ConfigJSON'], poTypesList[index][i]['PerDayAmt'], poTypesList[index][i]['Amount'], poPackagesList).toStringAsFixed(2)}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: HexColor(AppSettings.colorCurrencyCode),
                                                          fontWeight:
                                                              FontWeight.bold), */
                                                        "${CurrencyCode} ${poTypesList[index][i]['Amount']}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: HexColor(
                                                                AppSettings
                                                                    .colorCurrencyCode),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                                Container(
                                                  //color: Colors.amber,
                                                  child: Row(
                                                    children: [
                                                      if (poTypesList[index][i][
                                                                  'MobMainStatus'] !=
                                                              null &&
                                                          poTypesList[index][i][
                                                                  'MobMainStatus'] ==
                                                              10)
                                                        InkWell(
                                                          onTap: () {
                                                            CommonUtil().getMealItemsForUser(
                                                                context,
                                                                memberDetails[
                                                                    'UserSeqId'],
                                                                memberDetails[
                                                                    'RefBranchSeqId'],
                                                                poTypesList[
                                                                    index][i],
                                                                CurrencyCode,
                                                                imgBaseUrl,
                                                                profileData,AppTheme_,
                                                                false);
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: ClipOval(
                                                              child: Material(
                                                                color: Colors
                                                                    .orange, // Button color
                                                                child: SizedBox(
                                                                    width: 30,
                                                                    height: 30,
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove_red_eye_outlined,
                                                                      color: Color.fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),
                                                                      size: 20,
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (poTypesList[index][i][
                                                                  'MobMainStatus'] !=
                                                              null &&
                                                          poTypesList[index][i][
                                                                  'MobMainStatus'] ==
                                                              20)
                                                        InkWell(
                                                          onTap: () {
                                                            CommonUtil().getMealItemsForUser(
                                                                context,
                                                                memberDetails[
                                                                    'UserSeqId'],
                                                                memberDetails[
                                                                    'RefBranchSeqId'],
                                                                poTypesList[
                                                                    index][i],
                                                                CurrencyCode,
                                                                imgBaseUrl,
                                                                profileData,AppTheme_,
                                                                false);
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: ClipOval(
                                                              child: Material(
                                                                color: Colors
                                                                    .orange, // Button color
                                                                child: SizedBox(
                                                                    width: 30,
                                                                    height: 30,
                                                                    child: Icon(
                                                                      Icons
                                                                          .paypal_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 20,
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (poTypesList[index][i][
                                                                  'MobMainStatus'] !=
                                                              null &&
                                                          poTypesList[index][i][
                                                                  'MobMainStatus'] ==
                                                              30)
                                                        InkWell(
                                                          onTap: () {
                                                            CommonUtil().getMealItemsForUser(
                                                                context,
                                                                memberDetails[
                                                                    'UserSeqId'],
                                                                memberDetails[
                                                                    'RefBranchSeqId'],
                                                                poTypesList[
                                                                    index][i],
                                                                CurrencyCode,
                                                                imgBaseUrl,
                                                                profileData,AppTheme_,
                                                                poTypesList[
                                                                        index][i]
                                                                    [
                                                                    'AllowToChoose']);
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: ClipOval(
                                                              child: Material(
                                                                color: poTypesList[
                                                                            index][i]
                                                                        [
                                                                        'AllowToChoose']
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .orange, // Button color
                                                                child: SizedBox(
                                                                    width: 30,
                                                                    height: 30,
                                                                    child: poTypesList[index][i]
                                                                            [
                                                                            'AllowToChoose']
                                                                        ? Icon(
                                                                            Icons.podcasts_outlined,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                20,
                                                                          )
                                                                        : Icon(
                                                                            Icons.remove_red_eye_outlined,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                20,
                                                                          )),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (poTypesList[index][i][
                                                                  'MobMainStatus'] !=
                                                              null &&
                                                          poTypesList[index][i][
                                                                  'MobMainStatus'] ==
                                                              10 &&
                                                          poTypesList[index][i]
                                                              ['AllowToBuy'])
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 10),
                                                            child: ClipOval(
                                                              child: Material(
                                                                color: poTypesList[
                                                                            index][i]
                                                                        [
                                                                        'addedToCart']
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .blue, // Button color
                                                                child: InkWell(
                                                                  /* splashColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        36,
                                                                        255,
                                                                        3), */
                                                                  onTap:
                                                                      () async {
                                                                    if (!poTypesList[
                                                                            index][i]
                                                                        [
                                                                        'addedToCart'])
                                                                      await context.read<MySettingsListener>().updatePoTypePackageCartStatus(
                                                                          index,
                                                                          i,
                                                                          false,
                                                                          memberDetails[
                                                                              'UserSeqId'],context);
                                                                    else
                                                                      await context
                                                                          .read<
                                                                              MySettingsListener>()
                                                                          .updatePoTypePackageCartStatus(
                                                                              index,
                                                                              i,
                                                                              true,
                                                                              memberDetails['UserSeqId'],context);
                                                                  },
                                                                  child: SizedBox(
                                                                      width: 30,
                                                                      height: 30,
                                                                      child: poTypesList[index][i]['addedToCart']
                                                                          ? Icon(
                                                                              Icons.delete_outlined,
                                                                              color: Colors.white,
                                                                              size: 20,
                                                                            )
                                                                          : Icon(
                                                                              Icons.add_shopping_cart_outlined,
                                                                              color: Colors.white,
                                                                              size: 20,
                                                                            )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (poTypesList[index][i][
                                                                  'MobMainStatus'] !=
                                                              null &&
                                                          poTypesList[index][i][
                                                                  'MobMainStatus'] ==
                                                              20)
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 10),
                                                            child: ClipOval(
                                                              child: Material(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        89,
                                                                        126,
                                                                        156), // Button color
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {},
                                                                  child: SizedBox(
                                                                      width: 30,
                                                                      height: 30,
                                                                      child: Icon(
                                                                        Icons
                                                                            .paypal_outlined,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            20,
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (poTypesList[index][i][
                                                                  'MobMainStatus'] !=
                                                              null &&
                                                          poTypesList[index][i][
                                                                  'MobMainStatus'] ==
                                                              30)
                                                       poTypesList[index][i]['AllowToCancel']? InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 10),
                                                            child: ClipOval(
                                                              child: Material(
                                                                color: poTypesList[
                                                                            index][i]
                                                                        [
                                                                        'AllowToCancel']
                                                                    ? Colors.red
                                                                    : Color.fromARGB(
                                                                        255,
                                                                        9,
                                                                        88,
                                                                        43), // Button color
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    MyCustomAlertDialog().mealCustomAlert(
                                                                        context,
                                                                        "Alert!",
                                                                        'Do you want to cancel meal?',
                                                                        true,
                                                                        true,
                                                                        true,
                                                                        true,
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      CommonUtil().cancelWholeTerm(
                                                                          context,
                                                                          poTypesList[index][i]
                                                                              [
                                                                              'RefBranchSeqId'],
                                                                          memberDetails[
                                                                              'UserSeqId'],
                                                                          profileData[
                                                                              'RefUserSeqId'],
                                                                          poTypesList[index][i]
                                                                              [
                                                                              'RefTransSeqId'],
                                                                          poTypesList[index][i]
                                                                              [
                                                                              'FromDate'],
                                                                          poTypesList[index][i]
                                                                              [
                                                                              'PackageSeqId'],
                                                                          poTypesList[index][i]
                                                                              [
                                                                              'RefMemberTypeSeqId'],
                                                                          poTypesList[index][i]
                                                                              [
                                                                              'POTypeConfigSeqId'],
                                                                          getData);
                                                                    }, () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    }, "Yes",
                                                                        "No");
                                                                  },
                                                                  child: SizedBox(
                                                                      width: 30,
                                                                      height: 30,
                                                                      child: poTypesList[index][i]['AllowToCancel']
                                                                          ? Icon(
                                                                              Icons.cancel_outlined,
                                                                              color: Colors.white,
                                                                              size: 20,
                                                                            )
                                                                          : Icon(
                                                                              Icons.shopping_bag_outlined,
                                                                              color: Colors.white,
                                                                              size: 20,
                                                                            )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ):SizedBox()
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ));
                                      }),
                                )
                              : SizedBox(), //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                    //SizedBox
                  );
                }),
          ),
        ],
      ),
    );
  }
}
