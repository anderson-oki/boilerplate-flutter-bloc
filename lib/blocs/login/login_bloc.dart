import 'package:bloc/bloc.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginEvent>(
      (LoginEvent event, Emitter emit) => {
        //
      },
    );
  }
}
