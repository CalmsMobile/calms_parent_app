import 'package:calms_parent/common/constants.dart';
import 'package:calms_parent/common/date_util.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:calms_parent/ui/screens/activities/Activities.dart';
import 'package:flutter/material.dart';

class MealOrder extends StatefulWidget {
  const MealOrder();

  @override
  _MealOrderState createState() => _MealOrderState();
}

class _MealOrderState extends State<MealOrder> {
  var dateList = [];
  List mealList = [
    {
      "id": "ID001",
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
      "image":
          "http://124.217.235.107:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID002",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Briyani",
      "desc": "",
      "category": "Lunch",
      "mealStyle": "Indian",
      "ratings": 2,
      "calories": "",
      "price": "120",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/01",
      "image":
          "http://124.217.235.107:2008/FS/Meals/ResizeImg/9882-e4c2-2021-11-25-11-24-10-477/Rolled%20flour%20tortilla%20filled%20with%20marinated%20grilled%20chicken%20capsicum%20onion%20lettuce%20and%20fries.jpg"
    },
    {
      "id": "ID003",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Dosa",
      "desc": "",
      "category": "Dinner",
      "mealStyle": "Indian",
      "ratings": 3,
      "calories": "",
      "price": "10",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/01",
      "image":
          "http://124.217.235.107:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID004",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 1,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
      "date": "2022/05/02",
      "image":
          "https://www.tiktokbriyani.com/assets/images/Chiken-Briyani-Near-Me-Delivery.png"
    },
    {
      "id": "ID005",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 5,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/03",
      "image":
          "http://124.217.235.107:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID0055",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 2,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
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
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 3,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
      "date": "2022/05/05",
      "image":
          "http://124.217.235.107:2008/FS/Meals/ResizeImg/1c28-e4c2-2021-11-25-11-31-21-929/82861384-baguette-sandwich-with-roast-beef-tomato-and-mixed-salad.jpg"
    },
    {
      "id": "ID007",
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
      "id": "ID008",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 5,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
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
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 1,
      "calories": "",
      "price": "18",
      "addon": true,
      "ingredients": "",
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
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 2,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
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
      "id": "ID012",
      "allowCancel": true,
      "mealOrderType": "Daily",
      "selectionMode": "Multiple",
      "requirePurchaseCutoff": true,
      "name": "Sample Menu Name 1",
      "desc": "",
      "category": "",
      "mealStyle": "Asian",
      "ratings": 3,
      "calories": "",
      "price": "18",
      "addon": false,
      "ingredients": "",
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
  List mealList_ = [];
  bool searchEnable = false;
  var selectedTab = 'Breakfast';
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
  var sortList = ["Recent First", "Low to High", "High to Low", "Discount"];

  var selectedSortby = "Recent First";
  @override
  void initState() {
    super.initState();
    mealList_ = mealList;
    initDates();
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

  var selectedDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
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
                        hintText: 'Search by meal name',
                        border: InputBorder.none),
                  ),
                ),
              )
            : Text(
                "MEAL ORDER",
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
        margin: EdgeInsets.only(top: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios),
              ),
              Container(
                height: 65,
                width: 300,
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
                          width: 65,
                          decoration: BoxDecoration(
                              color: selectedDate == dateList[index]["date"]
                                  ? Colors.pinkAccent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(60),
                              border: selectedDate == dateList[index]["date"]
                                  ? Border.all(
                                      color: Colors.pinkAccent,
                                      width: 2,
                                    )
                                  : Border.all(color: Colors.white)),
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          // color: Colors.grey,
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${DateUtil().getDaysOfDate(dateList[index]["date"])["dayString"]}",
                                style: TextStyle(
                                    fontSize:
                                        selectedDate == dateList[index]["date"]
                                            ? 16
                                            : 12,
                                    color:
                                        selectedDate == dateList[index]["date"]
                                            ? Colors.white
                                            : Colors.black,
                                    fontWeight:
                                        selectedDate == dateList[index]["date"]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "${DateUtil().getDaysOfDate(dateList[index]["date"])["day"]}",
                                style: TextStyle(
                                    fontSize:
                                        selectedDate == dateList[index]["date"]
                                            ? 16
                                            : 12,
                                    color:
                                        selectedDate == dateList[index]["date"]
                                            ? Colors.white
                                            : Colors.black,
                                    fontWeight:
                                        selectedDate == dateList[index]["date"]
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                            ],
                          ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  selectedTab = 'Breakfast';
                  setState(() {});
                },
                child: Container(
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: selectedTab == 'Breakfast'
                              ? Colors.pinkAccent
                              : Colors.transparent,
                          width: 5.0),
                    ),
                  ),
                  child: Tab(
                    text: "Breakfast",
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedTab = 'Lunch';
                  setState(() {});
                },
                child: Container(
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: selectedTab == 'Lunch'
                                ? Colors.pinkAccent
                                : Colors.transparent,
                            width: 5.0),
                      ),
                    ),
                    child: Tab(text: "Lunch")),
              ),
              InkWell(
                onTap: () {
                  selectedTab = 'Dinner';
                  setState(() {});
                },
                child: Container(
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: selectedTab == 'Dinner'
                                ? Colors.pinkAccent
                                : Colors.transparent,
                            width: 5.0),
                      ),
                    ),
                    child: Tab(text: "Dinner")),
              ),
            ],
          ),
          Flexible(
            child: Container(
                child: GridView.builder(
              itemCount: mealList_.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  // moveToDetails(_foundStoreList, index, context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                      right: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  padding: EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Hero(
                            tag: "${mealList_[index]['id']}",
                            child:
                                Stack(alignment: Alignment.topLeft, children: [
                              mealList_[index]['image'] != null &&
                                      mealList_[index]['image'] != ""
                                  ? Image.network(
                                      mealList_[index]['image'],
                                      fit: BoxFit.cover,
                                      height: 200,
                                    )
                                  : Image.asset(
                                      "assets/images/meal_default.png",
                                    ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                                bottomRight:
                                                    Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        child: Text(
                                            "${mealList_[index]['mealStyle']}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold)),
                                      ),
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
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        padding: EdgeInsets.all(5),
                                        child: Image.network(
                                          "${'http://124.217.235.107:2008/Library/Images/HealthyRating/' + mealList_[index]['ratings'].toString() + '.png'}",
                                          fit: BoxFit.cover,
                                          height: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                  if (mealList_[index]['addon'])
                                    Container(
                                      margin: EdgeInsets.only(bottom: 15),
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
                                              bottomRight: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: Text("Add-on",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                ],
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
                                      right: 4, top: 4, bottom: 4, left: 8),
                                  child: Text(
                                    // products is out demo list
                                    mealList_[index]['name'],
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
                                        right: 2, top: 0, bottom: 2, left: 3),
                                    child: Row(
                                      children: [
                                        Icon(mealList_[index]['ratings'] > 0
                                            ? Icons.star
                                            : Icons.star_border_outlined),
                                        Icon(mealList_[index]['ratings'] > 1
                                            ? Icons.star
                                            : Icons.star_border_outlined),
                                        Icon(mealList_[index]['ratings'] > 2
                                            ? Icons.star
                                            : Icons.star_border_outlined),
                                        Icon(mealList_[index]['ratings'] > 3
                                            ? Icons.star
                                            : Icons.star_border_outlined),
                                        Icon(mealList_[index]['ratings'] > 4
                                            ? Icons.star
                                            : Icons.star_border_outlined),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 2, top: 2, bottom: 5, left: 8),
                                  child: RichText(
                                      maxLines: 2,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text:
                                              "MYR ${double.parse(mealList_[index]['price']).toStringAsFixed(2)}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: kTextColor,
                                              fontWeight: FontWeight.bold),
                                        ),
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
                                      context, mealList_[index]);
                                });
                              } else {
                                openCartBottomSheet(context, mealList_[index]);
                              }
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 3),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child:
                                  Image.asset("assets/images/cart_round.png"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ),
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
    selectedDate = dateList[0]["date"];
  }
}
