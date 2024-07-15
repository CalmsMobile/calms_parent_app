import 'package:flutter/material.dart';

import '../../../common/HexColor.dart';
import '../../../common/app_settings.dart';

class RecentTransactionListView extends StatelessWidget {
  final List recentList;
  final String CurrencyCode;
  const RecentTransactionListView(this.recentList, this.CurrencyCode);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: recentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      /* leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(recentList[index]['image']),
                        radius: 20,
                      ), */
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recentList[index]['ActionName'],
                                style: TextStyle(
                                    color: HexColor(recentList[index]['color']),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                               Text(
                                recentList[index]['CreatedOn'].toString().substring(0,10),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          Container(
                            width: 70,
                            child: RichText(
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' ${CurrencyCode} ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: HexColor(
                                              AppSettings.colorCurrencyCode),
                                          fontSize: 12)),
                                  TextSpan(
                                      text: recentList[index]['Total']
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: HexColor(
                                              AppSettings.colorCurrencyCode))),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      /* subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               // "# " + recentList[index]['orderID'],
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: 10),
                              ),
                              Text(
                                //"Payment for: " + recentList[index]['pay_for'],
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'TOTAL: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade500,
                                        fontSize: 12)),
                                TextSpan(
                                    text: recentList[index]['Total'].toString(),
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ), */
                      onTap: () {
                       /*  Navigator.of(context).pushNamed('/PurchaseDetails',
                            arguments: recentList[index]); */
                      },
                    )
                  ]);
                }),
          ),
        ],
      ),
    );
  }
}
