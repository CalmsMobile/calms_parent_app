import 'package:calms_parent_latest/common/listener/settings_listener.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/app_settings.dart';
import '../../../common/my_shared_pref.dart';
import '../../../common/widgets/no_data_card.dart';
import '../cart/cart.dart';
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
  final AppTheme_;
  final poSettings;
  MealMenuPage(this.arguments, this.AppTheme_,this.poSettings, {Key? key}) : super(key: key);

  @override
  _MealMenuPageState createState() => _MealMenuPageState();
}

class _MealMenuPageState extends State<MealMenuPage> {
  var dateListOld = [];
  late List<DateTime> dateList;
  List mealListBydate = [];
  List mealListByItemType = [];
  bool searchEnable = false;
  var selectedTab;

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
        backgroundColor: HexColor(widget.AppTheme_['SecondaryBgColor']),
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
                      child: Container(
                          //margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: HexColor(
                                    widget.AppTheme_['SecondaryFrColor']),
                                width: 2),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: HexColor(
                                    widget.AppTheme_['SecondaryFrColor']),
                                size: 30,
                              )))),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Meal Order ${_selectedDate != null ?'('+DateFormat('dd-MMM-yyyy').format(_selectedDate)+')':''}",
                      style: TextStyle(
                          color: HexColor(widget.AppTheme_['SecondaryFrColor']),
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
              width: 60,
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
                /*  InkWell(
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
                 */
                Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(
                                  widget.arguments['imgBaseUrl'],
                                  widget.arguments['profileData'],
                                  widget.AppTheme_),
                            ),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: HexColor(
                                      widget.AppTheme_['SecondaryFrColor']),
                                  width: 2),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: HexColor(
                                      widget.AppTheme_['SecondaryFrColor']),
                                  size: 30,
                                )))),
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
      body: dateList.length > 0
          ? Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  HexColor(widget.AppTheme_['PrimaryBgColor']),
                  HexColor(widget.AppTheme_['PrimaryBgColor']),
                ],
              )),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Container(
                    color: HexColor(widget.AppTheme_['PrimaryBgColor']),
                    margin: EdgeInsets.only(top: 10),
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
                                        mealListByItemType = [];
                                        mealListBydate = getMealsListByDate(
                                            _selectedDate,
                                            widget.arguments['mealsList'],
                                            widget.arguments['mealsCtgryList']);
                                        if (mealListBydate.isNotEmpty) {
                                          selectedTab =
                                              ItemTypeList[0]['ItemTypeSeqId'];
                                          mealListByItemType =
                                              getMealsListByItemType(
                                                  selectedTab, mealListBydate);
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              _selectedDate == dateList[index]
                                                  ? HexColor(widget.AppTheme_[
                                                      'SecondaryFrColor'])
                                                  : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: _selectedDate ==
                                                  dateList[index]
                                              ? Border.all(
                                                  color: HexColor(
                                                      widget.AppTheme_[
                                                          'SecondaryFrColor']),
                                                  width: 2,
                                                )
                                              : Border.all(
                                                  color: Colors.white)),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      // color: Colors.grey,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  fontSize: _selectedDate ==
                                                          dateList[index]
                                                      ? 12
                                                      : 10,
                                                  color: _selectedDate ==
                                                          dateList[index]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: _selectedDate ==
                                                          dateList[index]
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(top: 3),
                                            decoration: BoxDecoration(
                                                color:dateList[index].weekday == DateTime.saturday? HexColor("#1b3a5a"):dateList[index].weekday == DateTime.sunday? HexColor("#001a2b"):Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2,
                                                )),
                                            child: Text(
                                              "${dateList[index].day}",
                                              style: TextStyle(
                                                  fontSize: _selectedDate ==
                                                          dateList[index]
                                                      ? 12
                                                      : 10,
                                                  color: (dateList[index].weekday == DateTime.saturday || dateList[index].weekday == DateTime.sunday)? Colors.white:HexColor(widget.AppTheme_['SecondaryBgColor']),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          if (mealListBydate.length == 0)
                            NoDataCard(
                                AppSettings.imgAssetNoMeal,
                                '',
                               _selectedDate.weekday == DateTime.saturday? AppSettings.msgNoMealSaturday
                               :_selectedDate.weekday == DateTime.sunday? AppSettings.msgNoMealSunday
                               :AppSettings.msgNoMeal,
                                20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  ItemTypeList.length,
                                  (index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTab = ItemTypeList[index]
                                            ['ItemTypeSeqId'];

                                        mealListByItemType =
                                            getMealsListByItemType(
                                                selectedTab, mealListBydate);
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: selectedTab ==
                                                      ItemTypeList[index]
                                                          ['ItemTypeSeqId']
                                                  ? HexColor(widget.AppTheme_[
                                                      'SecondaryFrColor'])
                                                  : Colors.transparent,
                                              width: 5.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          ItemTypeList[index]['Name'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: HexColor(widget
                                                  .AppTheme_['PrimaryFrColor']),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                              child: MealPager(
                                  mealListByItemType,
                                  widget.arguments['CurrencyCode'],
                                  widget.arguments['imgBaseUrl'],
                                  // widget.arguments['poTypesList']['PreOrderType'],
                                  // widget.arguments['poTypesList']['POTypeConfigSeqId'],
                                  widget.arguments['UserSeqId'],
                                  widget.arguments['poTypesList'],
                                  widget.arguments['profileData'],
                                  onCartClick,
                                  onCancelMeal,
                                  onChangeMeal,
                                  onCancelDailyMeal,
                                  widget.AppTheme_,widget.poSettings))
                        ])),
              ))
          : NoDataCard(AppSettings.imgAssetNoMeal, AppSettings.titleNoMeal,
              AppSettings.msgNoMeal, 20),
      //floatingActionButtonLocation: ExpandableFab.location,
      // floatingActionButton: _getFilterFAB()
    );
  }

  Future<void> onCartClick(meal, index, isDelete, isSingleSelection) async {
    print("call back index ${meal.toString()}");

    context.read<MySettingsListener>().updatePoTypeMealsCartStatus(
        isDelete,
        widget.arguments['UserSeqId'],
        meal,
        widget.arguments['poTypesList'],
        context,isSingleSelection);
    setState(() {
      if (isSingleSelection) {
        for (var i = 0; i < mealListByItemType.length; i++) {
          if (isDelete) {
            mealListByItemType[i]['addedToCart'] = false;
          } else {
            if (i == index)
              mealListByItemType[i]['addedToCart'] = true;
            else
              mealListByItemType[i]['addedToCart'] = false;
          }
        }
      } else {
        if (isDelete)
          mealListByItemType[index]['addedToCart'] = false;
        else
          mealListByItemType[index]['addedToCart'] = true;
      }
    });
  }

  void onCancelMeal(index) {
    setState(() {
      mealListByItemType[index]['AllowToCancel'] = false;
      mealListByItemType[index]['AllowToChoose'] = true;
    });
  }

  void onCancelDailyMeal(index) {
    setState(() {
      mealListByItemType[index]['AllowToCancel'] = false;
      mealListByItemType[index]['AllowToBuy'] = true;
    });
  }

  void onChangeMeal(index) {
    setState(() {
      for (var i = 0; i < mealListByItemType.length; i++) {
        if (i == index) {
          mealListByItemType[i]['AllowToCancel'] = true;
          mealListByItemType[i]['AllowToChoose'] = false;
        } else {
          mealListByItemType[i]['AllowToCancel'] = false;
          mealListByItemType[i]['AllowToChoose'] = true;
        }
      }
    });
  }

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
    mealListBydate = getMealsListByDate(_selectedDate,
        widget.arguments['mealsList'], widget.arguments['mealsCtgryList']);

    if (mealListBydate.isNotEmpty) {
      selectedTab = ItemTypeList[0]['ItemTypeSeqId'];
      mealListByItemType = getMealsListByItemType(selectedTab, mealListBydate);
    }
  }
}

List ItemTypeList = [];
List<dynamic> getMealsListByDate(
    DateTime selectedDate, mealsList, List mealsCtgryList) {
  String sdate = DateFormat('yyyy-MM-dd').format(selectedDate);
  List mealsList_ = [];
  List itemTypes = [];
  for (var meal in mealsList) {
    if (meal['ViewDate'] == sdate) {
      mealsList_.add(meal);
      itemTypes.add(double.parse(meal['ItemType']));
    }
  }

  ItemTypeList = mealsCtgryList
      .where((e) => itemTypes.contains(e['ItemTypeSeqId']))
      .toList();
  print(ItemTypeList);

  return mealsList_;
}

List<dynamic> getMealsListByItemType(ItemType, mealsList) {
  List mealsList_ = [];
  for (var meal in mealsList) {
    if (double.parse(meal['ItemType']) == ItemType) {
      mealsList_.add(meal);
    }
  }
  print(mealsList_);
  return mealsList_;
}
