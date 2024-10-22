import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _usernameController.text = "admin";
    _passwordController.text = "1234";
  }

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
        child: Padding(
          // padding: const EdgeInsets.only(top: 32.0),
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(
                height: 24,
              ),
              ..._buildButtons()
            ],
          ),
        ),
      ),
    );
  }

  void _handleOnLoginClick() {
    print("username = ${_usernameController.text}");
    print("password = ${_passwordController.text}");
  }

  void _handleOnResetClick() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  _buildButtons() {
    return [
      ElevatedButton(
        onPressed: _handleOnLoginClick,
        child: Text("Login"),
      ),
      OutlinedButton(
        onPressed: _handleOnResetClick,
        child: Text("Reset"),
      ),
    ];
  }
}
