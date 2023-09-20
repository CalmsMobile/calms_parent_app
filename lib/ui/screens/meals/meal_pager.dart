import 'package:calms_parent_latest/common/HexColor.dart';
import 'package:calms_parent_latest/common/common_api.dart';
import 'package:calms_parent_latest/common/util/common_funtions.dart';

import '../../../common/app_settings.dart';
import '../../../common/listener/settings_listener.dart';
import '/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealPager extends StatelessWidget {
  const MealPager(this.mealList_, this.CurrencyCode, this.imgBaseUrl,
      this.UserSeqId, this.poTypesList, this.callbackFun)
      : super();

  final mealList_;
  final CurrencyCode;
  final imgBaseUrl;
  final UserSeqId;
  final poTypesList;
  final Function callbackFun;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Flexible(
            child: Container(
          margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
          child: GridView.builder(
            itemCount: mealList_.length,
            shrinkWrap: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  CommonUtil().getMealItemDetail(
                      context,
                      mealList_[index]['ItemSeqId'],
                      mealList_[index]['ViewDate'],
                      mealList_[index]['addedToCart'],
                      poTypesList,
                      CurrencyCode,
                      imgBaseUrl,
                      poTypesList['PreOrderType'] == 'Daily' ? true : false,
                      UserSeqId,
                      callbackFun,
                      index);
                  // moveToDetails(_foundStoreList, index, context);
                  /* Navigator.of(context)
                    .pushNamed('/MealDetails', arguments: mealList_[index]); */
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  borderOnForeground: true,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0)),
                            child: mealList_[index]['ImgPathUrl'] != null &&
                                    mealList_[index]['ImgPathUrl'] != ""
                                ? Image.network(
                                    CommonFunctions.getMealImageUrl(imgBaseUrl,
                                        mealList_[index]['ImgPathUrl']),
                                    width: double.infinity,
                                    height: 110,
                                    fit: BoxFit.cover)
                                : Image.asset("assets/images/meal_default.png",
                                    width: double.infinity,
                                    height: 110,
                                    fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 5),
                          //padding:EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                          decoration: BoxDecoration(
                            color:HexColor(mealList_[index]['Colour']),
                          ),
                          child: Text(
                              "${mealList_[index]['ItemStyle'] != null || mealList_[index]['ItemStyle'] != "" ? mealList_[index]['ItemStyle'] : ""}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        // products is out demo list
                                        mealList_[index]['Name'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: kTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    if (mealList_[index]['Rating'] == null)
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    if (mealList_[index]['Rating'] != null)
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            mealList_[index]['Rating'] > 0
                                                ? Icons.star
                                                : Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                          Icon(
                                            mealList_[index]['Rating'] > 1
                                                ? Icons.star
                                                : Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                          Icon(
                                            mealList_[index]['Rating'] > 2
                                                ? Icons.star
                                                : Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                          Icon(
                                            mealList_[index]['Rating'] > 3
                                                ? Icons.star
                                                : Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                          Icon(
                                            mealList_[index]['Rating'] > 4
                                                ? Icons.star
                                                : Icons.star_border_outlined,
                                            color: Colors.orangeAccent,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Row(
                            //mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  maxLines: 1,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          "${CurrencyCode} ${mealList_[index]['SellingPrice'].toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: appFontFmaily,
                                          color: HexColor(AppSettings.colorCurrencyCode),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ])),
                              if (poTypesList['PreOrderType'] == 'Daily')
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    //margin: EdgeInsets.only(bottom: 10),
                                    child: ClipOval(
                                      child: Material(
                                        color: mealList_[index]['addedToCart']
                                            ? Colors.red
                                            : Colors.blue, // Button color
                                        child: InkWell(
                                          onTap: () async {
                                            mealList_[index]['addedToCart']
                                                ? callbackFun(mealList_[index],
                                                    index, true)
                                                : callbackFun(mealList_[index],
                                                    index, false);
                                          },
                                          child: SizedBox(
                                              width: 25,
                                              height: 25,
                                              child: mealList_[index]
                                                      ['addedToCart']
                                                  ? Icon(
                                                      Icons.delete_outlined,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .add_shopping_cart_outlined,
                                                      color: Colors.white,
                                                      size: 15,
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
                    ),
                  ),
                )),
          ),
        )),
      ],
    ));
  }
}
