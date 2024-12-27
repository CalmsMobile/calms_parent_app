import 'package:flutter/material.dart';

import '../../../common/HexColor.dart';
import '../../../common/app_settings.dart';

class HolidayListView extends StatelessWidget {
  final List holidayList;
  final AppTheme_;
  const HolidayListView(this.holidayList, this.AppTheme_);

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
                    Divider(
                      height: 0.1,
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${holidayList[index]['title']}",
                                  style: TextStyle(
                                      color:
                                          HexColor(holidayList[index]['color']),
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15),
                                ),
                                if (holidayList[index]['description'] != null)
                                  Text(
                                    "Description: ${holidayList[index]['description']}",
                                    style: TextStyle(
                                        color: HexColor(
                                            AppTheme_['ContentFontColor']),
                                        fontWeight: FontWeight.normal,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12),
                                  ),
                                if (holidayList[index]['start'] != null &&
                                    holidayList[index]['end'] != null)
                                  Text(
                                    holidayList[index]['start'] ==
                                            holidayList[index]['end']
                                        ? holidayList[index]['start']
                                        : "${holidayList[index]['start']} to ${holidayList[index]['end']}",
                                    style: TextStyle(
                                        color: HexColor(
                                            AppTheme_['ContentFontColor']),
                                        fontWeight: FontWeight.normal,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        /*  Navigator.of(context).pushNamed('/PurchaseDetails',
                            arguments: holidayList[index]); */
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
