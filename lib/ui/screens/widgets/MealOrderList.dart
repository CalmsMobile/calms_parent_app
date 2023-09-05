import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../common/app_settings.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/util/common_funtions.dart';
import '../../../provider/rest_api.dart';

class MealOrderListView extends StatelessWidget {
  //final String imgBaseUrl;
  final String CurrencyCode;
  List poSettings;
  List poTypesList;
  Map<dynamic, List<dynamic>> poList;
  List poPackagesList;
  MealOrderListView(this.poSettings, this.poTypesList, this.poPackagesList,
      this.CurrencyCode, this.poList);

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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    poTypesList[index][0]['PreOrderType'],
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  child: poTypesList[index][0]
                                              ['PreOrderType'] ==
                                          "Daily"
                                      ? InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.all(10),
                                            child: ClipOval(
                                              child: Material(
                                                color:
                                                    Colors.blue, // Button color
                                                child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: Icon(
                                                      Icons
                                                          .remove_red_eye_outlined,
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
                          (poTypesList[index].length > 1)
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
                                                horizontal: 15, vertical: 5),
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
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: ClipOval(
                                                            child: Material(
                                                              color: Colors
                                                                  .blue, // Button color
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
                                                      Text(
                                                        "${poTypesList[index][i]["Name"]}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  //textDirection: TextDirection.ltr,
                                                  children: [
                                                    Text(
                                                      "${CurrencyCode} " +
                                                          "${poTypesList[index][i]["Amount"].toStringAsFixed(2)}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .blue.shade900,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: 30,
                                                        height: 30,
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ClipOval(
                                                          child: Material(
                                                            color: Colors
                                                                .blue, // Button color
                                                            child: InkWell(
                                                              splashColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      36,
                                                                      255,
                                                                      3), // Splash color
                                                              onTap: () {},
                                                              child: SizedBox(
                                                                  width: 30,
                                                                  height: 30,
                                                                  child: Icon(
                                                                    Icons
                                                                        .add_shopping_cart_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20,
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
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
