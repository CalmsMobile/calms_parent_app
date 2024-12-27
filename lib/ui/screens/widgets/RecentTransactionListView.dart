import 'package:flutter/material.dart';

import '../../../common/HexColor.dart';
import '../../../common/app_settings.dart';
import '../../../common/date_util.dart';

class RecentTransactionListView extends StatelessWidget {
  final List recentList;
  final String CurrencyCode;
  final title;
  final AppTheme_;
  final bool showMore;
  const RecentTransactionListView(this.recentList, this.CurrencyCode,
      this.AppTheme_, this.showMore, this.title);

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
                itemCount: showMore ? 10 : recentList.length,
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${recentList[index]['ActionName']} ${recentList[index]['ConfigName'] != null ? '(' + recentList[index]['ConfigName'] + ')' : ''}",
                                  style: TextStyle(
                                      color:
                                          HexColor(recentList[index]['color']),
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15),
                                ),
                                if (recentList[index]['PackageName'] != null)
                                  Text(
                                    "Package: ${recentList[index]['PackageName']}",
                                    style: TextStyle(
                                        color: HexColor(
                                            AppTheme_['ContentFontColor']),
                                        fontWeight: FontWeight.normal,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12),
                                  ),
                                if (recentList[index]['ThroughBy'] != null)
                                  Text(
                                    "Trans. Mode: ${recentList[index]['ThroughBy']}",
                                    style: TextStyle(
                                        color: HexColor(
                                            AppTheme_['ContentFontColor']),
                                        fontWeight: FontWeight.normal,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12),
                                  ),
                                Text(
                                  "Done by: ${recentList[index]['DoneBy']}",
                                  style: TextStyle(
                                      color: HexColor(
                                          AppTheme_['ContentFontColor']),
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12),
                                ),
                                Text(
                                  "Trans. Date: ${DateUtil().convertStringFromDateformat(recentList[index]['CreatedOn'], "dd-MM-yyyy hh:mm a")}",
                                  style: TextStyle(
                                      color: HexColor(
                                          AppTheme_['ContentFontColor']),
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 70,
                            child: RichText(
                              textAlign: TextAlign.end,
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
                      onTap: () {
                        /*  Navigator.of(context).pushNamed('/PurchaseDetails',
                            arguments: recentList[index]); */
                      },
                    )
                  ]);
                }),
          ),
          if (showMore)
            InkWell(
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return Scaffold(
                        appBar: AppBar(
                          backgroundColor:
                              HexColor(AppTheme_['AppHeaderBgColor']),
                          title: Text(title),
                          leading: IconButton(
                            icon: Icon(Icons.close,
                                color: HexColor(AppTheme_['IconOutlineColor'])),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        body: Container(
                            constraints: BoxConstraints.expand(),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.white,
                                Colors.white,
                              ],
                            )),
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: SingleChildScrollView(
                                  child: RecentTransactionListView(recentList,
                                      CurrencyCode, AppTheme_, false, title),
                                ))));
                  },
                ));
              },
              child: Text(
                'Show More',
                style: TextStyle(
                  color: HexColor(AppTheme_['ButtonBgColor']),
                  fontSize: 16.0,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
