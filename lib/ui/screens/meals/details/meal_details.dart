import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/widgets/select_member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({Key? key}) : super(key: key);

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  List<Map> familyList = [
    {
      "name": "HAZIM",
      "category": "STUDENT",
      "memberId": "M1003",
      "email": "",
      "balance": "108",
      "familtid": "FMY0001",
      "relationship": "",
      "grade": "Grade1",
      "year": "Year1",
      "class": "Class1",
      "contact": "0123467589",
      "desc": "Member account does not exist in MFP software",
      "image": "https://randomuser.me/api/portraits/men/10.jpg"
    },
    {
      "name": "MARIE LIM",
      "category": "STUDENT",
      "memberId": "M1004",
      "email": "",
      "balance": "0",
      "familtid": "FMY0001",
      "relationship": "",
      "grade": "Grade2",
      "year": "Year2",
      "class": "Class2",
      "contact": "",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/13.jpg"
    },
    {
      "name": "Danny",
      "category": "STAFF",
      "memberId": "M1005",
      "email": "",
      "balance": "30.00",
      "familtid": "FMY0001",
      "relationship": "",
      "grade": "",
      "year": "",
      "class": "",
      "department": "Sales Dept",
      "job_title": "Assistant Sales Manager",
      "contact": "",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/14.jpg"
    },
  ];
  int senderIndex = 2;
  var selectedIngi = "";
  SuperTooltip? tooltip;
  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (tooltip != null && tooltip!.isOpen) {
      tooltip!.close();
      return false;
    }
    return true;
  }

  void onTapIngi(textToShow, BuildContext childContext) {
    print(textToShow);
    if (tooltip != null && tooltip!.isOpen) {
      tooltip!.close();
      return;
    }
    tooltip = SuperTooltip(
      popupDirection: TooltipDirection.up,
      content: new Material(
          child: Text(
        "$textToShow",
      )),
    );

    tooltip?.show(childContext);
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> mealInfo =
        ModalRoute.of(context)?.settings.arguments as Map;
    print(mealInfo);

    print(mealInfo['ingredients'].length);
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: getMyAppbar("Meal details", [
          if (familyList.length > 0 && senderIndex > -1)
            Container(
              height: 30,
              width: 140,
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Flexible(
                    child: ListTile(
                      horizontalTitleGap: 2,
                      contentPadding: EdgeInsets.zero,
                      onTap: () => {
                        openMemberBottomSheet(context, familyList, null,
                            (index) {
                          print(index);
                          Navigator.pop(context);
                          setState(() {
                            senderIndex = index;
                          });
                        })
                      },
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            familyList[senderIndex]['name'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            familyList[senderIndex]['memberId'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: FadeInImage(
                            image:
                                NetworkImage(familyList[senderIndex]['image']),
                            placeholder: AssetImage("assets/images/user.png"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/user.png',
                                  fit: BoxFit.fitWidth);
                            },
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ]),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(alignment: Alignment.topLeft, children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/ViewImage', arguments: {
                            "images": mealInfo['image'] != ""
                                ? [mealInfo['image']]
                                : [],
                            "position": 0
                          });
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            child: mealInfo['image'] != null &&
                                    mealInfo['image'] != ""
                                ? Image.network(mealInfo['image'],
                                    width: double.infinity,
                                    height: 425,
                                    fit: BoxFit.cover)
                                : Image.asset(
                                    "assets/images/no_image.png",
                                    height: 425,
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        height: 425,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  padding: EdgeInsets.all(5),
                                  child: Image.network(
                                    "${'http://103.6.163.49:2008/Library/Images/HealthyRating/' + mealInfo['ratings'].toString() + '.png'}",
                                    fit: BoxFit.cover,
                                    height: 20,
                                  ),
                                ),
                                if (mealInfo['addon'])
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent,
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Colors.deepOrangeAccent,
                                          blurRadius: 0.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: Text("Add-on",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                              ],
                            ),
                            if (mealInfo['ingredients'].length > 0)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 100,
                                      child: GridView.builder(
                                        itemCount:
                                            mealInfo['ingredients'].length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              mealInfo['ingredients'].length,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 0,
                                        ),
                                        itemBuilder: (context1, index) =>
                                            Container(
                                          width: 100,
                                          height: 100,
                                          child: Column(children: [
                                            Flexible(
                                              child: Container(
                                                decoration: selectedIngi ==
                                                        mealInfo['ingredients']
                                                            [index]['name']
                                                    ? BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 2))
                                                    : BoxDecoration(),
                                                child: Center(
                                                  child: Wrap(
                                                    children: [
                                                      Text(
                                                        selectedIngi ==
                                                                mealInfo['ingredients']
                                                                        [index]
                                                                    ['name']
                                                            ? mealInfo[
                                                                    'ingredients']
                                                                [index]['name']
                                                            : "",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                selectedIngi =
                                                    mealInfo['ingredients']
                                                        [index]['name'];
                                                setState(() {});
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 2500),
                                                    () {
                                                  setState(() {
                                                    selectedIngi = "";
                                                  });
                                                });
                                              },
                                              child: Image.network(
                                                mealInfo['ingredients'][index]
                                                    ['image'],
                                                width: 35,
                                                height: 35,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      )
                    ]),
                    Container(
                      decoration: BoxDecoration(
                          color: HexColor("#f0f6f4"),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20.0,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      padding: EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 3),
                                    child: Text(
                                      mealInfo['name'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 3, top: 5),
                                    child: RichText(
                                      maxLines: 2,
                                      text: TextSpan(
                                        text:
                                            'MYR ${double.parse(mealInfo["price"]).toStringAsFixed(2)}  ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          mealInfo['ratings'] > 0
                                              ? Icons.star
                                              : Icons.star_border_outlined,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          mealInfo['ratings'] > 1
                                              ? Icons.star
                                              : Icons.star_border_outlined,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          mealInfo['ratings'] > 2
                                              ? Icons.star
                                              : Icons.star_border_outlined,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          mealInfo['ratings'] > 3
                                              ? Icons.star
                                              : Icons.star_border_outlined,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          mealInfo['ratings'] > 4
                                              ? Icons.star
                                              : Icons.star_border_outlined,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                MyCustomAlertDialog()
                                    .showToast(context, "Item added to cart ");
                                setState(() {});
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.only(left: 3),
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                child:
                                    Image.asset("assets/images/cart_round.png"),
                              ),
                            )
                          ]),
                    ),

                    // Container(
                    //   margin: EdgeInsets.only(left: 15, top: 5),
                    //   child: RichText(
                    //     maxLines: 2,
                    //     text: TextSpan(
                    //         text: 'Item style ',
                    //         style: TextStyle(
                    //             fontSize: 12,
                    //             color: Colors.black,
                    //             fontWeight: FontWeight.bold),
                    //         children: [
                    //           WidgetSpan(
                    //               child: Text(
                    //             mealInfo['mealStyle'],
                    //             style: TextStyle(
                    //                 fontSize: 12,
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.normal),
                    //           ))
                    //         ]),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Image.network(mealInfo['merchant_image']),
                      title: Text(mealInfo['merchant_name']),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 15.0, top: 0.0, bottom: 5.0),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
                        child: Text(
                          mealInfo['desc'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Item style",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(mealInfo['mealStyle'],
                              style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 25, right: 25, bottom: 0),
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(mealInfo['category'],
                              style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 25, right: 25, bottom: 0),
                      height: 1,
                      color: Colors.grey.shade300,
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Calorie",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text("400kcal", style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 25, right: 25, bottom: 0),
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Meal Date",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                              DateFormat('dd-MMM-yyyy').format(
                                  DateFormat('yyyy/MM/dd')
                                      .parse(mealInfo['date'])),
                              style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 25, right: 25, bottom: 0),
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
