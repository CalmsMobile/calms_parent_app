import '/common/HexColor.dart';
import '/common/date_util.dart';
import '../../../../common/widgets/common.dart';
import 'package:flutter/material.dart';

class CampusTracking extends StatefulWidget {
  const CampusTracking({Key? key}) : super(key: key);

  @override
  State<CampusTracking> createState() => _CampusTrackingState();
}

class _CampusTrackingState extends State<CampusTracking> {
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> rcvdData =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    Map<dynamic, dynamic> stuData =
        rcvdData['student'] as Map<dynamic, dynamic>;
    print(rcvdData);
    return Scaffold(
      appBar: getMyAppbar(
          false,
          context,
          rcvdData['type'] == 'BusTracking'
              ? "Bus Tracking"
              : "Campus Tracking",
          []),
      body: Container(
        color: HexColor("#f5f8fd"),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5.0,
                ),
              ],
            ),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(65.0)),
                    child: stuData['image'] != null
                        ? Image.network(
                            stuData['image'],
                            width: 60,
                            height: 60,
                          )
                        : Image.asset(
                            "assets/images/user.png",
                            width: 60,
                            height: 60,
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${stuData['name']}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.school_outlined,
                              size: 18,
                              color: Colors.blueAccent,
                            ),
                          ),
                          WidgetSpan(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 0, left: 8),
                            child: Text(
                              stuData["class"],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 10),
                            ),
                          )),
                        ]),
                      ),
                      Container(
                        width: 1,
                        height: 15,
                        color: Colors.blueAccent,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.calendar_month,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                          WidgetSpan(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 0, left: 8),
                            child: Text(
                              stuData["year"],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 10),
                            ),
                          )),
                        ]),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.route,
                                size: 16,
                                color: Colors.blueAccent,
                              ),
                            ),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "KLIA Airport",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10),
                              ),
                            )),
                          ]),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            WidgetSpan(
                              child: Container(width: 10),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.flag,
                                size: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "ACTIVE",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10),
                              ),
                            )),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 70),
                    child: Divider(
                      height: 0.1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Last kown time",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  Text(
                    "${DateUtil().convertDateNow(DateTime.now(), "dd MMM yyyy hh:mm a")}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 70),
                    child: Divider(
                      height: 0.8,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Last kown location",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  Text(
                      rcvdData['type'] == 'BusTracking'
                          ? "10.000122 : 7.324565"
                          : "Block A, UPM, Serdang",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blueAccent,
                          decorationThickness: 3)),
                  SizedBox(
                    height: 15,
                  ),
                  if (rcvdData['type'] == 'BusTracking')
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 70),
                      child: Divider(
                        height: 0.8,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  if (rcvdData['type'] == 'BusTracking')
                    SizedBox(
                      height: 15,
                    ),
                  if (rcvdData['type'] == 'BusTracking')
                    Text(
                      "Estimated time to reach",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                  if (rcvdData['type'] == 'BusTracking')
                    Text("1 Hrs 30 Min",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.greenAccent,
                        )),
                  if (rcvdData['type'] == 'BusTracking')
                    SizedBox(
                      height: 15,
                    ),
                  if (rcvdData['type'] == 'BusTracking')
                    Container(
                      padding:
                          EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                      width: double.infinity,
                      child: Text(
                        "Vehicle Info",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (rcvdData['type'] == 'BusTracking')
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.directions_bus,
                                  size: 18,
                                ),
                              ),
                              WidgetSpan(
                                  child: Container(
                                padding: EdgeInsets.only(bottom: 0, left: 8),
                                child: Text(
                                  "Vehicle No#",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              )),
                            ]),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 0, left: 8),
                            child: Text(
                              "BN1234",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (rcvdData['type'] == 'BusTracking')
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.emoji_transportation,
                                  size: 18,
                                ),
                              ),
                              WidgetSpan(
                                  child: Container(
                                padding: EdgeInsets.only(bottom: 0, left: 8),
                                child: Text(
                                  "Vehicle Type",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              )),
                            ]),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 0, left: 8),
                            child: Text(
                              "Bus",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (rcvdData['type'] == 'BusTracking')
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.person,
                                  size: 18,
                                ),
                              ),
                              WidgetSpan(
                                  child: Container(
                                padding: EdgeInsets.only(bottom: 0, left: 8),
                                child: Text(
                                  "Driver Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              )),
                            ]),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 0, left: 8),
                            child: Text(
                              "ADAM HENDRY JOHN",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
