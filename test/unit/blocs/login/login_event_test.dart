import 'package:boilerplate_flutter/blocs/login/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Event', () {
    test('LoginRequested with similar values are the same', () {
      expect(
        LoginRequested(),
        LoginRequested(),
      );
    });

    test('LogoutRequested with similar values are the same', () {
      expect(
        LoginRequested(),
        LoginRequested(),
      );
    });
  });
}
