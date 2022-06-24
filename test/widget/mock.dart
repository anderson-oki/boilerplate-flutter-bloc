import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:boilerplate_flutter/blocs/login/bloc.dart';
import 'package:boilerplate_flutter/repositories/user/user_repository.dart';
import 'package:mocktail/mocktail.dart';

class FakeAuthenticationEvent extends Fake implements AuthenticationEvent {}

class FakeAuthenticationState extends Fake implements AuthenticationEvent {}

class FakeLoginEvent extends Fake implements LoginEvent {}

class FakeLoginState extends Fake implements LoginEvent {}

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}
