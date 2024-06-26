import 'package:flutter/material.dart';

Container titlePanel({
  required BuildContext context,
  required String title,
  String subtitle = '',
}) {
  return Container(
    height: 150,
    width: MediaQuery.sizeOf(context).width - 221,
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(top: 25),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Color(0xFF2f3640),
    ),
    child: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 45,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            overflow: TextOverflow.ellipsis
          ),
        ),
      ],
    ),
  );
}
