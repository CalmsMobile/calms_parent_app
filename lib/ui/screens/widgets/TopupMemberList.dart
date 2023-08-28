import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/util/common_funtions.dart';

class TopupMemberListView extends StatelessWidget {
  final String imgBaseUrl;
  final List membersList;
  const TopupMemberListView(this.imgBaseUrl, this.membersList);

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
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: membersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    new Divider(
                      height: 0.1,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 8, top: 8, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 50,
                              child: Container(
                                child: membersList[index]['ImgPathUrl'] != null
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            imgBaseUrl +
                                                membersList[index]
                                                    ["ImgPathUrl"]),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.blue[700],
                                        child: Text(
                                          CommonFunctions.getInitials(
                                              membersList[index]['Name']),
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.white,
                                              letterSpacing: 2.0,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                              )),
                          Flexible(
                            child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(3, 3, 0, 0),
                                      child: Text(
                                        membersList[index]['Name'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                     (membersList[index]
                                                      ['RelationShip'] !=
                                                  "")?
                                    Container(
                                      padding: EdgeInsets.fromLTRB(3, 5, 0, 0),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.card_membership,
                                            size: 16,
                                            color: Colors.grey.shade500,
                                          )),
                                            TextSpan(
                                              text: " " +
                                                  membersList[index]
                                                      ['RelationShip'],
                                              //text: " ",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                        ]),
                                      ),
                                    ) :SizedBox(),
                                   
                                    Container(
                                      padding: EdgeInsets.fromLTRB(2, 3, 0, 0),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(
                                            Icons.attach_money,
                                            size: 18,
                                            color: Colors.grey.shade500,
                                          )),
                                          TextSpan(
                                            text: " balance",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " MYR  ",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "${membersList[index]['Balance'].toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          /*  TextSpan(
                                              text:
                                                  "${membersList[index]['RelationShip']}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.redAccent,
                                                  fontWeight: FontWeight.bold),
                                            ) */
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                      width: double.infinity,
                                      child: Row(children: [
                                        Icon(
                                          Icons.currency_exchange,
                                          size: 14,
                                          color: Colors.grey.shade500,
                                        ),
                                        Container(
                                          width: 250,
                                          child: TextField(
                                            style: TextStyle(fontSize: 14),
                                            textAlign: TextAlign.left,
                                            decoration: const InputDecoration(
                                              hintText: '0.00',
                                              isDense: true,
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minWidth: 0,
                                                      minHeight: 0),
                                              prefixIcon: Text(
                                                ' MYR ',
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            inputFormatters: [
                                              // Allow Decimal Number With Precision of 2 Only
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'^\d*\.?\d{0,2}')),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ]);
                }),
          ),
        ],
      ),
    );
  }
}
