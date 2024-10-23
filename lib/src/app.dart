import 'package:flutter/material.dart';
import 'package:workshop01/src/pages/home/home_page.dart';
import 'package:workshop01/src/pages/routes.dart';
import 'pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Working Hour",
      routes: AppRoute.all,
      home: LoginPage(),
    );
  }
}
