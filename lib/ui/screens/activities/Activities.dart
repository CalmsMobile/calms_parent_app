import 'package:calms_parent/common/HexColor.dart';
import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/constants.dart';
import 'package:calms_parent/common/util/my_alert_popup.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Activities extends StatefulWidget {
  const Activities();

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  final List<Map<dynamic, dynamic>> activityList = [
    {
      "_id": "EDU00001_EVENT_EVNT-1001",
      "_rev": "15-5f8395a893f523756908f0d48b073a03",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "receipt_no": "RCPT001-12111",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1001",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "School Music Festival 2019",
      "price": "100",
      "description":
          "46 PCS Color Set has a lot of fun features to keep your baby engaged. It has 42 pieces It contain 12 water color, 6 sketch color, a sharpner, an eraser, 10 crayons color, 8 oil pastel colors, a glue, a paper clip and a box. Very nice product for your kid It improves creative power of your dear ones. Improves visual skills, creative skills and coordination skills of your child Designed keeping safety of your child on priority basis Always choose Happiesta for your kids Happiness",
      "yeargroup": ["YEAR 4", "YEAR 1", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image": "",
      "startdate": "2019/07/02",
      "enddate": "2019/07/31",
      "modifieddate": "2019/09/22 04:45:04 PM",
      "attachmentlist": [
        {"id": "0", "type": "application/pdf", "name": "slip_AB489665.pdf"},
        {"id": "1", "type": "image/png", "name": "dollar-icon.png"}
      ]
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1003",
      "receipt_no": "RCPT001-12111",
      "_rev": "6-3ab176b0ae96039e73b0aabc39d56221",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1003",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Dancing Competition 2019",
      "price": "20",
      "description":
          "As dance teams head into competition season, when the pressure and excitement are at an all time high, everyone could use a little extra motivation and encouragement!  To inspire your team, here are our 10 favorite motivational quotes for dancers",
      "yeargroup": ["YEAR 4", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX3u01CRj2dvoBQuCUuGyG_7BcxTIJ_qIKzQ&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1004",
      "receipt_no": "RCPT001-12111",
      "_rev": "16-72f60d2c9fa59caeab2b71da69342780",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1004",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Sing Loud",
      "price": "50",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkBZJEywoUSqlJz0gsjE7Tn_72KStEInEN-w&usqp=CAU",
      "description":
          "I think music in itself is healing. It’s an explosive expression of humanity. It’s something we are all touched by. No matter what culture we’re from, everyone loves music.",
      "yeargroup": ["YEAR 4", "YEAR 3", "YEAR 1"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "startdate": "2019/07/02",
      "enddate": "2019/08/01",
      "modifieddate": "2019/08/04 09:50:10 PM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1005",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2LFgkB8qoQQbpFehoowcqxibapU6PQTKz8Q&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/07/31",
      "category": "School Trip",
      "modifieddate": "2019/09/22 04:45:04 PM",
      "attachmentlist": [
        {"id": "0", "type": "application/pdf", "name": "slip_AB489665.pdf"},
        {"id": "1", "type": "image/png", "name": "dollar-icon.png"}
      ]
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1006",
      "receipt_no": "RCPT001-12111",
      "_rev": "6-3ab176b0ae96039e73b0aabc39d56221",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1003",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Dancing Competition 2019",
      "price": "20",
      "description":
          "As dance teams head into competition season, when the pressure and excitement are at an all time high, everyone could use a little extra motivation and encouragement!  To inspire your team, here are our 10 favorite motivational quotes for dancers",
      "yeargroup": ["YEAR 4", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "category": "School Trip",
      "image":
          "https://www.esn.org/blog/sites/default/files/imce/576364502a3f379b77617193680e21ff.jpg",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1007",
      "receipt_no": "RCPT001-12111",
      "_rev": "16-72f60d2c9fa59caeab2b71da69342780",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1004",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Sing Loud",
      "price": "50",
      "image":
          "https://www.esn.org/blog/sites/default/files/imce/576364502a3f379b77617193680e21ff.jpg",
      "description":
          "I think music in itself is healing. It’s an explosive expression of humanity. It’s something we are all touched by. No matter what culture we’re from, everyone loves music.",
      "yeargroup": ["YEAR 4", "YEAR 3", "YEAR 1"],
      "accessgroup": ["R001"],
      "isactive": true,
      "startdate": "2019/07/02",
      "enddate": "2019/08/01",
      "modifieddate": "2019/08/04 09:50:10 PM"
    },
    {
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
          "https://www.esn.org/blog/sites/default/files/imce/576364502a3f379b77617193680e21ff.jpg",
      "startdate": "2019/07/02",
      "enddate": "2019/07/31",
      "modifieddate": "2019/09/22 04:45:04 PM",
      "attachmentlist": [
        {"id": "0", "type": "application/pdf", "name": "slip_AB489665.pdf"},
        {"id": "1", "type": "image/png", "name": "dollar-icon.png"}
      ]
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1009",
      "receipt_no": "RCPT001-12111",
      "_rev": "6-3ab176b0ae96039e73b0aabc39d56221",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1003",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Dancing Competition 2019",
      "price": "20",
      "description":
          "As dance teams head into competition season, when the pressure and excitement are at an all time high, everyone could use a little extra motivation and encouragement!  To inspire your team, here are our 10 favorite motivational quotes for dancers",
      "yeargroup": ["YEAR 4", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "image":
          "https://www.esn.org/blog/sites/default/files/imce/576364502a3f379b77617193680e21ff.jpg",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1010",
      "receipt_no": "RCPT001-12111",
      "_rev": "16-72f60d2c9fa59caeab2b71da69342780",
      "createdby": "Daniel Dennis [SYSADMIN001]",
      "modifiedby": "Daniel Dennis [SYSADMIN001]",
      "companyid": "EDU00001",
      "doctype": "EVENT",
      "eventid": "EVNT-1004",
      "quantity_limit": "Unlimtted",
      "available_quantity": "10",
      "title": "Sing Loud",
      "price": "50",
      "image":
          "https://www.esn.org/blog/sites/default/files/imce/576364502a3f379b77617193680e21ff.jpg",
      "description":
          "I think music in itself is healing. It’s an explosive expression of humanity. It’s something we are all touched by. No matter what culture we’re from, everyone loves music.",
      "yeargroup": ["YEAR 4", "YEAR 3", "YEAR 1"],
      "accessgroup": ["R001"],
      "isactive": true,
      "startdate": "2019/07/02",
      "enddate": "2019/08/01",
      "modifieddate": "2019/08/04 09:50:10 PM"
    },
  ];
  List<Map<dynamic, dynamic>> _foundActivities = [];

  List<Map> familyList = [
    {
      "name": "Desmond",
      "category": "PARENT",
      "memberId": "M1001",
      "desc": "",
      "balance": "250",
      "familtid": "FMY0001",
      "relationship": "Father",
      "email": "makame147@gmail.com",
      "image": "https://randomuser.me/api/portraits/men/11.jpg"
    },
    {
      "name": "SITI KHALIDA",
      "category": "PARENT",
      "memberId": "M1002",
      "desc": "",
      "balance": "50",
      "familtid": "FMY0001",
      "relationship": "Mother",
      "email": "calms.rnd@gmail.com",
      "image": "https://randomuser.me/api/portraits/women/11.jpg"
    },
    {
      "name": "HAZIM",
      "category": "STUDENT",
      "email": "",
      "balance": "100.00",
      "class": "Class3",
      "contact": "0123467589",
      "memberId": "M1001",
      "desc": "Member account does not exist in MFP software",
      "image": "https://randomuser.me/api/portraits/men/2.jpg"
    },
    {
      "name": "MARIE LIM",
      "category": "STUDENT",
      "email": "",
      "balance": "0.00",
      "class": "Class4",
      "memberId": "M1001",
      "contact": "1345657",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/3.jpg"
    },
    {
      "name": "Danny",
      "category": "STUDENT",
      "email": "",
      "balance": "30.00",
      "contact": "565467898",
      "memberId": "M1001",
      "class": "Class6",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/4.jpg"
    },
  ];
  @override
  void initState() {
    _foundActivities = activityList;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<dynamic, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = activityList;
    } else {
      results = activityList
          .where((user) => user["description"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundActivities = results;
    });
  }

  bool searchEnable = false;

  int cartCount = 0;

  int senderIndex = 2;

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
                        hintText: 'Search by Item name',
                        border: InputBorder.none),
                  ),
                ),
              )
            : Text(
                "ACTIVITIES",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
        actions: [
          if (!searchEnable)
            if (familyList.length > 0 && senderIndex > -1)
              Container(
                height: 30,
                width: 140,
                child: Row(
                  children: [
                    Flexible(
                      child: ListTile(
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
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
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
          //       Navigator.of(context)
          //           .pushNamed('/FilterActivities', arguments: "");
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
                Navigator.of(context)
                    .pushNamed('/FilterActivities', arguments: "");
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
            itemCount: _foundActivities.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/ActivityDetails',
                    arguments: _foundActivities[index]);
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
                          tag: "${_foundActivities[index]['_id']}",
                          child: Stack(alignment: Alignment.topLeft, children: [
                            _foundActivities[index]['image'] != ""
                                ? Image.network(
                                    _foundActivities[index]['image'],
                                    fit: BoxFit.fill,
                                    height: 180,
                                  )
                                : Image.asset("assets/images/no_image.png",
                                    fit: BoxFit.fill),
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
                                  _foundActivities[index]['title'],
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
                                  "${_foundActivities[index]['doctype']}",
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
                                            "MYR ${double.parse(_foundActivities[index]['price']).toStringAsFixed(2)}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      if (double.parse(_foundActivities[index]
                                              ['price']) >
                                          0)
                                        WidgetSpan(
                                            child: SizedBox(
                                          width: 5,
                                        )),

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
                                Navigator.of(context).pop();
                                senderIndex = studentindex;
                                setState(() {});
                                openCartBottomSheet(
                                    context, _foundActivities[index]);
                              });
                            } else {
                              openCartBottomSheet(
                                  context, _foundActivities[index]);
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

void openCartBottomSheet(
  BuildContext buildContext,
  var storeInfo,
) {
  var colorsList = storeInfo["colors"] == null ? [] : storeInfo["colors"];
  var sizesList = storeInfo["size"] == null ? [] : storeInfo["size"];

  print(colorsList);

  var selectedColor = "";
  var selectedSize = "";
  int selectedQuantity = 1;

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
