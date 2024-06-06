import 'package:flutter/material.dart';
import 'package:teach_assist_web/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teach Assist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2f3640)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login':(context) => const LoginPage(),
      },
    );
  }
}
