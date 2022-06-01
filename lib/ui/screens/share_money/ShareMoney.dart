import 'package:flutter/material.dart';

class ShareMoney extends StatefulWidget {
  const ShareMoney();

  final int senderIndex = 0;
  final int receiverIndex = 1;
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
  _ShareMoneyState createState() => _ShareMoneyState();
}

class _ShareMoneyState extends State<ShareMoney> {
  @override
  Widget build(BuildContext context) {
    List<Map> familyList = widget.getfamilyList;
    int senderIndex = widget.senderIndex;
    int receiverIndex = widget.receiverIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer Money"),
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                margin: EdgeInsets.all(0),
                width: double.infinity,
                child: Text(
                  "SENDER ACCOUNT",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            new Divider(
              height: 0.1,
            ),
            ListTile(
              onTap: () => {openMemberBottomSheet(context, familyList)},
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(familyList[senderIndex]['image']),
                radius: 30,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    familyList[senderIndex]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MYR ${double.parse(familyList[senderIndex]["balance"]).toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
              trailing: Container(
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 38,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                margin: EdgeInsets.all(0),
                width: double.infinity,
                child: Text(
                  "RECEIVER ACCOUNT",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            new Divider(
              height: 0.1,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    NetworkImage(familyList[receiverIndex]['image']),
                radius: 30,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    familyList[receiverIndex]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MYR ${double.parse(familyList[receiverIndex]["balance"]).toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
              trailing: Container(
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 38,
                ),
              ),
            ),
            new Divider(
              height: 0.1,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                margin: EdgeInsets.all(0),
                width: double.infinity,
                child: Text(
                  "TRANSFER AMOUNT",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                  style: TextStyle(fontSize: 14),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                      hintText: 'Amount',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 0, top: 0, bottom: 0))),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: OutlinedButton(
            onPressed: () => {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: Text(
              'PROCEED',
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void openMemberBottomSheet(BuildContext buildContext, getfamilyList) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: getfamilyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: <Widget>[
                      new Divider(
                        height: 0.1,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(getfamilyList[index]['image']),
                          radius: 20,
                        ),
                        title: new Text(getfamilyList[index]["name"]),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]);
                  })
            ],
          );
        });
  }
}
