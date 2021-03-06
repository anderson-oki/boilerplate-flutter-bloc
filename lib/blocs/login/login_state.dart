import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginRequired extends LoginState {}

class LoginSucceeded extends LoginState {}

class LogoutSucceeded extends LoginState {}
