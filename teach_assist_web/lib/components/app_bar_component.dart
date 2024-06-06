import 'package:flutter/material.dart';

AppBar appBar({bool leading = true, String title = ''}){
  return AppBar(
    leading: leading ? const Icon(Icons.school_outlined) : null,
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xFF2f3640),
    title: Text(title),
  );
}