import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:workshop01/src/app.dart';
import 'package:workshop01/src/models/user.dart';
import 'package:workshop01/src/pages/routes.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    //add

    on<LoginEventAdd>((event, emit)  {
      emit(state.copyWith(count: state.count + 1));
    });

    //remove
    on<LoginEventRemove>((event, emit)  {
      emit(state.copyWith(count: state.count - 1));
    });

    //login
    on<LoginEventLogin>((event, emit) {
      if (event.payload.username == "admin" && event.payload.password == "1234") {
        emit(state.copyWith(isAuthened: true));
        if (navigatorState.currentContext != null) {
          Navigator.pushReplacementNamed(navigatorState.currentContext!, AppRoute.home);
        }
      }
      else {
        emit(state.copyWith(isAuthened: false));
      }
    });
  }
}
