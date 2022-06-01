import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityDetails extends StatefulWidget {
  const ActivityDetails();

  @override
  _ActivityDetailsState createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> activityInfo =
        ModalRoute.of(context)?.settings.arguments as Map;
    print(activityInfo);
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity Details"),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: Column(children: <Widget>[
          new Divider(
            height: 0.1,
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              child: activityInfo['image'] != null
                  ? Image.network(activityInfo['image'],
                      width: double.infinity, height: 180, fit: BoxFit.cover)
                  : Image.asset("assets/images/user.png"),
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                activityInfo['title'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              trailing: Text(
                'MYR ${double.parse(activityInfo['price']).toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Text(
                "DESCRIPTION",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Text(
                activityInfo['description'],
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Text(
                "PERIOD",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 0.0, bottom: 10.0),
              child: Row(
                children: [
                  Text(DateFormat.yMMMEd().format(DateFormat('yyyy/mm/dd')
                      .parse(activityInfo['startdate']))),
                  Text(" - "),
                  Text(DateFormat.yMMMEd().format(
                      DateFormat('yyyy/mm/dd').parse(activityInfo['enddate']))),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            padding: EdgeInsets.symmetric(horizontal: 3)),
                        onPressed: () => {},
                        child: Text("Allowed 1"),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 3)),
                        onPressed: () => {},
                        child: Text("Available Unlimitted"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 3)),
                        onPressed: () => {},
                        child: Text("Purchased 1"),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            padding: EdgeInsets.symmetric(horizontal: 3)),
                        onPressed: () => {},
                        child: Text("Collected 1"),
                      ),
                    ),
                  ],
                ),
                // Text(storeList[index]['invoice_date'])
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ADD TO CART",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                  height: 25,
                  width: 25,
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent, // Button color
                      child: InkWell(
                        splashColor: Colors.red, // Splash color
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
