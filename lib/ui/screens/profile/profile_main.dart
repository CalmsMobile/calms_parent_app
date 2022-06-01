import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  @override
  Widget build(BuildContext context) {
    final profileData = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/Settings', arguments: profileData);
            },
          )
        ],
      ),
      body: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(profileData["image"]),
                radius: 72,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                profileData["name"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.mail,
                        size: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextSpan(
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      text: profileData["email"] != null &&
                              profileData["email"] != ""
                          ? " " + profileData["email"]
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
                        Icons.phone_android,
                        size: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextSpan(
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      text: profileData["contact"] != null &&
                              profileData["contact"] != ""
                          ? " " + profileData["contact"]
                          : " --",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: new TextSpan(
                  text: "",
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.red,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: profileData["category"],
                        style: new TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: new TextSpan(
                  text: "Balance ",
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: "RM ${profileData["balance"]}",
                        style: new TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/ProfilePage', arguments: profileData);
                },
                child: RichText(
                  text: TextSpan(
                    text: "",
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.account_balance_wallet,
                          size: 16,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      new TextSpan(
                          text: " Wallet Transaction",
                          style: new TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/MerchantTransaction',
                      arguments: profileData);
                },
                child: RichText(
                  text: TextSpan(
                    text: "",
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.soap_sharp,
                          size: 16,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      new TextSpan(
                          text: " Merchant Transaction",
                          style: new TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/DetailTransaction', arguments: profileData);
                },
                child: RichText(
                  text: TextSpan(
                    text: "",
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.description_outlined,
                          size: 16,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      new TextSpan(
                          text: " Detail Transaction",
                          style: new TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
