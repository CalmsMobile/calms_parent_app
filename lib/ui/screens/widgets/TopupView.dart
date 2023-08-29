import '../../../common/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget getTopupView(BuildContext buildContext, List<Map> familyList,
    List<Map<String, dynamic>> _values) {
  return SingleChildScrollView(
    child: Container(
      color: Colors.white,
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
                itemCount: familyList.length,
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
                              width: 80,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  ),
                                  child: familyList[index]['image'] != null &&
                                          familyList[index]['image'] != ""
                                      ? Image.network(
                                          familyList[index]['image'],
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover)
                                      : Image.asset(
                                          "assets/images/no_image.png",
                                          height: 80,
                                          width: 80,
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
                                        familyList[index]['name'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
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
                                                familyList[index]['memberId'],
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ]),
                                      ),
                                    ),
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
                                                "${double.parse(familyList[index]['balance']).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          )
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
    ),
  );
}
