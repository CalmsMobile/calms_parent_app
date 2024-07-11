import 'package:calms_parent_latest/common/app_settings.dart';
import 'package:calms_parent_latest/common/widgets/no_data_card.dart';
import 'package:calms_parent_latest/ui/screens/widgets/MealOrderList.dart';
import 'package:provider/provider.dart';

import '../../../common/common_api.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/util/common_funtions.dart';
import '../cart/cart.dart';
import '/common/HexColor.dart';
import '../../../common/widgets/common.dart';
import 'package:flutter/material.dart';

class MealOrder extends StatefulWidget {
  final arguments;
  final AppTheme_;
  const MealOrder(this.arguments, this.AppTheme_, {Key? key}) : super(key: key);

  @override
  _MealOrderState createState() => _MealOrderState();
}

class _MealOrderState extends State<MealOrder> {
  List familyList = [];
  String imgBaseUrl = "";
  int senderIndex = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    familyList = widget.arguments['familyList'];
    imgBaseUrl = widget.arguments['imgBaseUrl'];
    CommonUtil().getPOConfigForUser(
        context,
        widget.arguments['familyList'][0]['UserSeqId'],
        widget.arguments['familyList'][0]['RefBranchSeqId']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: HexColor(widget.AppTheme_['SecondaryBgColor']),
        //titleSpacing: -5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image(
                width: 50,
                height: 50,
                image: AssetImage("assets/images/ico_back.png"),
              ),
            ), */
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    //margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: HexColor(widget.AppTheme_['SecondaryFrColor']),
                          width: 2),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: HexColor(widget.AppTheme_['SecondaryFrColor']),
                          size: 30,
                        )))),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Meal Order",
                style: TextStyle(
                    color:  HexColor(widget.AppTheme_['SecondaryFrColor']),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
            // Your widgets here
          ],
        ),
        actions: [
          // Navigate to the Search Screen
          if (familyList.length > 0 && senderIndex > -1)
            Container(
              height: 30,
              width: 100,
              margin: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Flexible(
                    child: ListTile(
                      horizontalTitleGap: 2,
                      contentPadding: EdgeInsets.zero,
                      onTap: () => {
                        openMemberBottomSheet(context, familyList, imgBaseUrl,
                            (index) {
                          Navigator.pop(context);
                          senderIndex = index;
                          setState(() {
                            CommonUtil().getPOConfigForUser(
                                context,
                                familyList[index]['UserSeqId'],
                                familyList[index]['RefBranchSeqId']);
                          });
                        })
                      },
                      trailing: familyList[senderIndex]['UserImgPath'] != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(imgBaseUrl +
                                  familyList[senderIndex]["UserImgPath"]),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.blue[700],
                              child: Text(
                                CommonFunctions.getInitials(
                                        familyList[senderIndex]['Name'])
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                    ),
                  ),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CartPage(imgBaseUrl, widget.arguments['profileData'],widget.AppTheme_),
                            ),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      HexColor(widget.AppTheme_['SecondaryFrColor']),
                                  width: 2),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color:
                                      HexColor(widget.AppTheme_['SecondaryFrColor']),
                                  size: 30,
                                )))),
                    Consumer<MySettingsListener>(
                        builder: (context, data, settingsDta) {
                      return Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            data.cartList != []
                                ? data.cartList.length.toString()
                                : "0",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      );
                    })
                  ],
                  ),
                ],
              ),
            ),
        ],
      ),
      //resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            HexColor(widget.AppTheme_['PrimaryBgColor']),
            HexColor(widget.AppTheme_['PrimaryBgColor']),
          ],
        )),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              //color: HexColor("#f5f8fd"),
              margin: EdgeInsets.only(top: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<MySettingsListener>(
                        builder: (context, data, settingsDta) {
                      if (data.poSettings.isNotEmpty) {
                        return data.poTypesList.length > 0
                            ? MealOrderListView(
                                data.poSettings,
                                data.poTypesList,
                                data.poPackagesList,
                                widget.arguments["profileData"]['CurrencyCode'],
                                data.poList,
                                familyList[senderIndex],
                                imgBaseUrl,
                                widget.arguments["profileData"],widget.AppTheme_,
                                getData)
                            : NoDataCard(
                                AppSettings.imgAssetNoMeal,
                                AppSettings.titleNoMeal,
                                AppSettings.msgNoMeal,
                                20);
                      } else {
                        return SizedBox();
                      }
                    }),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
