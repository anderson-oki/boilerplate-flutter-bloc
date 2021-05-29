import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInProgress extends AuthenticationState {}

class AuthenticationRequired extends AuthenticationState {}

class AuthenticationSucceeded extends AuthenticationState {}

