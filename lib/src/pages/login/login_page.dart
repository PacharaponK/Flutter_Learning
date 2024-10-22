import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is Login Page", style: TextStyle(color: Colors.redAccent),), // only text
            Text("This is Login Page"),
            Text("This is Login Page"),
            Text("This is Login Page"),
            Container(child: Text("This is Login Page"), color: Color(0xffEF919F),), // text area
          ],
        ),
      ),
    );
  }
}