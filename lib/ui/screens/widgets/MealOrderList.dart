import 'package:calms_parent_latest/common/common_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../common/HexColor.dart';
import '../../../common/app_settings.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/util/common_funtions.dart';
import '../../../provider/rest_api.dart';

class MealOrderListView extends StatelessWidget {
  //final String imgBaseUrl;
  final String CurrencyCode;
  final profileData;
  List poSettings;
  List poTypesList;
  Map<dynamic, List<dynamic>> poList;
  List poPackagesList;
  var memberDetails = {};
  String imgBaseUrl;
  MealOrderListView(
      this.poSettings,
      this.poTypesList,
      this.poPackagesList,
      this.CurrencyCode,
      this.poList,
      this.memberDetails,
      this.imgBaseUrl,
      this.profileData);

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
                              Expanded(child: 
                              Column(
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
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        : Text(
                                            "Package Meals",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                  ),
                                 
                                  Text(
                                    poTypesList[index][0]['ConfigName'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),),
                              Container(
                                  child: poTypesList[index][0]
                                              ['PreOrderType'] ==
                                          "Daily"
                                      ? InkWell(
                                          onTap: () {
                                            CommonUtil().getMealItemsForUser(
                                                context,
                                                memberDetails['UserSeqId'],
                                                memberDetails['RefBranchSeqId'],
                                                poTypesList[index][0],
                                                CurrencyCode,
                                                imgBaseUrl,
                                                profileData);
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.all(10),
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
                          (poTypesList[index].length > 0 && poTypesList[index][0]
                                                ['PreOrderType'] ==
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
                                            child:Flexible(child:  Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    // color: Colors.amberAccent,
                                                    child:Expanded(child:  Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${poTypesList[index][i]["Name"]}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                     /*  "${CurrencyCode} " +
                                                          "${poTypesList[index][i]["Amount"].toStringAsFixed(2)}", */
                                                      "${CurrencyCode} ${CommonFunctions.getProRatedAmount(poTypesList[index][i]['PackageSeqId'], poTypesList[index][i]['ConfigJSON'], poTypesList[index][i]['PerDayAmt'], poTypesList[index][i]['Amount'], poPackagesList).toStringAsFixed(2)}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: HexColor(AppSettings.colorCurrencyCode),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),),
                                                Container(
                                                  //color: Colors.amber,
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          CommonUtil()
                                                              .getMealItemsForUser(
                                                                  context,
                                                                  memberDetails[
                                                                      'UserSeqId'],
                                                                  memberDetails[
                                                                      'RefBranchSeqId'],
                                                                  poTypesList[
                                                                      index][i],
                                                                  CurrencyCode,
                                                                  imgBaseUrl,
                                                                  profileData);
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
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20,
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
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
                                                                    await context
                                                                        .read<
                                                                            MySettingsListener>()
                                                                        .updatePoTypePackageCartStatus(
                                                                            index,
                                                                            i,
                                                                            false,
                                                                            memberDetails['UserSeqId']);
                                                                  else
                                                                    await context
                                                                        .read<
                                                                            MySettingsListener>()
                                                                        .updatePoTypePackageCartStatus(
                                                                            index,
                                                                            i,
                                                                            true,
                                                                            memberDetails['UserSeqId']);
                                                                },
                                                                child: SizedBox(
                                                                    width: 30,
                                                                    height: 30,
                                                                    child: poTypesList[index][i]
                                                                            [
                                                                            'addedToCart']
                                                                        ? Icon(
                                                                            Icons.delete_outlined,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                20,
                                                                          )
                                                                        : Icon(
                                                                            Icons.add_shopping_cart_outlined,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                20,
                                                                          )),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )));
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
