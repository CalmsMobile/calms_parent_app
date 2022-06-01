import 'package:flutter/material.dart';

Widget CustomRadioButton(
    String text, int index, Function callback, selectedBoxIndex) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: OutlineButton(
      onPressed: () {
        callback(index);
      },
      child: Text(
        text,
        style: TextStyle(
          color: (selectedBoxIndex == index) ? Colors.green : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide: BorderSide(
          color: (selectedBoxIndex == index) ? Colors.green : Colors.black),
    ),
  );
}
