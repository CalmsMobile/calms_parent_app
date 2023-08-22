import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../../common/util/common_funtions.dart';
import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/constants.dart';
import '/common/date_util.dart';
import '/common/json_responses.dart';
import '/common/widgets/select_member.dart';
import '/ui/screens/activities/Activities.dart';
import '/ui/screens/meals/meal_pager.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MealOrder extends StatefulWidget {
  const MealOrder();

  @override
  _MealOrderState createState() => _MealOrderState();
}

class _MealOrderState extends State<MealOrder> {
  var dateList = [];
  List packageList = [];
  List mealList = [
    {
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken1",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
        {
          "name": "Mix Vege1",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=118&ScreenType=12"
        },
        {
          "name": "Potato1",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken2",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/01",
      "image":
          "http://103.6.163.49:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID002",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 2",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Lunch",
      "mealStyle": "Indian",
      "ratings": 2,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "120",
      "addon": true,
      "ingredients": [],
      "date": "2022/05/01",
      "image":
          "http://103.6.163.49:2008/FS/Meals/ResizeImg/9882-e4c2-2021-11-25-11-24-10-477/Rolled%20flour%20tortilla%20filled%20with%20marinated%20grilled%20chicken%20capsicum%20onion%20lettuce%20and%20fries.jpg"
    },
    {
      "id": "ID003",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Dosa",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Dinner",
      "mealStyle": "Indian",
      "ratings": 3,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "10",
      "addon": false,
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/01",
      "image":
          "http://103.6.163.49:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID004",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Lunch",
      "mealStyle": "Asian",
      "ratings": 1,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": [],
      "date": "2022/05/02",
      "image":
          "http://103.6.163.49:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID005",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Breakfast",
      "mealStyle": "Asian",
      "ratings": 5,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "18",
      "addon": false,
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/03",
      "image":
          "http://103.6.163.49:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID0055",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 2,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "Lunch",
      "price": "18",
      "addon": true,
      "ingredients": [],
      "date": "2022/05/04",
      "image": ""
    },
    {
      "id": "ID006",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Breakfast",
      "mealStyle": "Asian",
      "ratings": 3,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "18",
      "addon": false,
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/05",
      "image":
          "http://103.6.163.49:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID007",
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/06",
      "image": ""
    },
    {
      "id": "ID008",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Lunch",
      "mealStyle": "Asian",
      "ratings": 5,
      "merchant_name": "Cafe1",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "18",
      "addon": false,
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/07",
      "image": ""
    },
    {
      "id": "ID009",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Breakfast",
      "mealStyle": "Asian",
      "ratings": 1,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": [],
      "date": "2022/05/08",
      "image": ""
    },
    {
      "id": "ID010",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Lunch",
      "mealStyle": "Asian",
      "ratings": 2,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "18",
      "addon": false,
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/09",
      "image": ""
    },
    {
      "id": "ID011",
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/10",
      "image": ""
    },
    {
      "id": "ID012",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc":
          "Rolled flour tortilla filled with marinated grilled beef, lettuce, tomato, onion and fries",
      "category": "Lunch",
      "mealStyle": "Asian",
      "ratings": 3,
      "merchant_name": "Cafe",
      "merchant_image":
          "http://103.6.163.49:2008/Handler/ImagePathHandler.ashx?ImagePath=Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg&Default=2&PROUrl=http://103.6.163.49:2008/&StoreageUrl=http://103.6.163.49:2008/FS/",
      "calories": "",
      "price": "18",
      "addon": false,
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/11",
      "image": ""
    },
    {
      "id": "ID013",
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
        },
        {
          "name": "Potato",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=123&ScreenType=12"
        },
        {
          "name": "Chicken",
          "image":
              "http://103.6.163.49:2008/Handler/PortalImageHandler.ashx?RefSlno=107&ScreenType=12"
        },
      ],
      "date": "2022/05/12",
      "image": ""
    }
  ];
  List mealList_ = [];
  bool searchEnable = false;
  var selectedTab = 'Breakfast';

  int senderIndex = 0;
  var sortList = ["Recent First", "Low to High", "High to Low"];

  var termList = ["Term_Student_August", "Daily"];
  String? selectedTermValue;

  List<Widget> _list = <Widget>[];
  int _curr = 0;
  var selectedSortby = "Recent First";

  bool showMeal = false;
  @override
  void initState() {
    super.initState();
    mealList_ = mealList;
    initDates();
  }

  late DateTime _selectedDate;
  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(2022),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }

  void _runFilter(String enteredKeyword) {
    var results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = mealList;
    } else {
      results = mealList
          .where((user) =>
              user["name"] != null &&
              user["name"]
                  .toString()
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      mealList_ = results;
    });
  }

  PageController controller = PageController();
  var selectedDate = '';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    final familyList = data['familyList'];
    final imgBaseUrl = data['imgBaseUrl'];
    print(data);
    _list = <Widget>[
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
      MealPager(mealList_, onCartClick),
    ];
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          //titleSpacing: -5,
          automaticallyImplyLeading: false,
          centerTitle: true,
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
                          hintText: 'Search by meal name',
                          border: InputBorder.none),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image(
                        width: 50,
                        height: 50,
                        image: AssetImage("assets/images/ico_back.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Meal Order",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                    // Your widgets here
                  ],
                ),
          actions: [
            // Navigate to the Search Screen
            if (!searchEnable)
              if (familyList.length > 0 && senderIndex > -1)
                Container(
                  height: 30,
                  width: 150,
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          horizontalTitleGap: 2,
                          contentPadding: EdgeInsets.zero,
                          onTap: () => {
                            openMemberBottomSheet(
                                context, familyList, imgBaseUrl, (index) {
                              Navigator.pop(context);
                              senderIndex = index;
                              setState(() {});
                            })
                          },
                          /* title:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  familyList[senderIndex]['Name'],
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  familyList[senderIndex]['MemberId']
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ), */
                          trailing: familyList[senderIndex]['UserImgPath'] !=
                                  null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(imgBaseUrl +
                                      familyList[senderIndex]["UserImgPath"]),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.blue[700],
                                  child: Text(
                                    CommonFunctions.getInitials(
                                        familyList[senderIndex]['Name']),
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.white,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                          /* SizedBox(
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60.0),
                                child: FadeInImage(
                                  image: NetworkImage(familyList[senderIndex]['UserImgPath'] != null ?
                                     imgBaseUrl+familyList[senderIndex]['UserImgPath']:'assets/images/user.png'),
                                  placeholder:
                                      AssetImage("assets/images/user.png"),
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset('assets/images/user.png',
                                        fit: BoxFit.fitWidth);
                                  },
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ) */
                        ),
                      ),
                    ],
                  ),
                ),
            if (!searchEnable)
              InkWell(
                onTap: () {
                  _pickDateDialog();
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(Icons.calendar_month,
                      size: 30, color: Colors.grey.shade500),
                ),
              )
          ],
        ),
        /*  bottomNavigationBar: showMeal
            ? Container(
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
                        Navigator.of(context)
                            .pushNamed('/FilterPage', arguments: "");
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
              )
            : SizedBox(
                height: 0,
              ),
         */
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 246, 249, 254),
              Color.fromARGB(255, 230, 231, 239),
            ],
          )),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: HexColor("#f5f8fd"),
              margin: EdgeInsets.only(top: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!showMeal)
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 15, bottom: 10),
                        height: 30,
                        child: getBottomSheetActionBar(context, "Select Model",
                            false, HexColor("#f5f8fd")),
                      ),
                    if (!showMeal)
                      Container(
                        width: double.infinity,
                        color: Colors.grey.shade100,
                        margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              iconSize: 28,
                              hint: Text(
                                'Select Term',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: termList
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedTermValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedTermValue = value as String;
                                  packageList = [
                                    {"name": "Lunch Only", "amount": "1.00"},
                                    {
                                      "name": "Breakfast Only",
                                      "amount": "33.44"
                                    },
                                    {
                                      "name": "Lunch & Breakfast",
                                      "amount": "350.00"
                                    }
                                  ];
                                });
                              },
                              buttonHeight: 40,
                              buttonWidth: 140,
                              itemHeight: 40,
                            ),
                          ),
                        ),
                      ),
                    if (!showMeal)
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 15, bottom: 10),
                        height: 30,
                        child: getBottomSheetActionBar(
                            context, "Package", false, HexColor("#f5f8fd")),
                      ),
                    if (!showMeal)
                      Container(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: packageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  onTap: () {
                                    showMeal = true;
                                    setState(() {});
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 3.0,
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border:
                                              Border.all(color: Colors.white)),
                                      // color: Colors.grey,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Icon(
                                                      Icons
                                                          .breakfast_dining_outlined,
                                                      size: 30,
                                                      color:
                                                          Colors.amberAccent),
                                                ),
                                                Text(
                                                  "${packageList[index]["name"]}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            //textDirection: TextDirection.ltr,
                                            children: [
                                              Text(
                                                "MYR " +
                                                    "${packageList[index]["amount"]}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue.shade900,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  MyCustomAlertDialog()
                                                      .showToast(context,
                                                          "Item added to cart ");
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  margin:
                                                      EdgeInsets.only(right: 3),
                                                  child: Image.asset(
                                                      "assets/images/ico_cart_white.png"),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                      /* ListTile(
                                    horizontalTitleGap: 0,
                                    minVerticalPadding: 0,
                                    onTap: () {
                                      showMeal = true;
                                      setState(() {});
                                    },
                                    title: Text(
                                      "${packageList[index]["name"]}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      "${packageList[index]["amount"]}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    trailing: InkWell(
                                      onTap: () {
                                        MyCustomAlertDialog().showToast(
                                            context, "Item added to cart ");
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        margin: EdgeInsets.only(right: 3),
                                        /*padding: EdgeInsets.all(3),
                                         decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.black, width: 2)), */
                                        child: Image.asset(
                                            "assets/images/ico_cart_white.png"),
                                      ),
                                    ),
                                  ) */
                                      ));
                            }),
                      ),
                    if (showMeal)
                      Container(
                        height: 66,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: dateList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  selectedDate = dateList[index]["date"];
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: selectedDate ==
                                              dateList[index]["date"]
                                          ? Colors.amber.shade700
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: selectedDate ==
                                              dateList[index]["date"]
                                          ? Border.all(
                                              color: Colors.amber.shade700,
                                              width: 2,
                                            )
                                          : Border.all(color: Colors.white)),
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  // color: Colors.grey,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 0, left: 0, right: 0),
                                        child: Text(
                                          "${DateUtil().getDaysOfDate(dateList[index]["date"])["dayString"]}",
                                          style: TextStyle(
                                              fontSize: selectedDate ==
                                                      dateList[index]["date"]
                                                  ? 12
                                                  : 10,
                                              color: selectedDate ==
                                                      dateList[index]["date"]
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: selectedDate ==
                                                      dateList[index]["date"]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(top: 3),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            )),
                                        child: Text(
                                          "${DateUtil().getDaysOfDate(dateList[index]["date"])["day"]}",
                                          style: TextStyle(
                                              fontSize: selectedDate ==
                                                      dateList[index]["date"]
                                                  ? 12
                                                  : 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    if (showMeal)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                selectedTab = 'Breakfast';
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: selectedTab == 'Breakfast'
                                            ? Colors.amber.shade700
                                            : Colors.transparent,
                                        width: 5.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "Breakfast",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                selectedTab = 'Lunch';
                                setState(() {});
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: selectedTab == 'Lunch'
                                              ? Colors.amber.shade700
                                              : Colors.transparent,
                                          width: 5.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "Lunch",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                selectedTab = 'Dinner';
                                setState(() {});
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: selectedTab == 'Dinner'
                                              ? Colors.amber.shade700
                                              : Colors.transparent,
                                          width: 5.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "Dinner",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    if (showMeal)
                      Expanded(
                        child: PageView(
                          children: _list,
                          scrollDirection: Axis.horizontal,
                          // reverse: true,
                          // physics: BouncingScrollPhysics(),
                          controller: controller,
                          onPageChanged: (num) {
                            setState(() {
                              print("Pos" + _curr.toString());
                              _curr = num;
                              switch (_curr % 3) {
                                case 0:
                                  selectedTab = 'Breakfast';
                                  _curr = 0;
                                  print("OnChange date" + selectedDate);
                                  int index = dateList.indexWhere((element) =>
                                      selectedDate == element['date']);
                                  if (index > -1) {
                                    selectedDate = dateList[index + 1]['date'];
                                  }

                                  print("OnChange pos" + index.toString());
                                  print("OnChange date" + selectedDate);
                                  break;
                                case 1:
                                  selectedTab = 'Lunch';
                                  break;
                                case 2:
                                  selectedTab = 'Dinner';
                                  break;
                              }
                            });
                          },
                        ),
                      )
                  ]),
            ),
          ),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: _getFilterFAB());
  }

  void onCartClick(int index,familyList) {
    if (senderIndex <= -1) {
      openMemberBottomSheet(context, familyList, null, (studentindex) {
        senderIndex = studentindex;
        Navigator.of(context).pop();
        setState(() {});
        openMealCartBottomSheet(context, mealList_[index]);
      });
    } else {
      openMealCartBottomSheet(context, mealList_[index]);
    }
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
    selectedDate = dateList[0]["date"];
  }

  Widget _getFilterFAB() {
    if (showMeal)
      return ExpandableFab(
        children: [
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: Colors.amber,
            child: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              Navigator.of(context).pushNamed('/FilterPage', arguments: "");
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.short_text_rounded),
            onPressed: () {
              openSortByBottomSheet(context, sortList, (index1) {
                selectedSortby = sortList[index1];
                setState(() {});
                Navigator.of(context).pop();
              }, selectedSortby);
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.search),
            onPressed: () {
              searchEnable = !searchEnable;
              setState(() {});
            },
          ),
        ],
      );
    else
      return Container();
  }
}

void openMealCartBottomSheet(
  BuildContext buildContext,
  var storeInfo,
) {
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          padding: EdgeInsets.only(top: 15, left: 15),
                          child: Text("Meal Remark")),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          hintText: 'Maximum 100 characters',
                          isDense: true,
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          // Allow Decimal Number With Precision of 2 Only
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}')),
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
                                "PROCEED",
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
