import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataCard extends StatelessWidget {
  final assetImageUrl;

  final message;

  final title;
  double marginTop;

   NoDataCard(this.assetImageUrl, this.title, this.message,this.marginTop) : super();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      shadowColor: Colors.black,
      borderOnForeground: true,
      margin: EdgeInsets.only(top:marginTop,left: 20, right: 20, bottom: 20),
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            if (title != "")
             
              if (assetImageUrl != "")
            Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                margin: EdgeInsets.zero,
                height: 180,
                color: Colors.transparent,
                child: Image.asset(assetImageUrl)),
                 Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            if (message != "")
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
