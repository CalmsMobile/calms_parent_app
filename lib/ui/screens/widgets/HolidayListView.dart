import 'package:flutter/material.dart';

import '../../../common/app_settings.dart';

class HolidayListView extends StatelessWidget {
  final List holidayList;
  const HolidayListView(this.holidayList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (holidayList.isNotEmpty)
            Container(
              width: double.infinity,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: holidayList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        /* leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(holidayList[index]['image']),
                        radius: 20,
                      ), */
                        title: Text(
                          holidayList[index]['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        subtitle: Text(
                          "Description: " + holidayList[index]['description'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                              fontSize: 10),
                        ),
                        onTap: () {
                         /*  Navigator.of(context).pushNamed('/PurchaseDetails',
                              arguments: holidayList[index]); */
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
