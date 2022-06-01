import 'package:flutter/material.dart';

Widget userList(BuildContext context, int index, List<Map> details) {
  return Column(children: <Widget>[
    new Divider(
      height: 0.1,
    ),
    ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(details[index]['image']),
        radius: 20,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            details[index]['name'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          new RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'Due date: ',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12)),
                new TextSpan(
                    text: details[index]['last_date'],
                    style: new TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Invoice No: " + details[index]['invoiceNo'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              new RichText(
                text: new TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: 'RM: ',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade500,
                            fontSize: 16)),
                    new TextSpan(text: details[index]['amount']),
                  ],
                ),
              ),
            ],
          ),
          Text(
            "Category: " + details[index]['category'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed('/OutStandingDetails', arguments: details[index]);
      },
    )
  ]);
}
