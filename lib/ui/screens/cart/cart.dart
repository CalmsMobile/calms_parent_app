import 'dart:convert';

import '../../../common/app_settings.dart';
import '../../../common/common_api.dart';
import '../../../common/my_shared_pref.dart';
import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/constants.dart';
import '../../../common/widgets/common.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartList = [];
  int selectedBoxIndex = 0;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    initValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMyAppbar(context, "My Cart", []),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: HexColor("#f5f8fd"),
          margin: EdgeInsets.symmetric(horizontal: 0),
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey.shade300,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(left: 15, top: 0),
                            child: Text(
                              "Orders",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          margin: EdgeInsets.only(right: 0, top: 0),
                          child: Row(
                            children: [
                              RichText(
                                maxLines: 2,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "2/2 ITEMS SELECTED",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: appFontFmaily,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                  activeColor: Colors.pinkAccent,
                                  // shape: CircleBorder(),
                                  value: cartList[0]['isSelected'] != null
                                      ? cartList[0]['isSelected']
                                      : false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      cartList[0]['isSelected'] = value!;
                                      selectOrDeselectAll(
                                          cartList[0]['items'], value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: cartList.length > 0
                              ? cartList[0]['items'].length
                              : 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              margin: EdgeInsets.only(bottom: 8),
                              child: Column(children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            margin: EdgeInsets.all(5),
                                            child: Transform.scale(
                                              scale: 0.7,
                                              child: Checkbox(
                                                activeColor: Colors.pinkAccent,
                                                value: cartList[0]['items']
                                                                [index]
                                                            ['isSelected'] !=
                                                        null
                                                    ? cartList[0]['items']
                                                        [index]['isSelected']
                                                    : false,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    cartList[0]['items'][index]
                                                        ['isSelected'] = value!;
                                                    if (!value) {
                                                      cartList[0]
                                                              ['isSelected'] =
                                                          value;
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              child: cartList[0]['items'][index]
                                                          ['image'] !=
                                                      ""
                                                  ? Image.network(
                                                      cartList[0]['items']
                                                          [index]['image'],
                                                      width: 80,
                                                      height: 80,
                                                      fit: BoxFit.cover)
                                                  : Image.asset(
                                                      "assets/images/meal_default.png",
                                                      width: 80,
                                                      height: 80,
                                                    ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: RichText(
                                                    maxLines: 2,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "${cartList[0]['items'][index]['member']['name']}",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  appFontFmaily,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 3, left: 0),
                                                  child: RichText(
                                                    maxLines: 2,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: cartList[0]
                                                                  ['items']
                                                              [index]['name'],
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  appFontFmaily,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 15, bottom: 3),
                                                  child: RichText(
                                                    maxLines: 2,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "${cartList[0]['items'][index]['category']}",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  appFontFmaily,
                                                              color: Colors
                                                                  .black26,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 3),
                                                  child: RichText(
                                                    maxLines: 2,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              "MYR ${double.parse(cartList[0]['items'][index]["price"]).toStringAsFixed(2)}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  appFontFmaily,
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.close,
                                          size: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
           ]),
        ),
      ),
      bottomSheet: isAnySelected()
          ? Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0)),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "4 ITEM SELECTED FOR ORDER",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "RM 54.00",
                        style: TextStyle(fontSize: 14),
                      ),
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
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.pinkAccent, width: 1),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.pinkAccent,
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          color: Colors.pinkAccent,
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Proceed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ]),
            )
          : Container(
              height: 0,
            ),
    );
  }

  bool isAnySelected() {
    bool result = false;
    for (var item in cartList) {
      List localList = item['items'];
      int index =
          localList.indexWhere((element) => element['isSelected'] == true);
      if (index > -1) {
        result = true;
        break;
      }
    }
    return result;
  }

  void selectOrDeselectAll(List myList, bool value) {
    for (var item in myList) {
      item['isSelected'] = value;
    }
  }
var profileData = {};
  void initValues() {
    initData();
    cartList = [
      {
        "title": "meal_order",
        "items": [
          {
            "member": {
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
            },
            "id": "ID001",
            "allowCancel": true,
            "mealOrderType": "Daily",
            "selectionMode": "Multiple",
            "requirePurchaseCutoff": true,
            "name": "Sample Menu Name 1",
            "desc":
                "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
            "category": "Breakfast",
            "mealStyle": "Asian",
            "ratings": 4,
            "merchant_name": "Cafe",
            "merchant_image":
                "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
            "calories": "",
            "price": "18",
            "addon": true,
            "ingredients": [
              {
                "name": "Chicken",
                "image":
                    "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
              },
              {
                "name": "Mix Vege",
                "image":
                    "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=118&ScreenType=12"
              }
            ],
            "date": "2022/05/01",
            "image":
                "https://media.istockphoto.com/photos/bowl-dish-with-brown-rice-cucumber-tomato-green-peas-red-cabbage-picture-id1047798504?s=170667a"
          },
          {
            "member": {
              "name": "Danny",
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
            },
            "id": "ID001",
            "allowCancel": true,
            "mealOrderType": "Daily",
            "selectionMode": "Multiple",
            "requirePurchaseCutoff": true,
            "name": "Sample Menu Name 1",
            "desc":
                "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
            "category": "Lunch",
            "mealStyle": "Asian",
            "ratings": 4,
            "merchant_name": "Cafe",
            "merchant_image":
                "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
            "calories": "",
            "price": "18",
            "addon": true,
            "ingredients": [
              {
                "name": "Chicken",
                "image":
                    "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
              },
              {
                "name": "Mix Vege",
                "image":
                    "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=118&ScreenType=12"
              }
            ],
            "date": "2022/05/01",
            "image":
                "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
          },
        ]
      },
      {
        "title": "bill_pay",
        "items": [
          {
            "member": {
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
            },
            "invoice_no": "TF-X01-11032022-03",
            "memberId": "M0001",
            "name": "James",
            "user_image":
                "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12",
            "class": "Y5C1",
            "title": "Transportation Fee",
            "description":
                "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
            "invoice_amount": "15",
            "paid_to_date": "8",
            "outstanding_amount": "3",
            "penalty_amount": "3",
            "invoice_date": "01-12-2021",
            "installment": false
          },
          {
            "member": {
              "name": "James",
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
            },
            "invoice_no": "TF-X01-11032022-02",
            "memberId": "M0001",
            "name": "James",
            "user_image":
                "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12",
            "class": "Y5C1",
            "title": "Bus Fee",
            "description":
                "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
            "invoice_amount": "200",
            "paid_to_date": "8",
            "outstanding_amount": "3",
            "penalty_amount": "3",
            "invoice_date": "01-12-2021",
            "installment": false
          },
          {
            "member": {
              "name": "Danny",
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
            },
            "invoice_no": "TF-X01-11032022-04",
            "memberId": "M0001",
            "name": "James",
            "user_image":
                "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12",
            "class": "Y5C1",
            "title": "Term Fee",
            "description":
                "A school fee is money that parents pay to schools, aimed at improving the quality of education of learners",
            "invoice_amount": "45",
            "paid_to_date": "8",
            "outstanding_amount": "3",
            "penalty_amount": "3",
            "invoice_date": "01-12-2021",
            "installment": false
          },
        ]
      },
      {
        "title": "donate",
        "items": [
          {
            "member": {
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
            },
            "date": "01-12-2021",
            "description": "Donate",
            "donation_type": "test",
            "amount": "15",
          },
          {
            "member": {
              "name": "James",
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
            },
            "date": "01-12-2021",
            "description": "Donate",
            "donation_type": "Orpanage",
            "amount": "150",
          }
        ]
      },
      {
        "title": "stores",
        "items": [
          {
            "quantity": "4",
            "member": {
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12",
            },
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
              "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=StoreItems/b6fa-e4c2-2021-11-25-11-32-18-810/71-zpNFAyTL._SL1080_.jpg&Default=60&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
              "http://103.6.163.49:2008/FS/StoreItems/4adc-e4c2-2021-11-25-11-32-55-924/student-plastic-id-card-holder-500x500.jpg"
            ],
            "colors": ["White", "Black", "Red", "Blue"],
            "size": ["S", "M", "L", "XL", "XXL"],
            "merchantimage":
                "http://103.6.163.49:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
          },
          {
            "quantity": "1",
            "member": {
              "name": "Danny",
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12",
            },
            "id": "1",
            "category": "Cloths",
            "item_name": "School dress",
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
            "image": [],
            "colors": ["White", "Black", "Red", "Blue"],
            "size": ["S", "M", "L", "XL", "XXL"],
            "merchantimage":
                "http://103.6.163.49:2008/FS/Merchant/1569-e4c2-2021-11-25-10-18-28-567/CALMS_Technologies_Sdn_Bhd_Logo.png"
          }
        ]
      },
      {
        "title": "activities",
        "items": [
          {
            "quantity": "2",
            "member": {
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12",
            },
            "_id": "EDU00001_EVENT_EVNT-1008",
            "receipt_no": "RCPT001-12111",
            "_rev": "15-5f8395a893f523756908f0d48b073a03",
            "createdby": "Daniel Dennis [SYSADMIN001]",
            "modifiedby": "Daniel Dennis [SYSADMIN001]",
            "companyid": "EDU00001",
            "doctype": "EVENT",
            "eventid": "EVNT-1001",
            "quantity_limit": "Unlimtted",
            "available_quantity": "10",
            "title": "School Music Festival 2019",
            "price": "100",
            "description": "Music is life",
            "yeargroup": ["YEAR 4", "YEAR 1", "YEAR 3"],
            "accessgroup": ["R001"],
            "isactive": true,
            "image":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkBZJEywoUSqlJz0gsjE7Tn_72KStEInEN-w&usqp=CAU",
            "startdate": "2019/07/02",
            "enddate": "2019/07/31",
            "modifieddate": "2019/09/22 04:45:04 PM",
            "attachmentlist": [
              {
                "id": "0",
                "type": "application/pdf",
                "name": "slip_AB489665.pdf"
              },
              {"id": "1", "type": "image/png", "name": "dollar-icon.png"}
            ]
          }
        ]
      },
      {
        "title": "mfp",
        "items": [
          {
            "member": {
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
              "image":
                  "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12",
            },
            "date": "01-12-2021",
            "description": "MFP TopUp",
            "topup_via": "PaperCut",
            "amount": "2",
          }
        ]
      }
    ];
  }
  Future<void> initData() async {
    //imgBaseUrl = await MySharedPref().getData(AppSettings.Sp_Img_Base_Url);
    String profile = await MySharedPref().getData(AppSettings.Sp_ProfileData);
    profileData = jsonDecode(profile);
    print(profileData);
    CommonUtil().getCartPageSettings(context,profileData['RefBranchSeqId']);
  }
}
