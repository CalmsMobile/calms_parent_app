import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityDetails extends StatefulWidget {
  const ActivityDetails();

  @override
  _ActivityDetailsState createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  var cartCount = 0;
  var selectedQuantity = 0;
  var senderIndex = 3;

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
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> activityInfo =
        ModalRoute.of(context)?.settings.arguments as Map;
    print(activityInfo);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          titleSpacing: -5,
          title: Text(
            "ACTIVITY DETAILS",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
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
                            print(index);
                            Navigator.pop(context);
                            setState(() {
                              senderIndex = index;
                            });
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
          backgroundColor: Colors.white),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            child: Column(children: <Widget>[
              new Divider(
                height: 0.1,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/ViewImage', arguments: {
                        "images": activityInfo['image'] != ""
                            ? [activityInfo['image']]
                            : [],
                        "position": 0
                      });
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        child: activityInfo['image'] != null &&
                                activityInfo['image'] != ""
                            ? Image.network(activityInfo['image'],
                                width: double.infinity,
                                height: 400,
                                fit: BoxFit.cover)
                            : Image.asset(
                                "assets/images/no_image.png",
                                height: 400,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(right: 10, left: 15, top: 10, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          activityInfo['title'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cartCount = cartCount + 1;
                          MyCustomAlertDialog()
                              .showToast(context, "Item added to cart ");
                          setState(() {});
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(left: 3),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: Image.asset("assets/images/cart_round.png"),
                        ),
                      )
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 15, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'MYR ${double.parse(activityInfo["price"]).toStringAsFixed(2)}  ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: DecoratedBox(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(20.0),
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
                                        fontSize: 24, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 25,
                              child: Text(
                                selectedQuantity.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
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
                                          fontSize: 24, color: Colors.black),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(activityInfo["doctype"],
                        style: TextStyle(
                          fontSize: 14,
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Period",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
                        child: Row(
                          children: [
                            Text(
                                DateFormat.yMMMMd().format(
                                    DateFormat('yyyy/mm/dd')
                                        .parse(activityInfo['enddate'])),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 2),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Allowed",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text("1", style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text("Unlimitted", style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Purchased",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text("1", style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Collected",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text("1", style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
                  child: Text(
                    activityInfo['description'],
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.grey.shade100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
