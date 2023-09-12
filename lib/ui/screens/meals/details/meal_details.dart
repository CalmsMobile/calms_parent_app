import 'package:calms_parent_latest/common/json_responses.dart';
import 'package:calms_parent_latest/common/util/common_funtions.dart';
import 'package:provider/provider.dart';

import '../../../../common/listener/settings_listener.dart';
import '../../cart/cart.dart';
import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '../../../../common/widgets/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class MealDetails extends StatefulWidget {
  final arguments;
  final Function callbackFun;
  const MealDetails(this.arguments, this.callbackFun, {Key? key})
      : super(key: key);

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  var selectedIngi = "";
  SuperTooltip? tooltip;

  var mealInfo;
  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (tooltip != null && tooltip!.isOpen) {
      tooltip!.close();
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mealInfo = widget.arguments['mealInfo'];
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
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: getMyAppbar(context, "Meal details", [Container(
              height: 30,
              //width: 100,
              margin: EdgeInsets.only(right: 10),
              child: Row(children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(widget.arguments['imgBaseUrl'],widget.arguments['CurrencyCode']),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(left: 10),
                        child: ClipOval(
                          child: Material(
                            color: Colors.blue, // Button color
                            child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.shopping_cart_rounded,
                                  color: Colors.white,
                                  size: 18,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Consumer<MySettingsListener>(
                        builder: (context, data, settingsDta) {
                      return Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            data.cartList != []
                                ? data.cartList.length.toString()
                                : "0",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      );
                    })
                  ],
                ),
              ]),
            ),
        ]),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(20.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(alignment: Alignment.topLeft, children: [
                      InkWell(
                        onTap: () {
                          /* Navigator.of(context)
                              .pushNamed('/ViewImage', arguments: {
                            "images": mealInfo['image'] != ""
                                ? [mealInfo['image']]
                                : [],
                            "position": 0
                          }); */
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: mealInfo['ImgPathUrl'] != null &&
                                    mealInfo['ImgPathUrl'] != ""
                                ? Image.network(
                                    CommonFunctions.getMealImageUrl(
                                        widget.arguments['imgBaseUrl'],
                                        mealInfo['ImgPathUrl']),
                                    width: double.infinity,
                                    height: 300,
                                    fit: BoxFit.cover)
                                : Image.asset(
                                    "assets/images/no_image.png",
                                    height: 300,
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /* Row(
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
                            ), */
                            if (widget.arguments['ingredients'].length > 0)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 100,
                                      child: GridView.builder(
                                        itemCount: widget
                                            .arguments['ingredients'].length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: widget
                                              .arguments['ingredients'].length,
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
                                                        widget.arguments[
                                                                'ingredients']
                                                            [index]['Name']
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
                                                                widget.arguments[
                                                                            'ingredients']
                                                                        [index]
                                                                    ['Name']
                                                            ? widget.arguments[
                                                                    'ingredients']
                                                                [index]['Name']
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
                                            /* InkWell(
                                              onTap: () {
                                                selectedIngi =
                                                    widget.arguments['ingredients']
                                                        [index]['Name'];
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
                                                widget.arguments['ingredients'][index]
                                                    ['Icon'],
                                                width: 35,
                                                height: 35,
                                                fit: BoxFit.cover,
                                              ),
                                            ), */
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
                                      mealInfo['Name'],
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
                                            '${widget.arguments['CurrencyCode']} ${mealInfo["SellingPrice"].toStringAsFixed(2)}  ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: mealInfo['Rating'] != null
                                        ? Row(
                                            children: [
                                              Icon(
                                                mealInfo['Rating'] > 0
                                                    ? Icons.star
                                                    : Icons
                                                        .star_border_outlined,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                mealInfo['Rating'] > 1
                                                    ? Icons.star
                                                    : Icons
                                                        .star_border_outlined,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                mealInfo['Rating'] > 2
                                                    ? Icons.star
                                                    : Icons
                                                        .star_border_outlined,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                mealInfo['Rating'] > 3
                                                    ? Icons.star
                                                    : Icons
                                                        .star_border_outlined,
                                                color: Colors.orange,
                                              ),
                                              Icon(
                                                mealInfo['Rating'] > 4
                                                    ? Icons.star
                                                    : Icons
                                                        .star_border_outlined,
                                                color: Colors.orange,
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Icon(Icons.star_border_outlined,
                                                  color: Colors.orangeAccent),
                                              Icon(Icons.star_border_outlined,
                                                  color: Colors.orangeAccent),
                                              Icon(Icons.star_border_outlined,
                                                  color: Colors.orangeAccent),
                                              Icon(Icons.star_border_outlined,
                                                  color: Colors.orangeAccent),
                                              Icon(Icons.star_border_outlined,
                                                  color: Colors.orangeAccent),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            if (widget.arguments['showCart'])
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  margin: EdgeInsets.only(right: 10),
                                  child: ClipOval(
                                    child: Material(
                                      color: mealInfo['addedToCart']
                                          ? Colors.red
                                          : Colors.blue, // Button color
                                      child: InkWell(
                                        onTap: () async {
                                          mealInfo['addedToCart']
                                              ? onCartClick(true)
                                              : onCartClick(false);
                                        },
                                        child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: mealInfo['addedToCart']
                                                ? Icon(
                                                    Icons.delete_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .add_shopping_cart_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            /* InkWell(
                              onTap: () {
                                MyCustomAlertDialog()
                                    .showToast(context, "Item added to cart ");
                                setState(() {});
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(right: 15, bottom: 5),
                                child: Image.asset(
                                    "assets/images/ico_cart_white.png"),
                              ),
                            ) */
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Image.network(CommonFunctions.getMealImageUrl(
                          widget.arguments['imgBaseUrl'],
                          mealInfo['MerchantImg'])),
                      title: Text(mealInfo['MerchantShortName']),
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
                          mealInfo['Desc'],
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
                          Text(mealInfo['ItemStyle'],
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
                          Text(mealInfo['ItemTypeName'],
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
                                  DateTime.parse(widget.arguments['ViewDate'])),
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

  void onCartClick(isDelete) {
    print("call back index ${mealInfo.toString()}");
    isDelete
        ? widget.callbackFun(mealInfo, widget.arguments['mealIndex'], true)
        : widget.callbackFun(mealInfo, widget.arguments['mealIndex'], false);
    setState(() {
      if (isDelete)
        mealInfo['addedToCart'] = false;
      else
        mealInfo['addedToCart'] = true;
    });
  }
}
