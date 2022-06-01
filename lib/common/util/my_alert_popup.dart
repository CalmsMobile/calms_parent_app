import 'dart:math';

import 'package:flutter/material.dart';

class MyAlertPopupDialog {
  showAlert(String title1, List data, String studentImageURLCopy,
      BuildContext context, onDismiss, onSelect) {
    print(title1);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      title: Container(
        child: Text(title1),
      ),
      actions: <Widget>[
        Container(
          height: 50,
          width: 130,
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey)))),
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: onDismiss,
          ),
        ),
      ],
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  onTap: onSelect,
                  leading: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60))),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(studentImageURLCopy != ""
                                  ? (studentImageURLCopy +
                                      data[index]["ParentSeqId"].toString() +
                                      "&update= ${Random().nextInt(10000)}")
                                  : data[index]["image"] != null
                                      ? data[index]["image"]
                                      : "https://www.hollywoodprimaryschool.co.uk/wp-content/uploads/male-placeholder.jpg"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  title: Text(
                    data[index]["name"],
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    data[index]["class"] != null && data[index]["class"] != ""
                        ? data[index]["class"]
                        : " --",
                    style: TextStyle(fontSize: 12),
                  ));
            }),
      ),
    );
  }
}
