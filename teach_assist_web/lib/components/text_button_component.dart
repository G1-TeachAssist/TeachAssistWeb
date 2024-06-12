import 'package:flutter/material.dart';

TextButton popupButton({
  String buttonText = '',
  Color buttonColor = const Color(0xFF4cd137),
  Function()? onPressed
}) {
  return TextButton(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(buttonColor),
    ),
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: const TextStyle(color: Colors.black87),
    ),
  );
}
