import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../common/app_settings.dart';
import '../../../common/listener/settings_listener.dart';
import '../../../common/util/common_funtions.dart';
import '../../../provider/rest_api.dart';

class MealOrderListView extends StatelessWidget {
  final String imgBaseUrl;
  final String CurrencyCode;
  final List membersList;
  const MealOrderListView(
      this.imgBaseUrl, this.membersList, this.CurrencyCode);

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
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    elevation: 10,
                    shadowColor: Colors.black,
                    color: Color.fromARGB(255, 249, 249, 249),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    membersList[index]['Name'],
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  membersList[index]['RelationShip'] != ""
                                      ? Text(
                                          '(${membersList[index]['RelationShip']})',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Color.fromARGB(255, 83, 83, 83),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                              Container(
                                child: membersList[index]['ImgPathUrl'] != null
                                    ? CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            imgBaseUrl +
                                                membersList[index]
                                                    ["ImgPathUrl"]),
                                      )
                                    : CircleAvatar(
                                        radius: 30,
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text('Enter your amount',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          TextField(
                            onChanged: (value) {
                              checkMaximumAmount(context, index, value);
                            },
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 105, 199),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              isDense: false,
                              /* prefixIcon: Text(CurrencyCode,textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromARGB(255, 6, 105, 199),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)), */
                              prefixIconConstraints: const BoxConstraints(),
                              prefixIcon: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(CurrencyCode,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 6, 105, 199),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
                              ),
                              border: OutlineInputBorder(),
                              hintText: "0.00",
                              helperMaxLines: 5,
                              helperText: membersList[index]['msg'] != null
                                  ? membersList[index]['msg']
                                  : "Minimum reload amount is ${CurrencyCode} 1.00.",
                              helperStyle: membersList[index]['msg'] != null
                                  ? TextStyle(
                                      fontSize: 12,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold)
                                  : null,
                            ),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              // Allow Decimal Number With Precision of 2 Only
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d{0,2}')),
                            ],
                          ),
                          //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                    //SizedBox
                  );
                 }),
          ),
        ],
      ),
    );
  }

  Future<void> checkMaximumAmount(
      BuildContext context, index, String value) async {
    //print('${membersList[index]['UserSeqId'].toString()} ${membersList[index]['msg']}');
    var ParamData = {
      "RefUserSeqId": membersList[index]['UserSeqId'],
      "Amount": value
    };
    print(ParamData);
    Future<Map<String, dynamic>> res = RestApiProvider().authorizedPostRequest(
      ParamData,
      AppSettings.CheckUserEWalletBalMaxAmt,
      context,
      false,
    );
    res.then((response) {
      if (response['Table'][0]['code'] == 10) {
        if (value.isEmpty) {
          membersList[index]['Amount'] = 0;
        } else {
          membersList[index]['Amount'] = double.parse(value);
        }
        membersList[index]['msg'] = '';
      } else if (response['Table'][0]['code'] == 20) {
        membersList[index]['Amount'] = 0;
        membersList[index]['msg'] = response['Table'][0]['description'];
      }
      context.read<MySettingsListener>().updateTopupMembersList(membersList);
    }).onError((error, stackTrace) {});
  }
}
