import 'package:calms_parent/common/alert_dialog.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
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
        color: Colors.white,
        width: double.infinity,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: familyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.width * 0.12,
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(60.0),
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(familyList[index]['image']),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          familyList[index]["name"],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.left,
                                              text: TextSpan(
                                                children: [
                                                  WidgetSpan(
                                                    child: Icon(
                                                      Icons.filter,
                                                      size: 16,
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                      child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 0, left: 5),
                                                    child: Text(
                                                      familyList[index]
                                                          ["class"],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 12),
                                                    ),
                                                  )),
                                                  WidgetSpan(
                                                      child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 1,
                                                        height: 10,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                    ],
                                                  )),
                                                  WidgetSpan(
                                                    child: Icon(
                                                      Icons.calendar_month,
                                                      size: 16,
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 0, left: 5),
                                                      child: Text(
                                                        familyList[index]
                                                            ["year"],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        if (index % 2 == 0)
                                          RichText(
                                            textAlign: TextAlign.left,
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Icon(
                                                    Icons.timelapse,
                                                    color: Colors.redAccent,
                                                    size: 16,
                                                  ),
                                                ),
                                                WidgetSpan(
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 0, left: 5),
                                                    child: Text(
                                                      "Last requested : ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.redAccent,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 12),
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
                                                        fontSize: 12),
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: RichText(
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                  children: [
                                                    WidgetSpan(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 5,
                                                                top: 5),
                                                        child: Icon(
                                                          Icons.map,
                                                          color: Colors.black,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    WidgetSpan(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 5,
                                                                top: 5),
                                                        child: Text(
                                                          "Navigate me to pick-up point",
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color: Colors
                                                                  .blueAccent,
                                                              decorationThickness:
                                                                  3,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                onTap: () {
                                                  if (index % 2 == 0) {
                                                    MyCustomAlertDialog()
                                                        .showCustomAlert(
                                                            context,
                                                            "Notification",
                                                            "Do you like to request for pickup now?",
                                                            false, () {
                                                      requestPickup(context);
                                                    }, () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                    });
                                                  } else {
                                                    MyCustomAlertDialog()
                                                        .showCustomAlert(
                                                      context,
                                                      "Notification",
                                                      "You are not authorized to pickup",
                                                      false,
                                                      null,
                                                      () => Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop(),
                                                    );
                                                  }
                                                },
                                                child: RichText(
                                                  textAlign: TextAlign.left,
                                                  text: TextSpan(
                                                    children: [
                                                      WidgetSpan(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 5,
                                                                  top: 5,
                                                                  left: 5),
                                                          child: Icon(
                                                            Icons
                                                                .emoji_transportation,
                                                            color: Colors.black,
                                                            size: 16,
                                                          ),
                                                        ),
                                                      ),
                                                      WidgetSpan(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 5,
                                                                  top: 5),
                                                          child: Text(
                                                            "Send a request for pick-up",
                                                            style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                color: Colors
                                                                    .blueAccent,
                                                                decorationThickness:
                                                                    3,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ]);
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
