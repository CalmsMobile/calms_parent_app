import 'package:calms_parent_latest/common/common_api.dart';
import 'package:calms_parent_latest/common/util/common_funtions.dart';

import '../../../common/listener/settings_listener.dart';
import '/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealPager extends StatelessWidget {
  const MealPager(
      this.mealList_,this.CurrencyCode, this.imgBaseUrl,this.UserSeqId,this.poTypesList, this.callbackFun)
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
          margin: EdgeInsets.only(bottom: 0, left: 10, right: 0),
          child: GridView.builder(
            itemCount: mealList_.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 8,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
               CommonUtil().getMealItemDetail(context,mealList_[index]['ItemSeqId'],mealList_[index]['ViewDate'],mealList_[index]['addedToCart'],poTypesList,CurrencyCode,imgBaseUrl,poTypesList['PreOrderType'] == 'Daily'?true:false,UserSeqId,callbackFun,index);
                // moveToDetails(_foundStoreList, index, context);
                /* Navigator.of(context)
                    .pushNamed('/MealDetails', arguments: mealList_[index]); */
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                borderOnForeground: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        child: mealList_[index]['ImgPathUrl'] != null &&
                                mealList_[index]['ImgPathUrl'] != ""
                            ? Image.network(
                                CommonFunctions.getMealImageUrl(imgBaseUrl, mealList_[index]['ImgPathUrl']),
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover)
                            : Image.asset("assets/images/meal_default.png",
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                // products is out demo list
                                mealList_[index]['Name'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (mealList_[index]['Rating'] == null)
                              Row(
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
                        RichText(
                            maxLines: 1,
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    "${CurrencyCode} ${mealList_[index]['SellingPrice'].toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: appFontFmaily,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ])),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 2, top: 10, bottom: 5, left: 15),
                          child: mealList_[index]['ItemStyle'] != null ||
                                  mealList_[index]['ItemStyle'] != ""
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      )),
                                  child: Text(
                                      "${mealList_[index]['ItemStyle']}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal)),
                                )
                              : SizedBox(),
                        ),
                        if(poTypesList['PreOrderType'] == 'Daily')
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right: 10),
                            child: ClipOval(
                              child: Material(
                                color: mealList_[index]['addedToCart']
                                    ? Colors.red
                                    : Colors.blue, // Button color
                                child: InkWell(
                                  onTap: () async {
                                    mealList_[index]['addedToCart']?
                                    callbackFun(mealList_[index],index,true):
                                    callbackFun(mealList_[index],index,false);
                                  },
                                  child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: mealList_[index]['addedToCart']
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ],
    ));
  }
}
