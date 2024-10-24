import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop01/src/bloc/login/login_bloc.dart';
import 'package:workshop01/src/pages/home/home_page.dart';
import 'package:workshop01/src/pages/routes.dart';
import 'pages/login/login_page.dart';

final navigatorState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final loginBloc = BlocProvider(create: (context) => LoginBloc());

    return MultiBlocProvider(
      providers: [loginBloc],
      child: MaterialApp(
        title: "Working Hour",
        routes: AppRoute.all,
        home: LoginPage(),
        navigatorKey: navigatorState,
      ),
    );
  }
}
