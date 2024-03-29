import 'package:flutter/material.dart';

class UpcomingActivityListView extends StatelessWidget {
  const UpcomingActivityListView(this.upcomingActivityList);
  final List<Map> upcomingActivityList;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: upcomingActivityList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    new Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(upcomingActivityList[index]['image']),
                        radius: 30,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              upcomingActivityList[index]['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Text(
                            "Due date: " +
                                upcomingActivityList[index]['enddate'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.grey.shade500),
                          )
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Type: " +
                                    upcomingActivityList[index]['doctype'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.grey.shade500),
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
                                            fontSize: 16)),
                                    new TextSpan(
                                        text: upcomingActivityList[index]
                                            ['price']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Category: " +
                                    upcomingActivityList[index]['category'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      isThreeLine: true,
                      onTap: () => {
                        Navigator.of(context).pushNamed('/ActivityDetails',
                            arguments: upcomingActivityList[index])
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
