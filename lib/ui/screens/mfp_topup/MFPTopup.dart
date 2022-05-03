import 'package:flutter/material.dart';

class MFPTopup extends StatefulWidget {
  const MFPTopup();

  List<Map> get getfamilyList => [
        {
          "name": "Desmond",
          "category": "PARENT",
          "desc": "",
          "balance": "250.00",
          "email": "makame147@gmail.com",
          "image": "https://randomuser.me/api/portraits/men/1.jpg"
        },
        {
          "name": "SITI KHALIDA",
          "category": "PARENT",
          "desc": "",
          "balance": "50.00",
          "email": "calms.rnd@gmail.com",
          "image": "https://randomuser.me/api/portraits/women/1.jpg"
        },
        {
          "name": "HAZIM",
          "category": "STUDENT",
          "email": "",
          "balance": "100.00",
          "contact": "0123467589",
          "desc": "Member account does not exist in MFP software",
          "image": "https://randomuser.me/api/portraits/men/2.jpg"
        },
        {
          "name": "MARIE LIM",
          "category": "STUDENT",
          "email": "",
          "balance": "0.00",
          "contact": "",
          "desc": "",
          "image": "https://randomuser.me/api/portraits/men/3.jpg"
        },
        {
          "name": "Danny",
          "category": "STUDENT",
          "email": "",
          "balance": "30.00",
          "contact": "",
          "desc": "",
          "image": "https://randomuser.me/api/portraits/men/4.jpg"
        },
      ];

  @override
  _MFPTopupState createState() => _MFPTopupState();
}

class _MFPTopupState extends State<MFPTopup> {
  @override
  Widget build(BuildContext context) {
    List<Map> familyList = widget.getfamilyList;
    return Scaffold(
        appBar: AppBar(
          title: Text("MFP Topup"),
        ),
        body: Container(
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Text(
                                  familyList[index]['desc'] == ""
                                      ? familyList[index]['balance']
                                      : familyList[index]['desc'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: familyList[index]['desc'] == ""
                                          ? Colors.grey
                                          : Colors.red),
                                ),
                              )
                            ],
                          ),
                          isThreeLine: true,
                          trailing: familyList[index]['desc'] == ""
                              ? Column(
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
                                                  left: 0,
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 0))),
                                    )
                                  ],
                                )
                              : SizedBox(),
                        )
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
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          child: Text('PROCEED'),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
