import 'package:calms_parent_latest/common/listener/settings_listener.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/date_util.dart';
import '../../../common/widgets/common.dart';
import '/ui/screens/activities/Activities.dart';
import '/ui/screens/meals/meal_pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MealMenuPage extends StatefulWidget {
  final arguments;
  const MealMenuPage(this.arguments, {Key? key}) : super(key: key);

  @override
  _MealMenuPageState createState() => _MealMenuPageState();
}

class _MealMenuPageState extends State<MealMenuPage> {
  String imgBaseUrl = "";
  var dateListOld = [];
  late List<DateTime> dateList;
  List mealList_ = [];
  bool searchEnable = false;
  var selectedTab = 'Breakfast';

  int senderIndex = 0;
  var sortList = ["Recent First", "Low to High", "High to Low"];

  var termList = ["Term_Student_August", "Daily"];
  String? selectedTermValue;
  var selectedSortby = "Recent First";
  late DateTime _selectedDate;
  @override
  void initState() {
    super.initState();

    if (widget.arguments['poTypesList']['PreOrderType'] == "Daily")
      initdateList(widget.arguments['poTypesList']['FromDate'],
          widget.arguments['mealsList'][0]['MaxDate']);
    else
      initdateList(widget.arguments['poTypesList']['FromDate'],
          widget.arguments['poTypesList']['ToDate']);
  }

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

  /*  void _runFilter(String enteredKeyword) {
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
 */
  PageController controller = PageController();
  var selectedDate = '';

  @override
  Widget build(BuildContext context) {
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
                      onChanged: (value) => {/* _runFilter(value) */},
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
                      onTap: () {
                        Navigator.pop(context);
                      },
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
            if (!searchEnable)
              Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.only(right: 10),
                child: Row(children: [
                  /* InkWell(
                    onTap: () {
                      _pickDateDialog();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.calendar_month_rounded,
                          size: 30, color: Colors.grey.shade500),
                    ),
                  ), */
                  InkWell(
                    onTap: () {
                      _pickDateDialog();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(left: 10),
                      child: ClipOval(
                        child: Material(
                          color: Colors.blue[900], // Button color
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.white,
                                size: 18,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {},
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
          ],
        ),
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
                                setState(() {
                                  _selectedDate = dateList[index];
                                  mealList_ = getMealsListByDate(_selectedDate,
                                      widget.arguments['mealsList']);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _selectedDate == dateList[index]
                                        ? Colors.amber.shade700
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: _selectedDate == dateList[index]
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
                                        //"${DateUtil().getDaysOfDate(dateListOld[index]["date"])["dayString"]}",
                                        "${DateFormat('EE').format(dateList[index])}",
                                        style: TextStyle(
                                            fontSize:
                                                _selectedDate == dateList[index]
                                                    ? 12
                                                    : 10,
                                            color:
                                                _selectedDate == dateList[index]
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight:
                                                _selectedDate == dateList[index]
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
                                        "${dateList[index].day}",
                                        style: TextStyle(
                                            fontSize:
                                                _selectedDate == dateList[index]
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
                    Expanded(
                        child: MealPager(
                            mealList_,
                            widget.arguments['CurrencyCode'],
                            imgBaseUrl,
                            widget.arguments['poTypesList']['PreOrderType'],
                            onCartClick))
                  ]),
            ),
          ),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: _getFilterFAB());
  }

  void onCartClick(meal, index, isDelete) {
    print("call back index ${meal.toString()}");
    context.read<MySettingsListener>().updatePoTypeMealsCartStatus(isDelete,
        widget.arguments['UserSeqId'], meal, widget.arguments['poTypesList']);
    setState(() {
      if (isDelete)
        mealList_[index]['addedToCart'] = false;
      else
        mealList_[index]['addedToCart'] = true;
    });
  }

  /*  void onCartClick(int index, familyList) {
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
 */
  /*  void initDates() {
    dateListOld = [];
    for (var item in mealList) {
      int index =
          dateListOld.indexWhere((element) => item['date'] == element['date']);
      if (index <= -1) {
        dateListOld.add(item);
      }
    }
    selectedDate = dateListOld[0]["date"];
  }
 */
  Widget _getFilterFAB() {
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
  }

  void initdateList(startDate, endDate) {
    _selectedDate = DateTime.parse(startDate);
    dateList = DateUtil()
        .getDaysInBetween(DateTime.parse(startDate), DateTime.parse(endDate));
    print("=======");
    print(dateList);
    print("=======");
    mealList_ =
        getMealsListByDate(_selectedDate, widget.arguments['mealsList']);
  }
}

List<dynamic> getMealsListByDate(DateTime selectedDate, mealsList) {
  String sdate = DateFormat('yyyy-MM-dd').format(selectedDate);
  List mealsList_ = [];
  for (var meals in mealsList) {
    if (meals['ViewDate'] == sdate) {
      mealsList_.add(meals);
    }
  }
  print(mealsList_);
  return mealsList_;
}

/* void openMealCartBottomSheet(
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
 */