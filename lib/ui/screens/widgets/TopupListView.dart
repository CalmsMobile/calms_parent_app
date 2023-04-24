import 'package:flutter/material.dart';

class TopupListView extends StatelessWidget {
  final List<Map> recentActivities;
  const TopupListView(this.recentActivities);

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
                itemCount: recentActivities.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    new Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(recentActivities[index]['image']),
                        radius: 20,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            recentActivities[index]['name'],
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
                                    text: recentActivities[index]['date'],
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
                          Text(
                            "Topup via: " +
                                recentActivities[index]['mode_of_topup'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500,
                                fontSize: 10),
                          ),
                          new RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: 'RM: ',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade500,
                                        fontSize: 14)),
                                new TextSpan(
                                    text: recentActivities[index]['amount'],
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/TopupDetails',
                            arguments: recentActivities[index]);
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
