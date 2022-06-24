import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate_flutter/blocs/login/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../widget/mock.dart';

void main() {
  group('Login Bloc', () {
    late LoginBloc bloc;

    final userRepository = MockUserRepository();

    setUp(() {
      bloc = LoginBloc(LoginRequired());
    });

    tearDown(() {
      bloc.close();
    });

    blocTest<LoginBloc, LoginState>(
      'emits login succeeded when requested',
      build: () => bloc,
      act: (LoginBloc bloc) {
        when(userRepository.isSignedIn).thenAnswer((_) async => false);
        bloc.add(LoginRequested());
      },
      expect: () => [LoginSucceeded()],
    );

    blocTest<LoginBloc, LoginState>(
      'emits logout succeeded when requested',
      build: () => bloc,
      act: (LoginBloc bloc) {
        when(userRepository.isSignedIn).thenAnswer((_) async => false);
        bloc.add(LogoutRequested());
      },
      expect: () => [LogoutSucceeded()],
    );
  });
}
