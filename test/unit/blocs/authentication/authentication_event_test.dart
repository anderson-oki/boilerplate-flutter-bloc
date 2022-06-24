import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Authentication Event', () {
    test('AuthenticationRequested with similar values are the same', () {
      expect(
        AuthenticationRequested(),
        AuthenticationRequested(),
      );
    });
  });
}
