import 'package:bloc/bloc.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginRequested>(
      (LoginEvent event, Emitter emit) {
        emit(LoginSucceeded());
      },
    );

    on<LogoutRequested>(
      (LoginEvent event, Emitter emit) {
        emit(LogoutSucceeded());
      },
    );
  }
}
