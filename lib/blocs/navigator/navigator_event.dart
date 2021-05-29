import 'package:equatable/equatable.dart';

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();

  @override
  List<Object> get props => [];
}

class NavigateToLoginEvent extends NavigatorEvent {}

class NavigateToMainEvent extends NavigatorEvent {}
