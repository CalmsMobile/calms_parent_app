import '/common/widgets/select_member.dart';
import 'package:flutter/material.dart';

class TopupDetails extends StatefulWidget {
  const TopupDetails({Key? key}) : super(key: key);

  @override
  State<TopupDetails> createState() => _TopupDetailsState();
}

class _TopupDetailsState extends State<TopupDetails> {
  @override
  Widget build(BuildContext context) {
    final passData = ModalRoute.of(context)?.settings.arguments as Map;
    print(passData);
    return Scaffold(
      appBar: getMyAppbar(context,"Topup Details", []),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(passData["image"]),
                          radius: 72,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          passData["name"],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                  Icons.card_membership,
                                  size: 16,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              TextSpan(
                                style: new TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                ),
                                text: " ID",
                              ),
                              TextSpan(
                                style: new TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                text: passData["id"] != null &&
                                        passData["id"] != ""
                                    ? " " + passData["id"]
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
                                  Icons.attach_money,
                                  size: 16,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              TextSpan(
                                style: new TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                ),
                                text: " MYR",
                              ),
                              TextSpan(
                                style: new TextStyle(
                                    fontSize: 28.0,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                                text: passData["amount"] != null &&
                                        passData["amount"] != ""
                                    ? " " + passData["amount"]
                                    : " --",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black38, width: .2),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RECEIPT NO",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(passData["receipt_no"],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black38, width: .2),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 0, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOPUP VIA",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(passData["mode_of_topup"],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black38, width: .2),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 0, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOPUP DATE",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(passData["date"],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black38, width: .5),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 0, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOPUP BY",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(passData["topupby"],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
