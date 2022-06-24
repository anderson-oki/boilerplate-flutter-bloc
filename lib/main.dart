import 'package:boilerplate_flutter/app.dart';
import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:boilerplate_flutter/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  final _userRepository = UserRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) {
        return AuthenticationBloc(
          AuthenticationInProgress(),
          userRepository: _userRepository,
        )..add(
            AuthenticationRequested(),
          );
      },
      child: RepositoryProvider(
        create: (BuildContext context) => _userRepository,
        child: const App(),
      ),
    ),
  );
}
