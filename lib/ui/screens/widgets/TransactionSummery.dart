import 'package:flutter/material.dart';

import '../../../common/HexColor.dart';
import '../../../common/app_settings.dart';

class TransactionSummery extends StatelessWidget {
  final List purchaseList;
  final String CurrencyCode;
  const TransactionSummery(this.purchaseList, this.CurrencyCode);

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
                itemCount: purchaseList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      /* leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(purchaseList[index]['image']),
                        radius: 20,
                      ), */
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            purchaseList[index]['ActionName'],
                            style: TextStyle(
                                color: HexColor(purchaseList[index]['color']),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Container(
                            width: 70,
                           // decoration: BoxDecoration(border: Border.all(color: HexColor(purchaseList[index]['color']),width: 0.5)),
                            child:
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
                                    text: ' ${CurrencyCode} ',
                                    style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                        color: HexColor(
                                            AppSettings.colorCurrencyCode),
                                        fontSize: 12)),
                                TextSpan(
                                    text: purchaseList[index]['Purchase']
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: HexColor(AppSettings.colorCurrencyCode))),
                              ],
                            ),
                          ),
                       ) ],
                      ),
                      /* subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               // "# " + purchaseList[index]['orderID'],
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: 10),
                              ),
                              Text(
                                //"Payment for: " + purchaseList[index]['pay_for'],
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                         RichText(
                            text:TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style:TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                               TextSpan(
                                    text: '${CurrencyCode} ',
                                    style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade500,
                                        fontSize: 12)),
                               TextSpan(
                                    text: purchaseList[index]['Purchase'].toStringAsFixed(2),
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ), */
                      onTap: () {
                        Navigator.of(context).pushNamed('/PurchaseDetails',
                            arguments: purchaseList[index]);
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
