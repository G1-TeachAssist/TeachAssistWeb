import 'package:flutter/material.dart';

ElevatedButton mainButton(
    {String buttonText = '',
    Color buttonColor = const Color(0xFF40739e),
    double horizontalPadding = 60,
    Function()? buttonFunction}) {
  return ElevatedButton(
    onPressed: buttonFunction,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 20,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ))),
    child: Text(
      buttonText,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}
