import 'package:awesome_select/awesome_select.dart';
import 'package:calms_parent/common/HexColor.dart';
import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/constants.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:calms_parent/ui/screens/stores/details/StoreDetails.dart';
import 'package:flutter/material.dart';

class Stores extends StatefulWidget {
  const Stores();

  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  var storeList = [
    {
      "id": "1",
      "category": "Stationery",
      "item_name": "Color Box",
      "inventory_code": "S1011",
      "description":
          "46 PCS Color Set has a lot of fun features to keep your baby engaged. It has 42 pieces It contain 12 water color, 6 sketch color, a sharpner, an eraser, 10 crayons color, 8 oil pastel colors, a glue, a paper clip and a box. Very nice product for your kid It improves creative power of your dear ones. Improves visual skills, creative skills and coordination skills of your child Designed keeping safety of your child on priority basis Always choose Happiesta for your kids Happiness",
      "is_dress": 1,
      "price": "10.00",
      "actual_price": "15.00",
      "discount": "",
      "available_quantity": 50,
      "applicable_group":
          "Year1,Year2,Year3,Year4,Year5,Year6,Year2,Year3,Year4,Year10",
      "image": [
        "http://124.217.235.107:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://124.217.235.107:2008/&StoreageUrl=http://124.217.235.107:2008/FS/",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "colors": ["White", "Black", "Red", "Blue"],
      "size": ["S", "M", "L", "XL", "XXL"],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "2",
      "category": "Stationery",
      "item_name": "Student Plastic ID card For Studnet of the Schools",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "90.00",
      "actual_price": "90",
      "discount": "10",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "3",
      "category": "Stationery",
      "item_name": "Student Plastic ID card",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "1000000000.00",
      "actual_price": "1000000000",
      "discount": "",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "4",
      "category": "Stationery",
      "item_name": "Student Plastic ID card",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "90000000.00",
      "actual_price": "100000000",
      "discount": "45",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "5",
      "category": "Stationery",
      "item_name": "Student Plastic ID card",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "10.00",
      "actual_price": "10",
      "discount": "",
      "available_quantity": 50,
      "applicable_group": "Year1,Year2,Year3,Year4,Year5",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "6",
      "category": "Stationery",
      "item_name": "Student Plastic ID card",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "90.00",
      "actual_price": "100",
      "discount": "10",
      "available_quantity": 50,
      "applicable_group": "Year1,Year2,Year3,Year4,Year5",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "7",
      "category": "Stationery",
      "item_name": "Student Plastic ID card",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "90.00",
      "actual_price": "100",
      "discount": "10",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "8",
      "category": "Stationery",
      "item_name": "Student Plastic ID card",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "10.00",
      "actual_price": "10",
      "discount": "",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "8",
      "category": "Stationery",
      "item_name": "Student Plastic ID card",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": 1,
      "price": "10.00",
      "actual_price": "100",
      "discount": "",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg",
        "http://124.217.235.107:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
      ],
      "colors": ["White", "Black", "Red", "Blue"],
      "size": ["S", "M", "L", "XL", "XXL"],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
    {
      "id": "9",
      "category": "Stationery",
      "item_name": "Color Box",
      "inventory_code": "S1011",
      "description": "student-plastic-id-card-holder-500x500",
      "is_dress": "0",
      "price": "90.00",
      "actual_price": "100",
      "discount": "10",
      "available_quantity": 50,
      "applicable_group": "All",
      "image": [],
      "merchantimage":
          "http://124.217.235.107:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
    },
  ];
  @override
  void initState() {
    _foundStoreList = storeList;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    var results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = storeList;
    } else {
      results = storeList
          .where((user) =>
              user["item_name"] != null &&
              user["item_name"]
                  .toString()
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundStoreList = results;
    });
  }

  bool searchEnable = false;

  int cartCount = 0;

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
  int senderIndex = -1;
  var _foundStoreList = [];
  var sortList = ["Recent First", "Low to High", "High to Low", "Discount"];

  var selectedSortby = "Recent First";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: HexColor("#f5f8fd"),
        titleSpacing: -5,
        title: searchEnable
            ? Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: TextField(
                    autofocus: true,
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            searchEnable = !searchEnable;
                            setState(() {});
                          },
                        ),
                        hintText: 'Search by Inventory code/Item name',
                        border: InputBorder.none),
                  ),
                ),
              )
            : Text(
                "STORES",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
        actions: [
          // Navigate to the Search Screen
          if (!searchEnable)
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
                          openMemberBottomSheet(context, familyList, (index) {
                            Navigator.pop(context);
                            senderIndex = index;
                            setState(() {});
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
          // if (!searchEnable)
          //   IconButton(
          //     onPressed: () {
          //       searchEnable = !searchEnable;
          //       setState(() {});
          //     },
          //     icon: Icon(Icons.search),
          //   ),
          // if (!searchEnable)
          //   IconButton(
          //     onPressed: () {
          //       Navigator.of(context).pushNamed('/FilterPage', arguments: "");
          //     },
          //     icon: Icon(Icons.filter_alt_outlined),
          //   ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/FilterPage', arguments: "");
              },
              child: Container(
                height: 45,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.filter_alt_outlined,
                        size: 18,
                        color: Colors.black54,
                      )),
                      TextSpan(
                        text: " FILTER",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                openSortByBottomSheet(context, sortList, (index1) {
                  selectedSortby = sortList[index1];
                  setState(() {});
                  Navigator.of(context).pop();
                }, selectedSortby);
              },
              child: Container(
                height: 45,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.sort,
                        size: 18,
                        color: Colors.black54,
                      )),
                      TextSpan(
                        text: " SORT BY",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                searchEnable = !searchEnable;
                setState(() {});
              },
              child: Container(
                height: 45,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.search_rounded,
                        size: 18,
                        color: Colors.black54,
                      )),
                      TextSpan(
                        text: " SEARCH",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(

          // color: Color.fromARGB(255, 105, 123, 132),
          child: Column(children: [
        Expanded(
          child: GridView.builder(
            itemCount: _foundStoreList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                moveToDetails(_foundStoreList, index, context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    right: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Hero(
                          tag: "${_foundStoreList[index]['id']}",
                          child: Stack(alignment: Alignment.topLeft, children: [
                            _foundStoreList[index]['image'].length > 0
                                ? Image.network(
                                    _foundStoreList[index]['image'][0],
                                    fit: BoxFit.fill)
                                : Image.asset(
                                    "assets/images/no_image.png",
                                  ),
                            if (double.parse(_foundStoreList[index]
                                        ['actual_price']) -
                                    double.parse(
                                        _foundStoreList[index]['price']) >
                                0)
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.redAccent,
                                        blurRadius: 0.0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Text(
                                    "MYR ${(double.parse(_foundStoreList[index]['actual_price']) - double.parse(_foundStoreList[index]['price'])).toStringAsFixed(2)} OFF",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ),
                          ])),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 4, top: 4, bottom: 4, left: 4),
                                child: Text(
                                  // products is out demo list
                                  _foundStoreList[index]['item_name'],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 2, top: 2, bottom: 2, left: 3),
                                child: Text(
                                  "${_foundStoreList[index]['category']}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: kTextLightColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 2, top: 2, bottom: 5, left: 3),
                                child: RichText(
                                    maxLines: 2,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            "MYR ${_foundStoreList[index]['price']}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      if (double.parse(_foundStoreList[index]
                                                  ['actual_price']) -
                                              double.parse(
                                                  _foundStoreList[index]
                                                      ['price']) >
                                          0)
                                        WidgetSpan(
                                            child: SizedBox(
                                          width: 5,
                                        )),
                                      if (double.parse(_foundStoreList[index]
                                                  ['actual_price']) -
                                              double.parse(
                                                  _foundStoreList[index]
                                                      ['price']) >
                                          0)
                                        TextSpan(
                                          text:
                                              "MYR ${(double.parse(_foundStoreList[index]['actual_price'])).toStringAsFixed(2)}",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationThickness: 3.00,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),

                                      // if (double.parse(_foundStoreList[index]
                                      //             ['actual_price']) -
                                      //         double.parse(_foundStoreList[index]
                                      //             ['price']) >
                                      //     0)
                                      //   TextSpan(
                                      //     text: "40% OFF",
                                      //     style: TextStyle(
                                      //         fontSize: 10,
                                      //         color: Colors.red,
                                      //         fontWeight: FontWeight.bold),
                                      //   ),
                                    ])),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (senderIndex <= -1) {
                              openMemberBottomSheet(context, familyList,
                                  (studentindex) {
                                senderIndex = studentindex;
                                Navigator.of(context).pop();
                                setState(() {});
                                openCartBottomSheet(
                                    context, _foundStoreList[index]);
                              });
                            } else {
                              openCartBottomSheet(
                                  context, _foundStoreList[index]);
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 3),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ])),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void openSortByBottomSheet(
    BuildContext buildContext, var sortList, var callback, var selectedSortby) {
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
                  "SORT BY",
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
                      itemCount: sortList.length,
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
                                title: RichText(
                                  text: TextSpan(
                                    text: "",
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: " ${sortList[index1]}",
                                          style: new TextStyle(
                                              fontWeight: selectedSortby ==
                                                      sortList[index1]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color: selectedSortby ==
                                                      sortList[index1]
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

void openCartBottomSheet(
  BuildContext buildContext,
  var storeInfo,
) {
  var colorsList = storeInfo["colors"] == null ? [] : storeInfo["colors"];
  var sizesList = storeInfo["size"] == null ? [] : storeInfo["size"];

  print(colorsList);

  var selectedColor = "";
  var selectedSize = "";

  showModalBottomSheet(
      context: buildContext,
      builder: (BuildContext context) {
        return BottomSheet(
            enableDrag: true,
            onClosing: () {},
            builder: (BuildContext context) {
              bool b = false;
              return StatefulBuilder(
                builder: (BuildContext context, setState) => Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    AppBar(
                      title: Text(
                        "ADD TO CART",
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
                    if (storeInfo['is_dress'] == 1)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            padding: EdgeInsets.only(top: 15, left: 15),
                            child: Text("Select size")),
                      ),
                    if (storeInfo['is_dress'] == 1)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: sizesList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? 6
                                    : 6,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            childAspectRatio: (3 / 1),
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              selectedSize = sizesList[index];
                              setState(() {});
                            },
                            child: Container(
                              height: 30,
                              width: double.infinity,
                              child: RichText(
                                maxLines: 1,
                                text: TextSpan(
                                  text: "",
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.done_sharp,
                                      color: selectedSize == sizesList[index]
                                          ? Colors.pinkAccent
                                          : Colors.grey,
                                      size: 14,
                                    )),
                                    WidgetSpan(
                                        child: SizedBox(
                                      width: 10,
                                    )),
                                    TextSpan(
                                        text: " ${sizesList[index]}",
                                        style: new TextStyle(
                                            color:
                                                selectedSize == sizesList[index]
                                                    ? Colors.pinkAccent
                                                    : Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (storeInfo['is_dress'] == 1)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            padding: EdgeInsets.only(top: 15, left: 15),
                            child: Text("Select color")),
                      ),
                    if (storeInfo['is_dress'] == 1)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: colorsList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? 6
                                    : 6,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            childAspectRatio: (3 / 1),
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              selectedColor = colorsList[index];
                              print(selectedColor);
                              print(colorsList);
                              setState(() {});
                            },
                            child: Container(
                              height: 30,
                              child: RichText(
                                text: TextSpan(
                                  text: "",
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.done_sharp,
                                      color: selectedColor == colorsList[index]
                                          ? Colors.pinkAccent
                                          : Colors.grey,
                                      size: 14,
                                    )),
                                    WidgetSpan(
                                        child: SizedBox(
                                      width: 10,
                                    )),
                                    TextSpan(
                                        text: " ${colorsList[index]}",
                                        style: new TextStyle(
                                            color: selectedColor ==
                                                    colorsList[index]
                                                ? Colors.pinkAccent
                                                : Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 10),
                                    child: Text("Quantity")),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                ],
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
                          Container(
                              padding: EdgeInsets.only(left: 15, right: 30),
                              child: Text(
                                "MYR ${(selectedQuantity * double.parse(storeInfo['price'])).toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ))
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        MyCustomAlertDialog()
                            .showToast(context, "Item added to cart ");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(1),
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.pinkAccent, width: 1),
                            right:
                                BorderSide(color: Colors.pinkAccent, width: 1),
                            top: BorderSide(color: Colors.pinkAccent, width: 1),
                            left:
                                BorderSide(color: Colors.pinkAccent, width: 1),
                          ),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.pinkAccent,
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.only(
                            top: 20, left: 10, right: 10, bottom: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                              color: Colors.pinkAccent,
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                "DONE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            });
      });
}

getDiscount(discount, totalAmount) {
  print("discount " + discount + " totalAmount " + totalAmount);
  if (discount != "" && totalAmount != "") {
    // 123.45
    var ttl = double.parse(totalAmount);
    var dis = int.parse(discount);
    return (((ttl / 100) * dis)).toString();
  } else {
    return "";
  }
}

void moveToDetails(_foundStoreList, index, context) {
  Navigator.of(context)
      .pushNamed('/StoreDetails', arguments: _foundStoreList[index]);
}
