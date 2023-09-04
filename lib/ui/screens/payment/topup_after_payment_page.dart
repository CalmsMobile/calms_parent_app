import 'package:calms_parent_latest/common/common_api.dart';
import 'package:calms_parent_latest/ui/screens/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../common/widgets/common.dart';

class TopupAfterPaymentPage extends StatefulWidget {
  final txnDetail;
  const TopupAfterPaymentPage(this.txnDetail, {Key? key}) : super(key: key);

  @override
  _TopupAfterPaymentPageState createState() => _TopupAfterPaymentPageState();
}

class _TopupAfterPaymentPageState extends State<TopupAfterPaymentPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint(widget.txnDetail.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getMyAppbar(context, "Payment Status", []),
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                //Color.fromARGB(255, 246, 249, 254),
                Color.fromARGB(255, 246, 249, 254),
                Color.fromARGB(255, 230, 231, 239),
              ],
            )),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      margin: EdgeInsets.all(20),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        //padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: HtmlWidget(
                                    widget.txnDetail['Message'],
                                    enableCaching: false,
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ) /* Text(
                                          widget.txnDetail['Message'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 0, 92, 3)),
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                        ), */
                                      ),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(15),
                                child: SizedBox(
                                    height: 45,
                                    child: ElevatedButton(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Ok",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          //Icon(Icons.payment)
                                        ],
                                      ),
                                      onPressed: () {
                                        
                                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                                        
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 6, 105, 199),
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(60.0)),
                                      ),
                                    ))),
                            /* Container(
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.all(10),
                                    child: SizedBox(
                                        height: 45,
                                        child: ElevatedButton(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Resend verification email",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontFamily: "Montserrat",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              //Icon(Icons.payment)
                                            ],
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                           // _reSend();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 6, 105, 199),
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        60.0)),
                                          ),
                                        ))
                                        ), */
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
