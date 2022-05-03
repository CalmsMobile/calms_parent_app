import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class MealOrder extends StatefulWidget {
  const MealOrder();

  @override
  _MealOrderState createState() => _MealOrderState();
}

class _MealOrderState extends State<MealOrder> {
  var mealList = [
    {
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "",
      "desc": "",
      "category": "",
      "mealStyle": "",
      "ratings": "",
      "calories": "",
      "price": "",
      "ingredients": ""
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Order"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(children: [
          Container(
            height: 50,
            width: double.infinity,
            child: WheelChooser.custom(
              horizontal: true,
              onValueChanged: (a) => print(a),
              children: <Widget>[
                Text("data1"),
                Text("data2"),
                Text("data3"),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
