import 'package:flutter/material.dart';

Widget getTopupView(BuildContext buildContext, List<Map> familyList,
    List<Map<String, dynamic>> _values) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: familyList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: <Widget>[
                  new Divider(
                    height: 0.1,
                  ),
                  ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(familyList[index]['image']),
                        radius: 30,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                familyList[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              )),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              "Wallet balance: RM " +
                                  familyList[index]['balance'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      isThreeLine: true,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: TextField(
                                style: TextStyle(fontSize: 14),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    hintText: 'Amount',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.only(
                                        left: 0, right: 0, top: 0, bottom: 0))),
                          )
                        ],
                      ))
                ]);
              }),
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: OutlinedButton(
                  onPressed: () => {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Theme.of(buildContext).primaryColor, width: 2),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: Text('PROCEED'),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

