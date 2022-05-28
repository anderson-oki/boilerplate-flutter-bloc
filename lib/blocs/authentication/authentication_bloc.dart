import 'package:boilerplate_flutter/blocs/authentication/authentication_event.dart';
import 'package:boilerplate_flutter/blocs/authentication/authentication_state.dart';
import 'package:boilerplate_flutter/repositories/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc(AuthenticationState state, {required this.userRepository})
      : super(state) {
    on<AuthenticationRequested>(
      (AuthenticationEvent event, Emitter emit) async {
        emit(AuthenticationInProgress());

        if (!await this.userRepository.isSignedIn()) {
          emit(AuthenticationRequired());

          return;
        }

        emit(AuthenticationSucceeded());
      },
    );
  }
}
