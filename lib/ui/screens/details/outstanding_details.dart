import '/common/widgets/select_member.dart';
import 'package:flutter/material.dart';

class OutStandingDetails extends StatefulWidget {
  const OutStandingDetails({Key? key}) : super(key: key);

  @override
  State<OutStandingDetails> createState() => _OutStandingDetailsState();
}

class _OutStandingDetailsState extends State<OutStandingDetails> {
  @override
  Widget build(BuildContext context) {
    final passData = ModalRoute.of(context)?.settings.arguments as Map;
    print(passData);
    return Scaffold(
      appBar: getMyAppbar("Outstanding", []),
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
                          "INVOICE NO",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(passData["invoiceNo"],
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
                          "INVOICE CATEGORY",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(passData["category"],
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
                          "INVOICE DATE",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(passData["invoice_date"],
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
                          "DUE DATE",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(passData["last_date"],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: Text(
                      "DESCRIPTION",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                    child: Text(
                      passData['desc'],
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: Text(
                      "ATTACHMENTS",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_download_rounded,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Invoice001",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_download_rounded,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Invoice002",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
