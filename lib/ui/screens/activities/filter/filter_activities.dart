import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';

class FilterActivities extends StatefulWidget {
  const FilterActivities({Key? key}) : super(key: key);

  @override
  State<FilterActivities> createState() => _FilterActivitiesState();
}

class _FilterActivitiesState extends State<FilterActivities> {
  List activityTypeList = [
    {
      "name": "School Trip",
      "subtitle": "Hiking",
    },
    {
      "name": "School Trip",
      "subtitle": "TV Station",
    },
    {
      "name": "School Trip",
      "subtitle": "Aquarium",
    },
    {
      "name": "School Trip",
      "subtitle": "Museum",
    },
    {
      "name": "School Trip",
      "subtitle": "Zoo",
    },
    {
      "name": "School Trip",
      "subtitle": "Planetarium",
    },
    {
      "name": "Sport Event",
      "subtitle": "Bowling",
    },
    {
      "name": "Sport Event",
      "subtitle": "Swimming",
    },
    {
      "name": "Sport Event",
      "subtitle": "Tennis",
    },
    {
      "name": "Sport Event",
      "subtitle": "Football",
    },
    {
      "name": "Sport Event",
      "subtitle": "Fencing",
    },
    {
      "name": "Sport Event",
      "subtitle": "Canoeing",
    },
    {
      "name": "Sport Event",
      "subtitle": "Basketball",
    },
    {
      "name": "Sport Event",
      "subtitle": "Archery",
    },
    {
      "name": "Z",
      "subtitle": "A",
    },
    {
      "name": "Z",
      "subtitle": "K",
    },
    {
      "name": "Z",
      "subtitle": "N",
    },
    {
      "name": "TEST 1",
      "subtitle": "TEST 11",
    },
    {
      "name": "TEST 1",
      "subtitle": "TEST 12",
    },
    {
      "name": "TEST 1",
      "subtitle": "TEST 13",
    },
    {
      "name": "Sport Event",
      "subtitle": "TEST 14",
    },
  ];

  var sortList = ["Recent First", "Low to High", "High to Low"];
  RangeValues _currentRangeValues = const RangeValues(0, 600);
  var selectedSortby = "Recent First";

  @override
  void initState() {
    super.initState();

    var list = activityTypeList
        .fold({}, (previousValue, element) {
          Map val = previousValue as Map;
          String date = element['name'];
          if (!val.containsKey(date)) {
            val[date] = [];
          }
          element.remove('name');
          val[date]?.add(element);
          return val;
        })
        .entries
        .map((e) => {e.key: e.value})
        .toList();

    for (int i = 0; i < list.length; i++) {
      print(list[i]);
      var item = {
        "name": list[i].keys.first,
        "datas": list[i].values.first,
      };
      activityTypeTitleList.add(item);
    }

    print(activityTypeTitleList);
  }

  var showOnlyList = ["Active", "Expired"];
  var selectedShowOnly = "Active";
  var currentSelection = "active_expire";
  var activityTypeTitleList = [];
  var selectedActivityType = [];
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
              currentSelection = "active_expire";
              _currentRangeValues = const RangeValues(0, 600);
              selectedActivityType = [];
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
                  currentSelection = "active_expire";
                  setState(() {});
                },
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: currentSelection == "active_expire"
                      ? Colors.white
                      : Colors.grey.shade200,
                  child: Column(children: [
                    Container(
                      width: 150,
                      child: Text(
                        "Show",
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
                  currentSelection = "activity_type";
                  setState(() {});
                },
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: currentSelection == "activity_type"
                      ? Colors.white
                      : Colors.grey.shade200,
                  child: Column(children: [
                    Container(
                      width: 150,
                      child: Text(
                        "Activity type",
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
            if (currentSelection == "active_expire")
              Container(
                width: 200,
                height: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: showOnlyList.length,
                    itemBuilder: (BuildContext context, int index1) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: ListTile(
                              horizontalTitleGap: 0,
                              onTap: () {
                                selectedShowOnly = showOnlyList[index1];
                                setState(() {});
                              },
                              leading: Icon(
                                Icons.done_sharp,
                                color: selectedShowOnly == showOnlyList[index1]
                                    ? Colors.pinkAccent
                                    : Colors.grey.shade500,
                                size: 18,
                              ),
                              title: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: "${showOnlyList[index1]}",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight:
                                        selectedShowOnly == showOnlyList[index1]
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
            if (currentSelection == "activity_type")
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: activityTypeTitleList.length,
                        itemBuilder: (BuildContext context, int index1) {
                          return SizedBox(
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  text: "",
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text:
                                            " ${activityTypeTitleList[index1]["name"]}",
                                        style: new TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: activityTypeTitleList[index1]
                                            ["datas"]
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: ListTile(
                                              horizontalTitleGap: 0,
                                              onTap: () {
                                                var item = selectedActivityType
                                                    .indexWhere((element) =>
                                                        element["subtitle"] ==
                                                        activityTypeTitleList[
                                                                    index1]
                                                                ["datas"][index]
                                                            ['subtitle']);
                                                if (item > -1) {
                                                  selectedActivityType
                                                      .removeAt(item);
                                                } else {
                                                  selectedActivityType.add(
                                                      activityTypeTitleList[
                                                              index1]["datas"]
                                                          [index]);
                                                }
                                                setState(() {});
                                              },
                                              leading: Icon(
                                                Icons.done_sharp,
                                                color: selectedActivityType.indexWhere((element) =>
                                                            element[
                                                                "subtitle"] ==
                                                            activityTypeTitleList[
                                                                        index1][
                                                                    "datas"][index]
                                                                ["subtitle"]) >
                                                        -1
                                                    ? Colors.pinkAccent
                                                    : Colors.grey,
                                                size: 18,
                                              ),
                                              title: RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                  text:
                                                      "${activityTypeTitleList[index1]["datas"][index]['subtitle']}",
                                                  style: new TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black,
                                                    fontWeight: selectedActivityType.indexWhere((element) =>
                                                                element[
                                                                    "subtitle"] ==
                                                                activityTypeTitleList[
                                                                            index1]
                                                                        [
                                                                        "datas"][index]
                                                                    [
                                                                    "subtitle"]) >
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
                              // GridView.builder(
                              //                     itemCount: activityTypeTitleList[index1]
                              //                             ["datas"]
                              //                         .length,
                              //                     shrinkWrap: true,
                              //                     physics: NeverScrollableScrollPhysics(
                              //                         parent: AlwaysScrollableScrollPhysics()),
                              //                     gridDelegate:
                              //                         SliverGridDelegateWithFixedCrossAxisCount(
                              //                       crossAxisCount:
                              //                           MediaQuery.of(context).orientation ==
                              //                                   Orientation.landscape
                              //                               ? 6
                              //                               : 3,
                              //                       crossAxisSpacing: 10,
                              //                       mainAxisSpacing: 5,
                              //                       childAspectRatio: (3 / 1),
                              //                     ),
                              //                     itemBuilder: (
                              //                       context,
                              //                       index,
                              //                     ) {
                              //                       return Container(
                              //                         height: 20,
                              //                         margin:
                              //                             EdgeInsets.symmetric(horizontal: 5),
                              //                         child: OutlinedButton(
                              //                           onPressed: () {
                              //
                              //                           },
                              //                           child: RichText(
                              //                             text: TextSpan(
                              //                               text: "",
                              //                               style: new TextStyle(
                              //                                 fontSize: 14.0,
                              //                                 color: Colors.black,
                              //                               ),
                              //                               children: [
                              //                                 TextSpan(
                              //                                     text:
                              //                                         " ${activityTypeTitleList[index1]["datas"][index]["subtitle"]}",
                              //                                     style: new TextStyle(
                              //                                         color: selectedActivityType.indexWhere((element) =>
                              //                                                     element[
                              //                                                         "subtitle"] ==
                              //                                                     activityTypeTitleList[index1]
                              //                                                                 [
                              //                                                                 "datas"]
                              //                                                             [
                              //                                                             index]
                              //                                                         [
                              //                                                         "subtitle"]) >
                              //                                                 -1
                              //                                             ? Colors.pinkAccent
                              //                                             : Colors.grey,
                              //                                         fontSize: 12,
                              //                                         fontWeight:
                              //                                             FontWeight.bold)),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                         ),
                              //                       );
                              //                     }),
                              // ),
                            ),
                          );
                        }),
                  ),
                ),
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

//     body: SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: SingleChildScrollView(
//         child: Container(
//           child: Column(children: [
//             SmartSelect<String?>.single(
//               title: 'Show only',
//               selectedValue: selectedShowOnly,
//               choiceItems: categories,
//               modalType: S2ModalType.bottomSheet,
//               choiceType: S2ChoiceType.radios,
//               choiceStyle: S2ChoiceStyle(outlined: true, showCheckmark: true),
//               onChange: (selected) =>
//                   setState(() => selectedShowOnly = selected.value!),
//               tileBuilder: (context, state) => S2Tile.fromState(
//                 state,
//                 isTwoLine: true,
//                 leading: Container(
//                   width: 40,
//                   alignment: Alignment.center,
//                   child: const Icon(Icons.label_outline),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
//                 margin: EdgeInsets.all(0),
//                 width: double.infinity,
//                 color: Colors.grey.shade300,
//                 child: Text(
//                   "Activity Type",
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
//                 margin: EdgeInsets.all(0),
//                 width: double.infinity,
//                 color: Colors.grey.shade300,
//                 child: Text(
//                   "Price",
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SliderTheme(
//                 data: SliderThemeData(
//                     showValueIndicator: ShowValueIndicator.always),
//                 child: RangeSlider(
//                   values: _currentRangeValues,
//                   max: 1000,
//                   divisions: 5,
//                   labels: RangeLabels(
//                     _currentRangeValues.start.round().toString(),
//                     _currentRangeValues.end.round().toString(),
//                   ),
//                   inactiveColor: Colors.grey,
//                   activeColor: Colors.black,
//                   onChanged: (RangeValues values) {
//                     setState(() {
//                       _currentRangeValues = values;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
//                 margin: EdgeInsets.all(0),
//                 width: double.infinity,
//                 color: Colors.grey.shade300,
//                 child: Text(
//                   "Sortby",
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: sortList.length,
//                 itemBuilder: (BuildContext context, int index1) {
//                   return SizedBox(
//                     height: 40,
//                     child: ListTile(
//                       onTap: () {
//                         selectedSortby = sortList[index1];
//                         setState(() {});
//                       },
//                       leading: Icon(
//                         Icons.done,
//                         color: selectedSortby == sortList[index1]
//                             ? Colors.blueAccent
//                             : Colors.white,
//                       ),
//                       title: RichText(
//                         text: TextSpan(
//                           text: "",
//                           style: new TextStyle(
//                             fontSize: 14.0,
//                             color: Colors.black,
//                           ),
//                           children: [
//                             TextSpan(
//                                 text: " ${sortList[index1]}",
//                                 style: new TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 })
//           ]),
//         ),
//       ),
//     ),
//   );
// }

getTitle(Map myList) {
  print(myList.keys.first);
  return myList.keys.first;
}

getActivityList(Map myList) {
  var list = [];
  myList.forEach((k, v) => list.add({"key": k, "values": v}));
  print(list);
}
