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
int selectedQuantity = 0;

class _StoreDetailsState extends State<StoreDetails> {
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
    selectedQuantity = 0;
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

    final storeInfo = ModalRoute.of(context)!.settings.arguments as Map;
    print("passData: " + storeInfo["is_dress"].toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Store Details"),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 5.0,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.7,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // currentPos = index;
                          });
                        }),
                    items: storeInfo["image"]
                        .map<Widget>((e) => Container(
                              child: Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(e),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      color: Colors.grey,
                      child: (storeInfo['merchantimage'] != null &&
                              storeInfo['merchantimage'] != "")
                          ? Image.network(storeInfo['merchantimage'],
                              // width: 300,
                              height: 50,
                              fit: BoxFit.fill)
                          : Image.asset(
                              "images/user.png",
                              height: 50,
                            ),
                    ),
                  ),
                ],
              ),
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
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  width: double.infinity,
                  color: Colors.white,
                  child: Text(
                    storeInfo["item_name"],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MYR ${double.parse(storeInfo["price"]).toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Container(
                            child: SizedBox(
                              height: 30,
                              width: 45,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      topLeft: Radius.circular(5)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (selectedQuantity > 0) {
                                        selectedQuantity -= 1;
                                      }
                                    });
                                  },
                                  iconSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 45,
                              child: Text(
                                selectedQuantity.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Container(
                            child: SizedBox(
                              height: 30,
                              width: 45,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    selectedQuantity += 1;
                                  },
                                  iconSize: 15,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    "DESCRIPTION",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    storeInfo["description"],
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
              storeInfo["is_dress"].toString() == "1"
                  ? Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                width: double.infinity,
                                color: Colors.blue,
                                child: Text(
                                  "SELECT COLOR",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ),
                          new Divider(
                            height: 0.1,
                          ),
                          Container(
                            child: (storeInfo["is_dress"].toString() == "1")
                                ? ListTile(
                                    onTap: () => {
                                      openColorsBottomSheet(context,
                                          storeInfo["colors"], onChangeColor)
                                    },
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedColor == ""
                                              ? "Select Color"
                                              : selectedColor,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    trailing: Container(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 38,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          )
                        ],
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
              storeInfo["is_dress"].toString() == "1"
                  ? Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                width: double.infinity,
                                color: Colors.blue,
                                child: Text(
                                  "SELECT SIZE",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ),
                          new Divider(
                            height: 0.1,
                          ),
                          Container(
                            child: (storeInfo["is_dress"].toString() == "1")
                                ? ListTile(
                                    onTap: () => {
                                      openSizeBottomSheet(context,
                                          storeInfo["size"], onChangeSize)
                                    },
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedSize == ""
                                              ? "Select Size"
                                              : selectedSize,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    trailing: Container(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 38,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          )
                        ],
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ADD TO CART",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                  height: 25,
                  width: 25,
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent, // Button color
                      child: InkWell(
                        splashColor: Colors.red, // Splash color
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
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
