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
              margin: EdgeInsets.only(bottom: 0, left: 10, right: 10),
              child: GridView.builder(
                itemCount: mealList_.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // moveToDetails(_foundStoreList, index, context);
                    Navigator.of(context)
                        .pushNamed('/MealDetails', arguments: mealList_[index]);
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Hero(
                              tag: "${mealList_[index]['id']}",
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: mealList_[index]['image'] !=
                                                  null &&
                                              mealList_[index]['image'] != ""
                                          ? Image.network(
                                              mealList_[index]['image'],
                                              fit: BoxFit.cover,
                                              height: 200,
                                            )
                                          : Image.asset(
                                              "assets/images/meal_default.png",
                                              height: 200,
                                            ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    new BoxShadow(
                                                      color: Colors.white,
                                                      blurRadius: 3.0,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              padding: EdgeInsets.all(5),
                                              child: Image.network(
                                                "${'http://124.217.235.107:2008/Library/Images/HealthyRating/' + mealList_[index]['ratings'].toString() + '.png'}",
                                                fit: BoxFit.cover,
                                                height: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: 110,
                                        width: 165,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              new BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 20.0,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            )),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4,
                                                          top: 6,
                                                          bottom: 4,
                                                          left: 8),
                                                  child: Text(
                                                    // products is out demo list
                                                    mealList_[index]['name'],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: kTextColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4,
                                                          top: 4,
                                                          bottom: 4,
                                                          left: 6),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        mealList_[index][
                                                                    'ratings'] >
                                                                0
                                                            ? Icons.star
                                                            : Icons
                                                                .star_border_outlined,
                                                        color:
                                                            Colors.orangeAccent,
                                                        size: 14,
                                                      ),
                                                      Icon(
                                                        mealList_[index][
                                                                    'ratings'] >
                                                                1
                                                            ? Icons.star
                                                            : Icons
                                                                .star_border_outlined,
                                                        color:
                                                            Colors.orangeAccent,
                                                        size: 14,
                                                      ),
                                                      Icon(
                                                        mealList_[index][
                                                                    'ratings'] >
                                                                2
                                                            ? Icons.star
                                                            : Icons
                                                                .star_border_outlined,
                                                        color:
                                                            Colors.orangeAccent,
                                                        size: 14,
                                                      ),
                                                      Icon(
                                                        mealList_[index][
                                                                    'ratings'] >
                                                                3
                                                            ? Icons.star
                                                            : Icons
                                                                .star_border_outlined,
                                                        color:
                                                            Colors.orangeAccent,
                                                        size: 14,
                                                      ),
                                                      Icon(
                                                        mealList_[index][
                                                                    'ratings'] >
                                                                4
                                                            ? Icons.star
                                                            : Icons
                                                                .star_border_outlined,
                                                        color:
                                                            Colors.orangeAccent,
                                                        size: 14,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 2,
                                                      top: 2,
                                                      bottom: 5,
                                                      left: 8),
                                                  child: RichText(
                                                      maxLines: 2,
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                          text:
                                                              "MYR ${double.parse(mealList_[index]['price']).toStringAsFixed(2)}",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  appFontFmaily,
                                                              color: Colors
                                                                  .orangeAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ])),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: 160,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 2,
                                                                  top: 2,
                                                                  bottom: 5,
                                                                  left: 5),
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 6,
                                                                    horizontal:
                                                                        15),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .pink
                                                                        .shade100,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          20),
                                                                    )),
                                                            child: Text(
                                                                "${mealList_[index]['mealStyle']}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .pink,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            callbackFun(index);
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 3),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    3),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2)),
                                                            child: Image.asset(
                                                                "assets/images/cart_round.png"),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ],
    ));
  }
}
