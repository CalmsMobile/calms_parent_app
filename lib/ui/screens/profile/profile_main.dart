import '../../../common/util/common_funtions.dart';
import '/common/widgets/select_member.dart';
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

    return Scaffold(
        appBar: getMyAppbar("Profile", []),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 246, 249, 254),
              Color.fromARGB(255, 230, 231, 239),
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
                                backgroundColor: Colors.blue[700],
                                radius: 72,
                                child: Text(
                                  CommonFunctions.getInitials(
                                      profileData['Name']),
                                  style: TextStyle(
                                      fontSize: 32.0,
                                      color: Colors.white,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            /*  Container(
                              decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: RichText(
                                text: new TextSpan(
                                  text: "Balance ",
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text:
                                            "RM ${profileData["Balance"].toString()}",
                                        style: new TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: " ",
                                      style: new TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.account_balance_wallet,
                                      color: Colors.black,
                                    ))
                                  ],
                                ),
                              ),
                            ),
                           */
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
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Wallet Ballance",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'MYR ${profileData["Balance"].toString()}',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue[700],
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold),
                    ),
                    /* SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.mail,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            text: " Email ",
                            style: new TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            text: profileData["email"] != null &&
                                    profileData["email"] != ""
                                ? " " + profileData["email"]
                                : " --",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.phone_android,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            text: " Contact ",
                            style: new TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            text: profileData["contact"] != null &&
                                    profileData["contact"] != ""
                                ? " " + profileData["contact"]
                                : " --",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: new TextSpan(
                        text: "",
                        style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.category,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                          TextSpan(
                            text: " Member ID ",
                            style: new TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: profileData["category"],
                              style: new TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    if (profileData["category"] == "PARENT" ||
                        profileData["category"] == "STUDENT")
                      SizedBox(
                        height: 10,
                      ),
                    if (profileData["category"] == "PARENT" ||
                        profileData["category"] == "STUDENT")
                      RichText(
                        text: new TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " Family ID ",
                              style: new TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: profileData["RefUserSeqId"].toString(),
                                style: new TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (profileData["category"] == "PARENT")
                      RichText(
                        text: new TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " Relationship ",
                              style: new TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                //text: profileData["relationship"],
                                text: "relationship",
                                style: new TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    if (profileData["category"] == "STUDENT")
                      RichText(
                        text: new TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " Grade ",
                              style: new TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                //text: profileData["grade"],
                                text: "grade",
                                style: new TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    if (profileData["category"] == "STUDENT")
                      SizedBox(
                        height: 10,
                      ),
                    if (profileData["category"] == "STUDENT")
                      RichText(
                        text: new TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " Year ",
                              style: new TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                // text: profileData["year"],
                                text: "year",
                                style: new TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    if (profileData["category"] == "STUDENT")
                      SizedBox(
                        height: 10,
                      ),
                    if (profileData["category"] == "STUDENT")
                      RichText(
                        text: new TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " Class ",
                              style: new TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                //text: profileData["class"],
                                text: "class",
                                style: new TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    if (profileData["category"] == "STAFF")
                      RichText(
                        text: new TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " Department ",
                              style: new TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                //text: profileData["department"],
                                text: "department",
                                style: new TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    if (profileData["category"] == "STAFF")
                      SizedBox(
                        height: 10,
                      ),
                    if (profileData["category"] == "STAFF")
                      RichText(
                        text: new TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " Job Title ",
                              style: new TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                //text: profileData["job_title"],
                                text: "job_title",
                                style: new TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                     */
                    Column(children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6)),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          borderOnForeground: true,
                          margin: EdgeInsets.only(
                              top: 0, bottom: 10, left: 10, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(10),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "EMAIL",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                profileData['Email'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "CONTACT",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                profileData['ContactNo'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          borderOnForeground: true,
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          child: Column(
                            children: [
                              /* Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                margin: EdgeInsets.all(0),
                                width: double.infinity,
                                color: Colors.grey.shade300,
                                child: Text(
                                  "TOPUP CONTROL",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                             */
                              Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 10.0, bottom: 10.0),
                                  margin: EdgeInsets.zero,
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: Text(
                                    "TOPUP CONTROL",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Self-Service Topup Terminal",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                height: 25,
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 0.0, bottom: 0.0),
                                margin: EdgeInsets.symmetric(vertical: 0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Do you allow to Topup Wallet?",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Switch(
                                        value: isSwitchedTopup,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitchedTopup = value;
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black38, width: .3),
                                  ),
                                ),
                                height: 35,
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 0.0, bottom: 20.0),
                                margin: EdgeInsets.only(top: 10),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Do you allow to Topup MFP Topup?",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Switch(
                                        value: isSwitchedMFPTopup,
                                        onChanged: (value) {
                                          setState(() {
                                            print(isSwitchedMFPTopup);
                                            print(value);
                                            isSwitchedMFPTopup = value;
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 0, left: 10, right: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Counter Topup Terminal",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                height: 25,
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 0,
                                    top: 10.0,
                                    bottom: 0.0),
                                margin: EdgeInsets.symmetric(vertical: 0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Do you allow to Topup Wallet?",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Switch(
                                        value: isSwitchedCounterTopup,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitchedCounterTopup = value;
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black38, width: .3),
                                  ),
                                ),
                                height: 45,
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                margin: EdgeInsets.symmetric(vertical: 0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Do you allow to Topup MFP Topup?",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Switch(
                                        value: isSwitchedMFPCounterTopup,
                                        onChanged: (value) {
                                          setState(() {
                                            print(isSwitchedMFPCounterTopup);
                                            print(value);
                                            isSwitchedMFPCounterTopup = value;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          borderOnForeground: true,
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          child: Column(
                            children: [
                              /*  Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                margin: EdgeInsets.all(0),
                                width: double.infinity,
                                color: Colors.grey.shade300,
                                child: Text(
                                  "VENDOR PURCHASE LIMIT",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ), */
                              Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 10.0, bottom: 10.0),
                                  margin: EdgeInsets.zero,
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: Text(
                                    "VENDOR PURCHASE LIMIT",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 0.0, bottom: 0.0),
                                margin: EdgeInsets.symmetric(vertical: 0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 35,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                                "http://103.6.163.49:2008/FS/Merchant/04ff-e4c2-2021-11-24-15-58-30-844/coffee-and-cafe-logo-design-inspiration-vector-31020950.jpg"),
                                            radius: 30,
                                          ),
                                        ),
                                        Text(
                                          "Cafe",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Limit Type",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: InkWell(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    limitType == ""
                                                        ? "Limit Type"
                                                        : limitType,
                                                    style: new TextStyle(
                                                        fontSize: 12)),
                                                Icon(
                                                  Icons
                                                      .arrow_drop_down_outlined,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                            onTap: () =>
                                                openLimitTypeBottomSheet(
                                                    context),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6)),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          borderOnForeground: true,
                          margin: EdgeInsets.only(
                              top: 0, bottom: 10, left: 20, right: 20),
                          child: Column(
                            children: [
                              /* Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 0, bottom: 10.0),
                                margin: EdgeInsets.all(0),
                                width: double.infinity,
                                color: Colors.grey.shade300,
                                child: Text(
                                  "TOPUP LOW BALANCE ALERT",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                             */
                              Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 10.0, bottom: 10.0),
                                  margin: EdgeInsets.zero,
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: Text(
                                    "TOPUP LOW BALANCE ALERT",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 0.0, bottom: 0.0),
                                margin: EdgeInsets.symmetric(vertical: 0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Notify me when Topup balance below",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Switch(
                                        value: isSwitchedMFPCounterTopup,
                                        onChanged: (value) {
                                          setState(() {
                                            print(isSwitchedMFPCounterTopup);
                                            print(value);
                                            isSwitchedMFPCounterTopup = value;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/ProfilePage', arguments: profileData);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.account_balance_wallet,
                                size: 16,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            new TextSpan(
                                text: " Wallet Transaction",
                                style: new TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/MerchantTransaction',
                            arguments: profileData);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.soap_sharp,
                                size: 16,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            new TextSpan(
                                text: " Merchant Transaction",
                                style: new TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/DetailTransaction',
                            arguments: profileData);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "",
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.description_outlined,
                                size: 16,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            new TextSpan(
                                text: " Detail Transaction",
                                style: new TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    )
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
