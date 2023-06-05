import '/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealPager extends StatelessWidget {
  const MealPager(this.mealList_, this.callbackFun) : super();

  final mealList_;
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
                    Container(
                      height: 100,
                      child: mealList_[index]['image'] != null &&
                              mealList_[index]['image'] != ""
                          ? Image.network(mealList_[index]['image'])
                          : Image.asset("assets/images/meal_default.png"),
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
                              child: 
                            Text(
                              // products is out demo list
                              mealList_[index]['name'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),),
                            Row(
                              children: [
                                Icon(
                                  mealList_[index]['ratings'] > 0
                                      ? Icons.star
                                      : Icons.star_border_outlined,
                                  color: Colors.orangeAccent,
                                  size: 14,
                                ),
                                Icon(
                                  mealList_[index]['ratings'] > 1
                                      ? Icons.star
                                      : Icons.star_border_outlined,
                                  color: Colors.orangeAccent,
                                  size: 14,
                                ),
                                Icon(
                                  mealList_[index]['ratings'] > 2
                                      ? Icons.star
                                      : Icons.star_border_outlined,
                                  color: Colors.orangeAccent,
                                  size: 14,
                                ),
                                Icon(
                                  mealList_[index]['ratings'] > 3
                                      ? Icons.star
                                      : Icons.star_border_outlined,
                                  color: Colors.orangeAccent,
                                  size: 14,
                                ),
                                Icon(
                                  mealList_[index]['ratings'] > 4
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
                                    "MYR ${double.parse(mealList_[index]['price']).toStringAsFixed(2)}",
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
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                )),
                            child: Text("${mealList_[index]['mealStyle']}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal)),
                          ),
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
