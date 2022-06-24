import 'package:boilerplate_flutter/repositories/user/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User Repository', () {
    test('is signed in', () async {
      await UserRepository().isSignedIn();
    });
  });
}
