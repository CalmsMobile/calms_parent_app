import 'package:calms_parent/ui/screens/widgets/TopupView.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatefulWidget {
  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
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

  List<Map<String, dynamic>> get _values => [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topup"),
      ),
      body: getTopupView(context, getfamilyList, _values),
    );
  }
}
