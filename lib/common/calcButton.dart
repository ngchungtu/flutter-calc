import 'package:flutter/material.dart';

Widget caclButton(String btnText, Color btnColor, void Function()? btnPressed) {
  return Container(
    width: 75,
    height: btnText == "=" ? 150 : 70,
    padding: const EdgeInsets.all(0),
    child: ElevatedButton(
      onPressed: btnPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        backgroundColor: btnColor
      ),
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 27, color: Colors.white),
      ),
    ),
  );
}
