import 'package:flutter/material.dart';

class RecentActivityListView extends StatelessWidget {
  final List recentList;
  const RecentActivityListView(this.recentList);

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
                    new Divider(
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
                          Text(
                            recentList[index]['ActionName'],
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
                                    text: 'TOTAL: ',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade500,
                                        fontSize: 12)),
                                new TextSpan(
                                    text: recentList[index]['Total'].toString(),
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
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
                                    text: 'TOTAL: ',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade500,
                                        fontSize: 12)),
                                new TextSpan(
                                    text: recentList[index]['Total'].toString(),
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ), */
                      onTap: () {
                        Navigator.of(context).pushNamed('/PurchaseDetails',
                            arguments: recentList[index]);
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
