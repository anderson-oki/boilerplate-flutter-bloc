import 'package:bloc/bloc.dart';
import 'package:boilerplate_flutter/blocs/login/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginRequested>(
      (LoginEvent event, Emitter<LoginState> emit) {
        emit(LoginSucceeded());
      },
    );

    on<LogoutRequested>(
      (LoginEvent event, Emitter<LoginState> emit) {
        emit(LogoutSucceeded());
      },
    );
  }
}
