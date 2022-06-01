import 'package:calms_parent/common/util/my_alert_popup.dart';
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
      "acitivity_type": "EDU00001_EVENT_EVNT-1001",
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
      "description":
          "46 PCS Color Set has a lot of fun features to keep your baby engaged. It has 42 pieces It contain 12 water color, 6 sketch color, a sharpner, an eraser, 10 crayons color, 8 oil pastel colors, a glue, a paper clip and a box. Very nice product for your kid It improves creative power of your dear ones. Improves visual skills, creative skills and coordination skills of your child Designed keeping safety of your child on priority basis Always choose Happiesta for your kids Happiness",
      "yeargroup": ["YEAR 4", "YEAR 1", "YEAR 3"],
      "accessgroup": ["R001"],
      "isactive": true,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEh7oY40Jmp5SSbhKf-CEef3PiPaPXMn8GA&usqp=CAU",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMc_d-ufS996dH12Hw1y421z3a8fVa26eEg&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1004",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg-kqVxSbcllyyg6BPkuUZGB9ib4Yo5WHJEg&usqp=CAU",
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
      "acitivity_type": "EDU00001_EVENT_EVNT-1001",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEh7oY40Jmp5SSbhKf-CEef3PiPaPXMn8GA&usqp=CAU",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMc_d-ufS996dH12Hw1y421z3a8fVa26eEg&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1004",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg-kqVxSbcllyyg6BPkuUZGB9ib4Yo5WHJEg&usqp=CAU",
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
      "acitivity_type": "EDU00001_EVENT_EVNT-1001",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEh7oY40Jmp5SSbhKf-CEef3PiPaPXMn8GA&usqp=CAU",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMc_d-ufS996dH12Hw1y421z3a8fVa26eEg&usqp=CAU",
      "startdate": "2019/07/02",
      "enddate": "2019/11/01",
      "modifieddate": "2019/07/23 02:06:48 AM"
    },
    {
      "_id": "EDU00001_EVENT_EVNT-1004",
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg-kqVxSbcllyyg6BPkuUZGB9ib4Yo5WHJEg&usqp=CAU",
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
      "name": "HAZIM",
      "category": "STUDENT",
      "email": "",
      "balance": "100.00",
      "class": "Class3",
      "contact": "0123467589",
      "desc": "Member account does not exist in MFP software",
      "image": "https://randomuser.me/api/portraits/men/2.jpg"
    },
    {
      "name": "MARIE LIM",
      "category": "STUDENT",
      "email": "",
      "balance": "0.00",
      "class": "Class4",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Activities"),
          actions: [
            IconButton(
                icon: Icon(Icons.filter_alt_outlined),
                onPressed: () => {openFilterBottomSheet(context)})
          ],
        ),
        body: Container(
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    labelText: 'Search',
                    hintText: 'Type here to search',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.blue,
                    )),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: _foundActivities.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: <Widget>[
                        new Divider(
                          height: 0.1,
                        ),
                        ListTile(
                          leading: _foundActivities[index]['image'] != null
                              ? Image.network(_foundActivities[index]['image'],
                                  width: 80, height: 80, fit: BoxFit.cover)
                              : Image.asset("assets/images/user.png"),
                          title: Text(
                            _foundActivities[index]['title'],
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
                              Text(
                                _foundActivities[index]['description'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              RichText(
                                text: new TextSpan(
                                  text: "End date :",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: _foundActivities[index]
                                                    ['enddate'] !=
                                                ""
                                            ? DateFormat.yMMMEd().format(
                                                DateFormat('yyyy/mm/dd').parse(
                                                    _foundActivities[index]
                                                        ['enddate']))
                                            : "",
                                        style: new TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              // Text(storeList[index]['invoice_date'])
                            ],
                          ),
                          isThreeLine: true,
                          trailing: Column(
                            children: [
                              Text(
                                'MYR ${double.parse(_foundActivities[index]['price']).toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.transparent, // Button color
                                    child: InkWell(
                                      splashColor: Colors.red, // Splash color
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder:
                                              (BuildContext dialogContext) {
                                            // holding this dialog context
                                            return MyAlertPopupDialog()
                                                .showAlert(
                                                    "Select Children",
                                                    familyList,
                                                    "",
                                                    context, () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                            }, () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                              openDonationBottomSheet(context,
                                                  _foundActivities[index]);
                                            });
                                          },
                                        );
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
                            ],
                          ),
                          onTap: () => {
                            Navigator.of(context).pushNamed('/ActivityDetails',
                                arguments: _foundActivities[index])
                          },
                        )
                      ]);
                    }),
              ),
            )
          ]),
        ));
  }
}

bool isPaid(double totalAmount, double paidAmount) {
  return paidAmount >= totalAmount;
}

void openDonationBottomSheet(BuildContext buildContext, invoice) {
  showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        print("bottomsheet clicked");
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppBar(
              title: Text("Payment Summary"),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.close_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  invoice["description"],
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'MYR ${double.parse(invoice['price']).toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Already you have paid",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'MYR 0.00',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pay amount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Amount',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                            left: 10, right: 0, top: 0, bottom: 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppBar(
              title: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Done",
                  textAlign: TextAlign.end,
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.check_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      });
}

void openFilterBottomSheet(BuildContext buildContext) {
  showModalBottomSheet(
      context: buildContext,
      builder: (context) {
        print("bottomsheet clicked");
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppBar(
              title: Text("Filter"),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.close_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  "UnPaid",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 0.3,
                color: Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  "Completed",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        );
      });
}
