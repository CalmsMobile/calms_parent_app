import 'package:calms_parent_latest/common/HexColor.dart';
import 'package:calms_parent_latest/common/common_api.dart';
import 'package:calms_parent_latest/common/util/common_funtions.dart';

import '../../../common/alert_dialog.dart';
import '../../../common/app_settings.dart';
import '../../../common/listener/settings_listener.dart';
import '/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealPager extends StatelessWidget {
  const MealPager(this.mealList_, this.CurrencyCode, this.imgBaseUrl,
      this.UserSeqId, this.poTypesList,this.profileData, this.onCartClick,this.onCancelMeal,this.onChangeMeal,this.onCancelDailyMeal)
      : super();

  final mealList_;
  final CurrencyCode;
  final imgBaseUrl;
  final UserSeqId;
  final poTypesList;
  final profileData;
  final Function onCartClick;
  final Function onCancelMeal;
  final Function onChangeMeal;
  final Function onCancelDailyMeal;

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
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 3,
              childAspectRatio:0.8,
              mainAxisExtent: 221
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
                      onCartClick,
                      index);
                  // moveToDetails(_foundStoreList, index, context);
                  /* Navigator.of(context)
                    .pushNamed('/MealDetails', arguments: mealList_[index]); */
                },
                child:Expanded(child:  Card(
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
                              if(mealList_[index]['addedToCart'] && mealList_[index]['AllowToBuy'])
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    //margin: EdgeInsets.only(bottom: 10),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.red, // Button color
                                        child: InkWell(
                                          onTap: () async {
                                            onCartClick(mealList_[index],index, true);
                                          },
                                          child: SizedBox(
                                              width: 25,
                                              height: 25,
                                              child:Icon(
                                                      Icons.delete_outlined,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                           if(!mealList_[index]['addedToCart'] && mealList_[index]['AllowToBuy'])
                           InkWell(
                                  onTap: () {},
                                  child: Container(
                                    //margin: EdgeInsets.only(bottom: 10),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.blue, // Button color
                                        child: InkWell(
                                          onTap: () async {
                                            onCartClick(mealList_[index],
                                                    index, false);
                                          },
                                          child: SizedBox(
                                              width: 25,
                                              height: 25,
                                              child:Icon(
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
                           
                           if(mealList_[index]['AllowToCancel'])
                           InkWell(
                                  onTap: () {},
                                  child: Container(
                                    //margin: EdgeInsets.only(bottom: 10),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.red, // Button color
                                        child: InkWell(
                                          onTap: () async {
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
                                                                          print(mealList_[index]);
                                                                          print(poTypesList);
                                                                      CommonUtil().cancelDailyMealItem(
                                                                          context,
                                                                          poTypesList['RefBranchSeqId'],
                                                                          UserSeqId,
                                                                          mealList_[index]['ItemSeqId'],
                                                                          profileData['RefUserSeqId'],
                                                                          mealList_[index]['ItemType'],
                                                                          mealList_[index]['RefTransSeqId'],
                                                                          mealList_[index]['ViewDate'],
                                                                          mealList_[index]['RefPackageSeqId'],
                                                                          poTypesList['RefMemberTypeSeqId'],
                                                                          profileData['RefUserSeqId'],
                                                                          onCancelDailyMeal,index
                                                                          );
                                                                    }, () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    }, "Yes",
                                                                        "No");
                                          },
                                          child: SizedBox(
                                              width: 25,
                                              height: 25,
                                              child:Icon(
                                                      Icons
                                                          .cancel_outlined,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            if(mealList_[index]['AlreadyBuy'])
                           InkWell(
                                  onTap: () {},
                                  child: Container(
                                    //margin: EdgeInsets.only(bottom: 10),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.green, // Button color
                                        child: InkWell(
                                          onTap: () async {
                                            
                                          },
                                          child: SizedBox(
                                              width: 25,
                                              height: 25,
                                              child:Icon(
                                                      Icons
                                                          .shopping_bag_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                           
                            if (poTypesList['PreOrderType'] == 'Terms')
                                 InkWell(
                                  onTap: () {},
                                  child: Container(
                                    //margin: EdgeInsets.only(bottom: 10),
                                    child: ClipOval(
                                      child: Material(
                                        color: mealList_[index]['AllowToCancel']
                                            ? Colors.red
                                            : Colors.blue, // Button color
                                        child: InkWell(
                                          onTap: () async {
                                            mealList_[index]['AllowToCancel']
                                                ? MyCustomAlertDialog().mealCustomAlert(
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
                                                                          print(mealList_[index]);
                                                                          print(poTypesList);
                                                                      CommonUtil().cancelTermMealItem(
                                                                          context,
                                                                          poTypesList['RefBranchSeqId'],
                                                                          UserSeqId,
                                                                          mealList_[index]['ItemSeqId'],
                                                                          profileData['RefUserSeqId'],
                                                                          mealList_[index]['ItemType'],
                                                                          mealList_[index]['RefTransSeqId'],
                                                                          mealList_[index]['ViewDate'],
                                                                          mealList_[index]['RefPackageSeqId'],
                                                                          poTypesList['RefMemberTypeSeqId'],
                                                                          '',profileData['RefUserSeqId'],
                                                                          onCancelMeal,index
                                                                          );
                                                                    }, () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    }, "Yes",
                                                                        "No")
                                                                  
                                                : MyCustomAlertDialog().mealCustomAlert(
                                                                        context,
                                                                        "Alert!",
                                                                        'Do you want to change meal?',
                                                                        true,
                                                                        true,
                                                                        true,
                                                                        true,
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                          print(mealList_[index]);
                                                                          print(poTypesList);
                                                                      CommonUtil().changeMealItem(
                                                                          context,
                                                                          poTypesList['RefBranchSeqId'],
                                                                          UserSeqId,
                                                                          mealList_[index]['ItemSeqId'],
                                                                          mealList_[index]['ItemType'],
                                                                          poTypesList['RefTransSeqId'],
                                                                           mealList_[index]['ViewDate'],
                                                                          mealList_[index]['RefPackageSeqId'],
                                                                          poTypesList['RefMemberTypeSeqId'],
                                                                          '',
                                                                         profileData['RefUserSeqId'],
                                                                          onChangeMeal,index
                                                                          );
                                                                    }, () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    }, "Yes",
                                                                        "No");
                                          },
                                          child: SizedBox(
                                              width: 25,
                                              height: 25,
                                              child:mealList_[index]['AllowToCancel'] 
                                                  ? Icon(
                                                      Icons.cancel_outlined,
                                                      color: Colors.white,
                                                      size: 15,
                                                    )
                                                  : Icon(
                                                      Icons.podcasts_outlined,
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
          ),
        )),
      ],
    ));
  }
}
