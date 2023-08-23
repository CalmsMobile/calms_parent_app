import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HolidayListItemView extends StatelessWidget {
  const HolidayListItemView(this.holidayList);
  final List holidayList;
  @override
  Widget build(BuildContext context) {
    print("================");
    print(holidayList);
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
                            NetworkImage(holidayList[index]['ImgPathUrl']),
                        radius: 30,
                      ), */
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              child: Text(
                                holidayList[index]['title'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
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
                                        fontSize: 14)),
                                new TextSpan(
                                    text: holidayList[index]['SellingPrice'].toString(),
                                    style: new TextStyle(fontSize: 14)),
                              ],
                            ),
                          ), */
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            holidayList[index]['description'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.grey.shade500),
                          )
                        ],
                      ),
                      onTap: () {
                       // Navigator.of(context).pushNamed('/StoreDetails', arguments: holidayList[index]);
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
