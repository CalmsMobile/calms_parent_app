import '/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealPager extends StatelessWidget {
  const MealPager(this.mealList_,this.CurrencyCode, this.callbackFun) : super();

  final mealList_;
  final CurrencyCode;
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
                // moveToDetails(_foundStoreList, index, context);
                Navigator.of(context)
                    .pushNamed('/MealDetails', arguments: mealList_[index]);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                borderOnForeground: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: mealList_[index]['ImgPathUrl'] != null &&
                              mealList_[index]['ImgPathUrl'] != ""
                          ? Image.network(mealList_[index]['ImgPathUrl'],
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.cover)
                          : Image.asset("assets/images/meal_default.png",
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.cover),
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
                                    fontSize: 10,
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
                        InkWell(
                          onTap: () {
                            callbackFun(index);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right: 15, bottom: 5),
                            child:
                                Image.asset("assets/images/ico_cart_white.png"),
                          ),
                        )
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
