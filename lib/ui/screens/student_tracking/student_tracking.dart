import 'package:calms_parent/common/widgets/select_member.dart';
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
      appBar: getMyAppbar("Student Tracking", []),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
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
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          margin: EdgeInsets.only(left: 5, right: 5),
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
                              top: index == 0 ? 0 : 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                familyList[index]["name"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.filter,
                                          size: 14,
                                        ),
                                      ),
                                      WidgetSpan(
                                          child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 0, left: 8),
                                        child: Text(
                                          familyList[index]["class"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12),
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
                                          size: 14,
                                        ),
                                      ),
                                      WidgetSpan(
                                          child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 0, left: 8),
                                        child: Text(
                                          familyList[index]["year"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12),
                                        ),
                                      )),
                                    ]),
                                  ),
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.route,
                                            size: 14,
                                          ),
                                        ),
                                        WidgetSpan(
                                            child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: 0, left: 8),
                                          child: Text(
                                            "KLIA Airport",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12),
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
                                            size: 14,
                                          ),
                                        ),
                                        WidgetSpan(
                                            child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: 0, left: 8),
                                          child: Text(
                                            "ACTIVE",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12),
                                          ),
                                        )),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.directions_bus,
                                            size: 14,
                                          ),
                                        ),
                                        WidgetSpan(
                                            child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: 0, left: 8),
                                          child: InkWell(
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(
                                              //     '/BusTracking',
                                              //     arguments: {
                                              //       'student':
                                              //           familyList[index],
                                              //     });

                                              Navigator.of(context).pushNamed(
                                                  '/CampusTracking',
                                                  arguments: {
                                                    'student':
                                                        familyList[index],
                                                    'type': 'BusTracking'
                                                  });
                                            },
                                            child: Text(
                                              "Bus Tracking",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.blueAccent,
                                                  decorationThickness: 3,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12),
                                            ),
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
                                            Icons.school,
                                            size: 14,
                                          ),
                                        ),
                                        WidgetSpan(
                                            child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: 0, left: 8),
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
                                            child: Text(
                                              "Campus Tracking",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.blueAccent,
                                                  decorationThickness: 3,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        )),
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
                    )
                  ]);
                }),
          ),
        ]),
      ),
    );
  }
}
