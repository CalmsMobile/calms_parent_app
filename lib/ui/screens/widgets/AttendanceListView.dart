import 'package:flutter/material.dart';

import '../../../common/app_settings.dart';

class AttendanceListView extends StatelessWidget {
  final List attendanceList;
  const AttendanceListView(this.attendanceList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           if (attendanceList.isNotEmpty)
          Container(
            width: double.infinity,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: attendanceList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    new Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      /* leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(attendanceList[index]['image']),
                        radius: 20,
                      ), */
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            attendanceList[index]['Status'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          new RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: '',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade500,
                                        fontSize: 10)),
                                new TextSpan(
                                    //text: attendanceList[index]['date'],
                                    text: '',
                                    style: new TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 10)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               // "# " + attendanceList[index]['orderID'],
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: 10),
                              ),
                              Text(
                                //"Payment for: " + attendanceList[index]['pay_for'],
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          /* new RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: 'RM: ',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade500,
                                        fontSize: 12)),
                                new TextSpan(
                                    text: attendanceList[index]['Purchase'].toString(),
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                         */],
                      ),
                      onTap: () {
                       /*  Navigator.of(context).pushNamed('/PurchaseDetails',
                            arguments: attendanceList[index]); */
                      },
                    )
                  ]);
                }),
          )
           else
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                      padding:
                          EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                      margin: EdgeInsets.zero,
                      height: 100,
                      color: Colors.transparent,
                      child: Image.asset(AppSettings.imgAssetNoTxn)),
                  /* Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      top: 10, bottom: 10),
                                                  child: Text(
                                                    "",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ), */
                ],
              ),
            ),
        
        ],
      ),
    );
  }
}
