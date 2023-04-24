import '/common/HexColor.dart';
import '/common/alert_dialog.dart';
import '/common/widgets/select_member.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ParentPickup extends StatefulWidget {
  const ParentPickup({Key? key}) : super(key: key);

  @override
  State<ParentPickup> createState() => _ParentPickupState();
}

class _ParentPickupState extends State<ParentPickup> {
  List<Map> familyList = [
    {
      "name": "Desmond Mohammad John Abraham Bismoi",
      "category": "PARENT",
      "desc": "",
      "class": "Class1",
      "year": "Year1",
      "balance": "250.00",
      "email": "makame147@gmail.com",
      "image": "https://randomuser.me/api/portraits/men/1.jpg"
    },
    {
      "name": "SITI KHALIDA",
      "category": "PARENT",
      "desc": "",
      "class": "Class2",
      "year": "Year2",
      "balance": "50.00",
      "email": "calms.rnd@gmail.com",
      "image": "https://randomuser.me/api/portraits/women/1.jpg"
    },
    {
      "name": "HAZIM",
      "category": "STUDENT",
      "email": "",
      "balance": "100.00",
      "class": "Class3",
      "year": "Year1",
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
      "year": "Year2",
      "contact": "",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/3.jpg"
    },
    {
      "name": "Danny",
      "category": "STUDENT",
      "email": "",
      "balance": "30.00",
      "contact": "",
      "class": "Class6",
      "year": "Year1",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/4.jpg"
    },
  ];
  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMyAppbar("Student Pickup", []),
      body: Container(
        color: HexColor("#f5f8fd"),
        width: double.infinity,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: familyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(left: 10, right: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(60.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(familyList[index]['image']),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: index == 0 ? 15 : 15, bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    child: Text(
                                      familyList[index]["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 5, left: 4),
                                        child: Image.asset(
                                          "assets/images/ico_class_v2.png",
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Container(
                                            child: Text(
                                              familyList[index]["class"],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10),
                                            ),
                                          )),
                                        ]),
                                      ),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          width: 1,
                                          height: 10,
                                          color: Colors.black),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Container(
                                            padding: EdgeInsets.only(
                                                bottom: 0, left: 0),
                                            child: Text(
                                              familyList[index]["year"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10),
                                            ),
                                          )),
                                        ]),
                                      ),
                                    ],
                                  ),
                                  if (index % 2 == 0)
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 5, left: 4),
                                          child: Icon(
                                            Icons.timelapse,
                                            color: Colors.black,
                                            size: 18,
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 0, left: 0),
                                                  child: Text(
                                                    "Last requested : ",
                                                    style: TextStyle(
                                                        color: Colors.redAccent,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                              WidgetSpan(
                                                  child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 0, left: 5),
                                                child: Text(
                                                  "05:00 PM",
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 5, left: 4, top: 4),
                                        child: Image.asset(
                                          "assets/images/ico_navigate_v2.png",
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                      RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 0, left: 0),
                                                child: Text(
                                                  "Navigate me to pick-up point",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (index % 2 == 0) {
                                        MyCustomAlertDialog().showCustomAlert(
                                            context,
                                            "Notification",
                                            "Do you like to request for pickup now?",
                                            false, () {
                                          requestPickup(context);
                                        }, () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        });
                                      } else {
                                        MyCustomAlertDialog().showCustomAlert(
                                          context,
                                          "Notification",
                                          "You are not authorized to pickup",
                                          false,
                                          null,
                                          () => Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop(),
                                        );
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 5, left: 4, top: 4),
                                          child: Image.asset(
                                            "assets/images/ico_request_v2.png",
                                            width: 18,
                                            height: 18,
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 0, left: 0),
                                                  child: Text(
                                                    "Send a request for pick-up",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> requestPickup(BuildContext context) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    dismissAlert();
  }

  void dismissAlert() {
    MyCustomAlertDialog().showCustomAlert(
      context,
      "Notification",
      "Request successfully submitted",
      false,
      null,
      () => Navigator.of(context, rootNavigator: true).pop(),
    );
  }
}
