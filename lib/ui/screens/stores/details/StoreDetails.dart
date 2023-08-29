import 'package:awesome_select/awesome_select.dart';
import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '../../../../common/widgets/common.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails();

  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

int currentPos = 0;
String selectedColor = "";
String selectedSize = "";
int selectedQuantity = 1;
int cartCount = 0;

class _StoreDetailsState extends State<StoreDetails> {
  int senderIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print("Back To old Screen");
    super.dispose();
    currentPos = 0;
    selectedColor = "";
    selectedSize = "";
    selectedQuantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    void onChangeColor(String value) {
      print("Selected value :" + value);
      setState(() {
        selectedColor = value;
      });
    }

    void onChangeSize(String value) {
      print("Selected value :" + value);
      setState(() {
        selectedSize = value;
      });
    }

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
    final storeInfo = ModalRoute.of(context)!.settings.arguments as Map;
    print("passData: " + storeInfo["is_dress"].toString());
    var colors = storeInfo["colors"] == null ? [] : storeInfo["colors"];
    var sizeList = storeInfo["size"] == null ? [] : storeInfo["size"];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: HexColor("#f5f8fd"),
        titleSpacing: -4,
        title: Text(
          "Store Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
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
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(familyList[senderIndex]['image']),
                        radius: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: Alignment.topLeft, children: [
                storeInfo["image"].length > 0
                    ? CarouselSlider(
                        options: CarouselOptions(
                            height: 400.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 5.0,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.7,
                            onPageChanged: (index, reason) {
                              currentPos = index;
                            }),
                        items: storeInfo["image"]
                            .map<Widget>((e) => Container(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/ViewImage', arguments: {
                                        "images": storeInfo["image"],
                                        "position": currentPos
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: NetworkImage(e),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/ViewImage',
                              arguments: {"images": []});
                        },
                        child: Container(
                          height: 400.0,
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("assets/images/no_image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                if (double.parse(storeInfo['actual_price']) -
                        double.parse(storeInfo['price']) >
                    0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Text(
                            "MYR ${(double.parse(storeInfo['actual_price']) - double.parse(storeInfo['price']))} OFF",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: storeInfo["image"].map<Widget>((url) {
                  int index = storeInfo["image"].indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPos == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(
                      left: storeInfo["is_dress"].toString() == "0" ? 20 : 25,
                      top: 10.0,
                      bottom: 0.0,
                      right: 20),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            storeInfo["item_name"],
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      if (storeInfo["is_dress"].toString() == "0" ||
                          (selectedSize != "" && selectedColor != ""))
                        InkWell(
                          onTap: () {
                            cartCount = cartCount + 1;
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
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Image.asset("assets/images/cart_round.png"),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              if (storeInfo["is_dress"].toString() == "1" &&
                  storeInfo["colors"].length > 0)
                Container(
                  height: 40,
                  margin:
                      EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
                  padding: EdgeInsets.only(bottom: 0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      openSortByBottomSheet(context, "Color", colors, (index1) {
                        selectedColor = colors[index1];
                        setState(() {});
                        Navigator.of(context).pop();
                      }, selectedColor);
                    },
                    leading: Container(
                      width: 20,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.color_lens,
                        size: 25,
                      ),
                    ),
                    horizontalTitleGap: -10,
                    title: Text(
                      "Color",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              "${selectedColor == "" ? "Select one" : selectedColor}"),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                ),
              if (storeInfo["is_dress"].toString() == "1" &&
                  storeInfo["size"].length > 0 &&
                  selectedColor != "")
                Container(
                  height: 40,
                  margin:
                      EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
                  padding: EdgeInsets.only(bottom: 0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      openSortByBottomSheet(context, "Size", sizeList,
                          (index1) {
                        selectedSize = sizeList[index1];
                        setState(() {});
                        Navigator.of(context).pop();
                      }, selectedSize);
                    },
                    leading: Container(
                      width: 20,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.format_size,
                        size: 25,
                      ),
                    ),
                    horizontalTitleGap: -10,
                    title: Text(
                      "Size",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              "${selectedSize == "" ? "Select one" : selectedSize}"),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                ),
              if (storeInfo["is_dress"].toString() == "0" ||
                  (selectedSize != "" && selectedColor != ""))
                Container(
                  margin: EdgeInsets.only(
                      left: storeInfo["is_dress"].toString() == "0" ? 20 : 25,
                      right: 25,
                      top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RichText(
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                                  'MYR ${double.parse(storeInfo["price"]).toStringAsFixed(2)}  ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: [
                                if (double.parse(storeInfo["actual_price"]) -
                                        double.parse(storeInfo["price"]) >
                                    0)
                                  WidgetSpan(
                                      child: Text(
                                    'MYR ${double.parse(storeInfo["actual_price"]).toStringAsFixed(2)}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 4,
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )),
                              ]),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: DecoratedBox(
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 2),
                                      right: BorderSide(
                                          color: Colors.black, width: 2),
                                      top: BorderSide(
                                          color: Colors.black, width: 2),
                                      left: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      if (selectedQuantity > 0) {
                                        selectedQuantity -= 1;
                                      }
                                      setState(() {});
                                    },
                                    child: Text(
                                      "-",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: 25,
                                child: Text(
                                  selectedQuantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: DecoratedBox(
                                    decoration: new BoxDecoration(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      color: Colors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black, width: 2),
                                        right: BorderSide(
                                            color: Colors.black, width: 2),
                                        top: BorderSide(
                                            color: Colors.black, width: 2),
                                        left: BorderSide(
                                            color: Colors.black, width: 2),
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        selectedQuantity += 1;
                                        setState(() {});
                                      },
                                      child: Text(
                                        "+",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                margin: EdgeInsets.only(
                    top: storeInfo["is_dress"].toString() == "1" &&
                            storeInfo["size"].length > 0 &&
                            selectedColor == ""
                        ? 15
                        : 15,
                    left: 25,
                    right: 25,
                    bottom: 0),
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      storeInfo["category"],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Item code",
                    ),
                    Text(
                      storeInfo["inventory_code"],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
                padding: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Applicable year",
                    ),
                    Flexible(
                      child: Text(
                        storeInfo["applicable_group"],
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin:
                      EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 0),
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Item Description",
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, top: 0, bottom: 10.0),
                  child: Text(storeInfo["description"]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

getMyColors(List<String> list) {
  List<S2Choice<String>> categories = [];

  for (var i = 0; i < list.length; i++) {
    print(list[i]);
    categories.add(
      S2Choice<String>(value: list[i], title: list[i]),
    );
  }

  print(categories);

  return categories;
}

getMyCats(List<String> list) {
  List<S2Choice<String>> categories = [];

  for (var item in list) {
    print(item);
    categories.add(
      S2Choice<String>(value: item, title: item),
    );
  }

  print(categories);

  return categories;
}

void openSortByBottomSheet(BuildContext buildContext, var titleText,
    var displayList, var callback, var selectedItem) {
  showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                title: Text(
                  titleText,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                elevation: 1,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.close_sharp, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: displayList.length,
                      itemBuilder: (BuildContext context, int index1) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: ListTile(
                                horizontalTitleGap: 2,
                                onTap: () {
                                  callback(index1);
                                },
                                leading: Icon(
                                  Icons.done_sharp,
                                  color: selectedItem == displayList[index1]
                                      ? Colors.pinkAccent
                                      : Colors.grey,
                                  size: 18,
                                ),
                                title: RichText(
                                  text: TextSpan(
                                    text: "",
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: " ${displayList[index1]}",
                                          style: new TextStyle(
                                              fontWeight: selectedItem ==
                                                      displayList[index1]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: selectedItem ==
                                                      displayList[index1]
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      });
}

void openColorsBottomSheet(BuildContext buildContext, colors, onChangeColor) {
  showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: colors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    new Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      title: new Text(colors[index]),
                      onTap: () {
                        onChangeColor(colors[index]);
                        Navigator.pop(context);
                      },
                    ),
                  ]);
                })
          ],
        );
      });
}

void openSizeBottomSheet(BuildContext buildContext, sizeList, onChangeSize) {
  showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: sizeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    new Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      title: new Text(sizeList[index]),
                      onTap: () {
                        onChangeSize(sizeList[index]);
                        Navigator.pop(context);
                      },
                    ),
                  ]);
                })
          ],
        );
      });
}
