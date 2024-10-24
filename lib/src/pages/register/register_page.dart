import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop01/src/bloc/login/login_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text("Register Page ${state.count}");
          },
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(),
    );
  }
}
