import 'package:calms_parent/common/date_util.dart';
import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class MealOrder extends StatefulWidget {
  const MealOrder();

  @override
  _MealOrderState createState() => _MealOrderState();
}

class _MealOrderState extends State<MealOrder> {
  var dateList = [];
  List mealList = [
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "Breakfast",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/01",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Briyani",
      "desc": "",
      "category": "Lunch",
      "mealStyle": "Indian",
      "ratings": 4,
      "calories": "",
      "price": "120",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/01",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Dosa",
      "desc": "",
      "category": "Dinner",
      "mealStyle": "Indian",
      "ratings": 4,
      "calories": "",
      "price": "10",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/01",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/02",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/03",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/04",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/05",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/06",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/07",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/08",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/09",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/10",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/11",
      "image": ""
    },
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 4,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/12",
      "image": ""
    }
  ];

  @override
  void initState() {
    super.initState();
    initDates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Order"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios),
              ),
              Container(
                height: 50,
                width: 300,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: dateList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        // color: Colors.grey,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Text(
                                "${DateUtil().getDaysOfDate(dateList[index]["date"])["dayString"]}"),
                            Text(
                                "${DateUtil().getDaysOfDate(dateList[index]["date"])["day"]}"),
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.green, width: 3.0),
                  ),
                ),
                child: Tab(
                  text: "Breakfast",
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white, width: 3.0),
                    ),
                  ),
                  child: Tab(text: "Lunch")),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white, width: 3.0),
                    ),
                  ),
                  child: Tab(text: "Dinner")),
            ],
          ),
          Container(
            height: 480,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: mealList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                      child: new Divider(
                        height: 0.2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        child: mealList[index] != null &&
                                mealList[index]['image'] != ""
                            ? Image.network(mealList[index]['image'],
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover)
                            : Image.asset("assets/images/meal_default.png"),
                      ),
                      title: Text(
                        mealList[index]['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          mealList[index]['addon'] == true
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  margin: EdgeInsets.only(bottom: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    "Addon",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                )
                              : Text(
                                  mealList[index]['mealStyle'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                          SizedBox(
                            height: 5,
                          ),

                          RichText(
                            text: new TextSpan(
                              text: '',
                              style: new TextStyle(
                                fontSize: 12.0,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text:
                                        'MYR ${double.parse(mealList[index]["price"]).toStringAsFixed(2)}',
                                    style: new TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                              ],
                            ),
                          ),
                          // Text(storeList[index]['invoice_date'])
                        ],
                      ),
                      trailing: SizedBox(
                        height: 25,
                        width: 25,
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent, // Button color
                            child: InkWell(
                              splashColor: Colors.red, // Splash color
                              onTap: () {
                                setState(() {
                                  mealList[index]['sQty'] = 1;
                                });
                              },
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () => {
                        // Navigator.of(context).pushNamed('/ActivityDetails',
                        //     arguments: _foundActivities[index])
                      },
                    )
                  ]);
                }),
          )
        ]),
      ),
    );
  }

  void initDates() {
    dateList = [];
    for (var item in mealList) {
      int index =
          dateList.indexWhere((element) => item['date'] == element['date']);
      if (index <= -1) {
        dateList.add(item);
      }
    }
  }
}
