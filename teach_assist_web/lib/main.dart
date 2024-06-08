import 'package:flutter/material.dart';
import 'package:teach_assist_web/views/dashboard_view.dart';
import 'package:teach_assist_web/views/home_page.dart';
import 'package:teach_assist_web/views/login_page.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() {
  WebViewPlatform.instance = WebWebViewPlatform();
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
        '/home':(context) => const HomePage(),
        '/dashboard':(context) => const DashboardPage()
      },
    );
  }
}
