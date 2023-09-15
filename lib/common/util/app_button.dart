import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button(
    String text, isCheckBox1Selected, isCheckBox2Selected, _onButtonPressed) {
  return ElevatedButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold),
        ),
        Icon(Icons.arrow_forward_ios)
      ],
    ),
    onPressed:
        isCheckBox1Selected && isCheckBox2Selected ? _onButtonPressed : null,
    style: ElevatedButton.styleFrom(
      fixedSize: Size(150, 40),
      backgroundColor: Color.fromARGB(255, 6, 105, 199),
      elevation: 5,
      textStyle: TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
    ),
  );
}
