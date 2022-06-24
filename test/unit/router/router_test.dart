import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:boilerplate_flutter/router.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock.dart';

void main() {
  group('Router', () {
    late AuthenticationBloc authBloc;

    setUp(
      () => {authBloc = MockAuthenticationBloc()},
    );

    test('make routes', () {
      final router = AppRouter.make(authBloc);
    });
  });
}
