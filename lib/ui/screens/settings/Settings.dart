import '/common/HexColor.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings();

  @override
  _SettingsState createState() => _SettingsState();
}

bool isSwitchedTopup = false;
bool isSwitchedMFPTopup = false;
bool isSwitchedCounterTopup = false;
bool isSwitchedMFPCounterTopup = false;

String limitType = '';

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    print(isSwitchedMFPTopup);
    final profileData = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -10.0,
        backgroundColor: HexColor("#f5f8fd"),
        centerTitle: false,
        title: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 0),
              padding: EdgeInsets.zero,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(profileData["image"]),
                  radius: 20,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          profileData['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        )),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        "sivanekar@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Container(
      //   child: ,
      // ),
    );
  }
}
