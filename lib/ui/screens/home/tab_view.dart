import 'package:calms_parent/common/HexColor.dart';
import 'package:calms_parent/ui/screens/activities/Activities.dart';
import 'package:calms_parent/ui/screens/home/Home.dart';
import 'package:calms_parent/ui/screens/invoice/InvoicePayment.dart';
import 'package:calms_parent/ui/screens/stores/Store.dart';
import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  const TabView(this.tabController, this.tabsList, this.familyList,
      this.familyPos, this.pageSwiped);

  final TabController tabController;
  final List<Map> tabsList;
  final int familyPos;
  final List<Map> familyList;

  final Function pageSwiped;
  @override
  Widget build(BuildContext context) {
    print(familyPos);
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          child: Scaffold(
            backgroundColor: Colors.white70,
            bottomNavigationBar: SizedBox(
              height: kToolbarHeight,
              child: Container(
                color: HexColor("#E6E6FE"),
                child: TabBar(
                  indicatorColor: HexColor("#364095"),
                  labelColor: HexColor("#364095"),
                  unselectedLabelColor: Colors.black38,
                  controller: tabController,
                  isScrollable: false,
                  labelPadding: EdgeInsets.only(left: 0, right: 0),
                  tabs: List<Widget>.generate(tabsList.length, (int index) {
                    return new Tab(
                      iconMargin: EdgeInsets.zero,
                      icon: Icon(index == 0
                          ? Icons.home
                          : tabsList[index]['title'] == "Stores"
                              ? Icons.shopping_bag_outlined
                              : tabsList[index]['title'] == "Invoice"
                                  ? Icons.cloud_upload_outlined
                                  : tabsList[index]['title'] == "Activities"
                                      ? Icons.bike_scooter
                                      : Icons.settings),
                    );
                  }),
                ),
              ),
            ),
            body: TabBarView(
                controller: tabController,
                children: List<Widget>.generate(tabsList.length, (int index) {
                  return index == 0
                      ? new HomePage(familyPos, familyList, pageSwiped)
                      : tabsList[index]['title'] == "Stores"
                          ? Stores()
                          : tabsList[index]['title'] == "Invoice"
                              ? InvoicePayment()
                              : tabsList[index]['title'] == "Activities"
                                  ? Activities()
                                  : new Text(tabsList[index]['title']);
                })),
          ),
        ),
      ],
    );
  }
}
