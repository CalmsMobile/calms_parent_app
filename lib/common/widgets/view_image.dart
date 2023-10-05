import 'common.dart';
import 'package:flutter/material.dart';

class ViewImage extends StatefulWidget {
  const ViewImage({Key? key}) : super(key: key);

  @override
  State<ViewImage> createState() => _ViewImageState();
}

var currentPos = 0;

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    if (data['images'] != null && data['images'].length > 0) {
      print(data['images'][currentPos]);
    }

    // currentPos = 0;
    print(currentPos);
    return Scaffold(
      appBar: getMyAppbar(false, context, "", []),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          child: data['images'].length > 0
              ? Container(
                  height: double.infinity,
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(data['images'][currentPos]),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(
                  height: double.infinity,
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/no_image.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
        ),
        if (data['images'].length > 1)
          Container(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                //   margin: EdgeInsets.only(right: 15),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20),
                //     border: Border.all(color: Colors.pinkAccent, width: 2),
                //     boxShadow: [
                //       new BoxShadow(
                //         color: Colors.pinkAccent,
                //         blurRadius: 1.0,
                //       ),
                //     ],
                //   ),
                //   child: Text(
                //     "Photo ${(currentPos + 1)} of ${data['images'].length}",
                //     style: TextStyle(
                //         color: Colors.black, fontWeight: FontWeight.bold),
                //   ),
                // ),
                Flexible(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (currentPos > 0) {
                            currentPos = currentPos - 1;
                            setState(() {});
                          }
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 10,
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          if (currentPos <= data['images'].length - 2) {
                            currentPos = currentPos + 1;
                            setState(() {});
                          }
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
      ]),
    );
  }
}
