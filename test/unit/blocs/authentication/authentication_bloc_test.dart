import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../widget/mock.dart';

void main() {
  group('Authentication Bloc', () {
    late AuthenticationBloc bloc;

    final userRepository = MockUserRepository();

    setUp(() {
      bloc = AuthenticationBloc(
        AuthenticationInProgress(),
        userRepository: userRepository,
      );
    });

    tearDown(() {
      bloc.close();
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits authentication required when user is not authenticated',
      build: () => bloc,
      act: (AuthenticationBloc bloc) {
        when(userRepository.isSignedIn).thenAnswer((_) async => false);
        bloc.add(AuthenticationRequested());
      },
      expect: () => [AuthenticationInProgress(), AuthenticationRequired()],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits authentication succeeded when user is authenticated',
      build: () => bloc,
      act: (AuthenticationBloc bloc) {
        when(userRepository.isSignedIn).thenAnswer((_) async => true);
        bloc.add(AuthenticationRequested());
      },
      expect: () => [AuthenticationInProgress(), AuthenticationSucceeded()],
    );
  });
}
