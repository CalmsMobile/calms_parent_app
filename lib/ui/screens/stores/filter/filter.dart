import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var categoryList = [
    "Sport T-Shirt",
    "Pants",
    "Others",
    "School Shirt",
    "Books",
    "Category 10",
    "Stationary",
    "Dress",
    "Schoolbag",
    "Geomenty",
    "ITEM AC22"
  ];
  var yearGroupList = [
    "Year1",
    "Year2",
    "Year3",
    "Year4",
    "Year5",
    "Year6",
    "Year7",
    "Year8",
    "Year9",
    "Year10",
    "Z",
    "Others"
  ];

  RangeValues _currentRangeValues = const RangeValues(0, 600);

  var currentSelection = "category";

  var selectedYearGroup = [];
  var selectedCategory = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: -2,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Filters",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Center(
              child: InkWell(
            onTap: () {
              currentSelection = "category";
              _currentRangeValues = const RangeValues(0, 600);
              selectedYearGroup = [];
              selectedCategory = [];
              setState(() {});
              // Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "CLEAR ALL",
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Column(children: [
              InkWell(
                onTap: () {
                  currentSelection = "category";
                  setState(() {});
                },
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: currentSelection == "category"
                      ? Colors.white
                      : Colors.grey.shade200,
                  child: Column(children: [
                    Container(
                      width: 150,
                      child: Text(
                        "Size",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    )
                  ]),
                ),
              ),
              Container(
                width: 150,
                color: Colors.black12,
                child: Divider(
                  height: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  currentSelection = "year";
                  setState(() {});
                },
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: currentSelection == "year"
                      ? Colors.white
                      : Colors.grey.shade200,
                  child: Column(children: [
                    Container(
                      width: 150,
                      child: Text(
                        "Year",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    )
                  ]),
                ),
              ),
              Container(
                width: 150,
                color: Colors.black12,
                child: Divider(
                  height: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  currentSelection = "price";
                  setState(() {});
                },
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: currentSelection == "price"
                      ? Colors.white
                      : Colors.grey.shade200,
                  child: Column(children: [
                    Container(
                      width: 150,
                      child: Text(
                        "Price",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    )
                  ]),
                ),
              ),
            ]),
            if (currentSelection == "category")
              Container(
                width: 200,
                height: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryList.length,
                    itemBuilder: (BuildContext context, int index1) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: ListTile(
                              horizontalTitleGap: 0,
                              onTap: () {
                                var item = selectedCategory.indexWhere(
                                    (element) =>
                                        element == categoryList[index1]);
                                if (item > -1) {
                                  selectedCategory.removeAt(item);
                                } else {
                                  selectedCategory.add(categoryList[index1]);
                                }
                                print(selectedCategory);
                                setState(() {});
                              },
                              leading: Icon(
                                Icons.done_sharp,
                                color: selectedCategory.indexWhere((element) =>
                                            element == categoryList[index1]) >
                                        -1
                                    ? Colors.pinkAccent
                                    : Colors.grey.shade500,
                                size: 18,
                              ),
                              title: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: "${categoryList[index1]}",
                                  style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: selectedCategory.indexWhere(
                                                  (element) =>
                                                      element ==
                                                      categoryList[index1]) >
                                              -1
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            if (currentSelection == "year")
              Container(
                width: 200,
                height: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: yearGroupList.length,
                    itemBuilder: (BuildContext context, int index1) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: ListTile(
                              horizontalTitleGap: 0,
                              onTap: () {
                                var item = selectedYearGroup.indexWhere(
                                    (element) =>
                                        element == yearGroupList[index1]);
                                if (item > -1) {
                                  selectedYearGroup.removeAt(item);
                                } else {
                                  selectedYearGroup.add(yearGroupList[index1]);
                                }
                                print(selectedYearGroup);
                                setState(() {});
                              },
                              leading: Icon(
                                Icons.done_sharp,
                                color: selectedYearGroup.indexWhere((element) =>
                                            element == yearGroupList[index1]) >
                                        -1
                                    ? Colors.pinkAccent
                                    : Colors.grey.shade500,
                                size: 18,
                              ),
                              title: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: "${yearGroupList[index1]}",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: selectedYearGroup.indexWhere(
                                                (element) =>
                                                    element ==
                                                    yearGroupList[index1]) >
                                            -1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            if (currentSelection == "price")
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selected Price range",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "MYR ${double.parse(_currentRangeValues.start.round().toString()).toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: " - ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "MYR ${double.parse(_currentRangeValues.end.round().toString()).toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                              showValueIndicator: ShowValueIndicator.always),
                          child: RangeSlider(
                            values: _currentRangeValues,
                            max: 1000,
                            divisions: 5,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            inactiveColor: Colors.grey,
                            activeColor: Colors.pinkAccent,
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
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
                Navigator.of(context).pop();
              },
              child: Container(
                height: 45,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "CLOSE",
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
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Container(
                height: 45,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "APPLY",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
