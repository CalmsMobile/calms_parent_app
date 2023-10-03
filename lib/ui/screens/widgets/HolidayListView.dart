import 'package:flutter/material.dart';

class HolidayListView extends StatelessWidget {
  final List holidayList;
  const HolidayListView(this.holidayList);

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
                        Navigator.of(context).pushNamed('/PurchaseDetails',
                            arguments: holidayList[index]);
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
