import 'package:calms_parent/common/date_util.dart';
import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        title: Text("Campus Tracking"),
      ),
      body: Column(children: [
        Container(
          color: Colors.white24,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 50),
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
                    topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),
                    bottomLeft: Radius.circular(60.0),
                    bottomRight: Radius.circular(60.0),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.filter,
                      size: 16,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      stuData["class"],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 16,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${stuData["contact"] == null ? '--' : stuData["contact"]}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.currency_exchange,
                      size: 16,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'MYR ${double.parse(stuData["balance"]).toStringAsFixed(2)}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  height: 0.1,
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
                Text(
                  "${DateUtil().convertDateNow(DateTime.now(), "dd MMM yyyy hh:mm a")}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 35,
                ),
                Divider(
                  height: 0.2,
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Location",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
                Text(
                  "Block A, UPM, Serdang",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  height: 0.1,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
