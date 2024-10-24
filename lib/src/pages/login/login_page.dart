import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop01/src/app.dart';
import 'package:workshop01/src/bloc/login/login_bloc.dart';
import 'package:workshop01/src/pages/routes.dart';

//Stateful Class, Variable Can Create and Change
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
        title: const Text("Login Page"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black12,
        child: Padding(
          // padding: const EdgeInsets.only(top: 32.0),
          padding: const EdgeInsets.all(32.0),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ..._buildTextFields(),
                  const SizedBox(
                    height: 24,
                  ),
                  ..._buildButtons(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text("Debug: ${context.read<LoginBloc>().state.count}"), // one time read
                      // Separation of Concern
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Text("DebugX: ${state.count}");
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            _handleOnClickAdd();
                          },
                          icon: Icon(Icons.add)),
                      IconButton(
                          onPressed: () {
                            _handleOnClickRemove();
                          },
                          icon: Icon(Icons.remove)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleOnLoginClick() {
    print("username = ${_usernameController.text}");
    print("password = ${_passwordController.text}");
    Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleOnResetClick() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  _buildTextFields() {
    return [
      TextField(
        controller: _usernameController,
        decoration: const InputDecoration(labelText: "Username"),
      ),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(labelText: "Password"),
      ),
    ];
  }

  _buildButtons() {
    return [
      ElevatedButton(
        onPressed: _handleOnLoginClick,
        child: const Text("Sign In"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
      ),
      OutlinedButton(
        onPressed: _handleOnResetClick,
        child: const Text("Reset"),
      ),
      ElevatedButton(
        onPressed: _handleOnSignUpClick,
        child: const Text("Register"),
      ),
    ];
  }

  void _handleOnSignUpClick() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  void _handleOnClickAdd() {
    context.read<LoginBloc>().add(LoginEventAdd());// state manage
  }

  void _handleOnClickRemove() {
    context.read<LoginBloc>().add(LoginEventRemove());// state manage
  }
}
