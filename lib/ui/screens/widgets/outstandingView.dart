import 'package:flutter/material.dart';

Widget userList(BuildContext context, int index, List<Map> details) {
  return Column(children: <Widget>[
    new Divider(
      height: 0.1,
    ),
    ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(details[index]['ImgPathUrl']),
        radius: 20,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            details[index]['Name'],
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
                        color: Colors.grey.shade500,
                        fontSize: 10)),
                new TextSpan(
                    text: details[index]['LastDate'],
                    style: new TextStyle(
                        color: Colors.grey.shade500, fontSize: 10)),
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
                "Invoice No: " + details[index]['InvoiceNo'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.grey.shade500),
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
                            fontSize: 14)),
                    new TextSpan(
                        text: details[index]['PendingAmount'].toString(),
                        style: new TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
          Text(
            "Category: " ,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.shade500),
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
