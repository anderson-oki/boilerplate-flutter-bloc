import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {}
}
