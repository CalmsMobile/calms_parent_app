import '/common/HexColor.dart';
import '/common/widgets/select_member.dart';
import 'package:flutter/material.dart';

class StudentTracking extends StatefulWidget {
  const StudentTracking({Key? key}) : super(key: key);

  @override
  State<StudentTracking> createState() => _StudentTrackingState();
}

class _StudentTrackingState extends State<StudentTracking> {
  List<Map> familyList = [
    {
      "name": "Desmond",
      "category": "PARENT",
      "desc": "",
      "class": "Class1",
      "year": "Year1",
      "contact": "0123467589",
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
      "contact": "0123467589",
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
      "year": "Year3",
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
      "year": "Year4",
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
      "year": "Year6",
      "desc": "",
      "image": "https://randomuser.me/api/portraits/men/4.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMyAppbar(context,"Student Tracking", []),
      body: SingleChildScrollView(
        child: Container(
          color: HexColor("#f5f8fd"),
          child: Column(children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: familyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          Container(
                            padding: EdgeInsets.only(
                                top: index == 0 ? 15 : 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: Text(
                                    familyList[index]["name"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
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
                                Container(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 5, left: 4, top: 4),
                                        child: Image.asset(
                                          "assets/images/ico_trackingbus.png",
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  '/CampusTracking',
                                                  arguments: {
                                                    'student':
                                                        familyList[index],
                                                    'type': 'BusTracking'
                                                  });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 0, left: 0),
                                              child: Text(
                                                "Bus Tracking",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          )),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 5, left: 4, top: 4),
                                        child: Image.asset(
                                          "assets/images/ico_trackingcollege.png",
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  '/CampusTracking',
                                                  arguments: {
                                                    'student':
                                                        familyList[index],
                                                    'type': 'CampusTracking'
                                                  });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 0, left: 0),
                                              child: Text(
                                                "Campus Tracking",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          )),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 5, left: 8, top: 0),
                                        child: Image.asset(
                                          "assets/images/ico_status.png",
                                          width: 12,
                                          height: 12,
                                        ),
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 3),
                                                padding: EdgeInsets.only(
                                                    bottom: 0,
                                                    left: 2,
                                                    right: 8),
                                                child: Text(
                                                  "Status",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 3),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Text("Active",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 10)),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 3),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Text("Inactive",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 10)),
                                              )
                                            ],
                                          ))
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),

                                // Container(
                                //   color: Colors.white24,
                                //   margin: EdgeInsets.only(top: 8),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Expanded(
                                //         child: DecoratedBox(
                                //           decoration: BoxDecoration(
                                //             border: Border(
                                //               top: BorderSide(
                                //                   width: 1,
                                //                   color: Colors.grey.shade300),
                                //             ),
                                //           ),
                                //           child: TextButton(
                                //             onPressed: () {
                                //               Navigator.of(context).pushNamed(
                                //                   '/BusTracking',
                                //                   arguments: {
                                //                     'student': familyList[index],
                                //                   });
                                //             },
                                //             child: Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.start,
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Icon(
                                //                   Icons.bus_alert,
                                //                   size: 16,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 4,
                                //                 ),
                                //                 Text(
                                //                   'Bus tracking',
                                //                   textAlign: TextAlign.center,
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       Expanded(
                                //         child: DecoratedBox(
                                //           decoration: BoxDecoration(
                                //             border: Border(
                                //               left: BorderSide(
                                //                   width: 1,
                                //                   color: Colors.grey.shade300),
                                //               top: BorderSide(
                                //                   width: 1,
                                //                   color: Colors.grey.shade300),
                                //             ),
                                //           ),
                                //           child: TextButton(
                                //             onPressed: () {
                                //               Navigator.of(context).pushNamed(
                                //                   '/CampusTracking',
                                //                   arguments: {
                                //                     'student': familyList[index],
                                //                   });
                                //             },
                                //             child: Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.start,
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Icon(
                                //                   Icons.school,
                                //                   size: 16,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 4,
                                //                 ),
                                //                 Text(
                                //                   'Campus tracking',
                                //                   textAlign: TextAlign.center,
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
