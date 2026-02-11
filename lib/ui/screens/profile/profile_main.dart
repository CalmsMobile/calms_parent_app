import '../../../common/HexColor.dart';
import '../../../common/app_settings.dart';
import '../../../common/util/common_funtions.dart';
import '../../../common/widgets/common.dart';
import 'package:flutter/material.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  bool isSwitchedTopup = false;
  bool isSwitchedMFPTopup = false;
  bool isSwitchedCounterTopup = false;
  bool isSwitchedMFPCounterTopup = false;

  String limitType = '';
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    final profileData = data['profileData'];
    final imgBaseUrl = data['imgBaseUrl'];
    final CurrencyCode = data['CurrencyCode'];
    final AppTheme_ = data['AppTheme_'];

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: HexColor(AppTheme_['AppHeaderBgColor']),
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
                            color: HexColor(AppTheme_['IconOutlineColor']),
                            width: 0.5),
                        color: HexColor(AppTheme_['IconBgColor']),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: HexColor(AppTheme_['IconOutlineColor']),
                            size: 25,
                          )))),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: HexColor(AppTheme_['AppHeaderFontColor']),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
              // Your widgets here
            ],
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              HexColor(AppTheme_['AppBgColor']),
              HexColor(AppTheme_['AppBgColor']),
            ],
          )),
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      textDirection: TextDirection.rtl,
                      fit: StackFit.loose,
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            if (profileData['UserImgPath'] != null)
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                    imgBaseUrl + profileData["UserImgPath"]),
                                radius: 72,
                              )
                            else
                              CircleAvatar(
                                backgroundColor: HexColor(AppTheme_['IconBgColor']),
                                radius: 72,
                                child: Text(
                                  CommonFunctions.getInitials(
                                          profileData['Name'])
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 32.0,
                                      color: HexColor(AppTheme_['IconOutlineColor']),
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.edit_note,
                                color: Colors.grey.shade900,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      profileData["Name"],
                      style:
                          TextStyle(fontSize: 20,color:HexColor(AppTheme_['TitleFontColor']), fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Wallet Ballance",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: HexColor(AppTheme_['SubTitleFontColor']),
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '${CurrencyCode} ${profileData["Balance"].toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: HexColor(AppSettings.colorCurrencyCode),
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Card(
                      color:  HexColor(AppTheme_['PanelBgColor']),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        borderOnForeground: true,
                        margin: EdgeInsets.all(20),
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/ico_id.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "ID",
                                            style: TextStyle(
                                              color: HexColor(AppTheme_['SubTitleFontColor']),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            profileData["MemberId"] != null &&
                                                    profileData["MemberId"] !=
                                                        ""
                                                ? "" + profileData["MemberId"]!
                                                : "--",
                                            style: TextStyle(
                                                color: HexColor(AppTheme_['ContentFontColor']),
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/ico_email.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "Email",
                                            style: TextStyle(
                                              color: HexColor(AppTheme_['SubTitleFontColor']),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            profileData["Email"] != null &&
                                                    profileData["Email"] != ""
                                                ? "" + profileData["Email"]!
                                                : "--",
                                            style: TextStyle(
                                                color: HexColor(AppTheme_['ContentFontColor']),
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/ico_contact.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "Contact",
                                            style: TextStyle(
                                              color: HexColor(AppTheme_['SubTitleFontColor']),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            profileData["ContactNo"] != null &&
                                                    profileData["ContactNo"] !=
                                                        ""
                                                ? "" + profileData["ContactNo"]!
                                                : "--",
                                            style: TextStyle(
                                                color: HexColor(AppTheme_['ContentFontColor']),
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, bottom: 0, right: 20, top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                          width: 50,
                                          height: 50,
                                          image: AssetImage(
                                              'assets/images/ico_relatioship.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "Relationship",
                                            style: TextStyle(
                                              color: HexColor(AppTheme_['SubTitleFontColor']),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            profileData["RelationShip"] !=
                                                        null &&
                                                    profileData[
                                                            "RelationShip"] !=
                                                        ""
                                                ? "" +
                                                    profileData["RelationShip"]!
                                                : "--",
                                            style: TextStyle(
                                                color: HexColor(AppTheme_['ContentFontColor']),
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              if (profileData['MemberType'] == "Student")
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, bottom: 0, right: 20, top: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image(
                                            width: 50,
                                            height: 50,
                                            image: AssetImage(
                                                'assets/images/ico_grade.png')),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              "Grade",
                                              style: TextStyle(
                                                color: HexColor(AppTheme_['SubTitleFontColor']),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              profileData["Grade"] != null &&
                                                      profileData["Grade"] != ""
                                                  ? "" + profileData["Grade"]!
                                                  : "--",
                                              style: TextStyle(
                                                  color: HexColor(AppTheme_['ContentFontColor']),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              if (profileData['MemberType'] == "Student")
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, bottom: 0, right: 20, top: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image(
                                            width: 50,
                                            height: 50,
                                            image: AssetImage(
                                                'assets/images/ico_year.png')),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              "Year",
                                              style: TextStyle(
                                                color: HexColor(AppTheme_['SubTitleFontColor']),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              profileData["Year"] != null &&
                                                      profileData["Year"] != ""
                                                  ? "" + profileData["Year"]!
                                                  : "--",
                                              style: TextStyle(
                                                  color: HexColor(AppTheme_['ContentFontColor']),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              if (profileData['MemberType'] == "Student")
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, bottom: 0, right: 20, top: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image(
                                            width: 50,
                                            height: 50,
                                            image: AssetImage(
                                                'assets/images/ico_class.png')),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              "Class",
                                              style: TextStyle(
                                                color: HexColor(AppTheme_['SubTitleFontColor']),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              profileData["Class"] != null &&
                                                      profileData["Class"] != ""
                                                  ? "" + profileData["Class"]!
                                                  : "--",
                                              style: TextStyle(
                                                  color: HexColor(AppTheme_['ContentFontColor']),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                            ])))
                  ],
                ),
              )),
        ));
  }

  void openLimitTypeBottomSheet(BuildContext buildContext) {
    List<String> limitTypeList = ["BLOCKED", "LIMITTED", "UNLIMITTED"];
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: limitTypeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        title: new Text(limitTypeList[index]),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            limitType = limitTypeList[index];
                          });
                        },
                      ),
                    ]);
                  })
            ],
          );
        });
  }
}
