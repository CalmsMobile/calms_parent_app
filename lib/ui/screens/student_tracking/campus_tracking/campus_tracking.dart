import 'package:calms_parent/common/date_util.dart';
import 'package:calms_parent/common/widgets/select_member.dart';
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
          rcvdData['type'] == 'BusTracking'
              ? "Bus Tracking"
              : "Campus Tracking",
          []),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            color: Colors.white24,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(65.0),
                      topRight: Radius.circular(65.0),
                      bottomLeft: Radius.circular(65.0),
                      bottomRight: Radius.circular(65.0),
                    ),
                    child: Image.network(stuData['image'] != null
                        ? stuData['image']
                        : Image.asset("assets/images/user.png")),
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.filter,
                              size: 16,
                            ),
                          ),
                          WidgetSpan(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 0, left: 8),
                            child: Text(
                              stuData["class"],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
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
                              Icons.calendar_month,
                              size: 16,
                            ),
                          ),
                          WidgetSpan(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 0, left: 8),
                            child: Text(
                              stuData["year"],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
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
                              ),
                            ),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "KLIA Airport",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
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
                                size: 16,
                              ),
                            ),
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 0, left: 8),
                              child: Text(
                                "ACTIVE",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            )),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                    "Block A, UPM, Serdang",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Text(
                      "Vehicle Info",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
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
                                    fontSize: 16),
                              ),
                            )),
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 0, left: 8),
                          child: Text(
                            "BN1234",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                                    fontSize: 16),
                              ),
                            )),
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 0, left: 8),
                          child: Text(
                            "Bus",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                                    fontSize: 16),
                              ),
                            )),
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 0, left: 8),
                          child: Text(
                            "ADAM HENDRY JOHN",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16),
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
