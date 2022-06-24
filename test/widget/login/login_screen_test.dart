import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:boilerplate_flutter/blocs/login/bloc.dart';
import 'package:boilerplate_flutter/components/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock.dart';
import '../screen_pumper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(FakeAuthenticationEvent());
    registerFallbackValue(FakeLoginEvent());
    registerFallbackValue(FakeAuthenticationState());
    registerFallbackValue(FakeLoginState());
  });

  group('Main Screen', () {
    late AuthenticationBloc authBloc;

    late LoginBloc loginBloc;

    setUp(() {
      authBloc = MockAuthenticationBloc();
      loginBloc = MockLoginBloc();
    });

    tearDown(() {
      authBloc.close();
      loginBloc.close();
    });

    testWidgets(
      'renders the main form',
      (WidgetTester tester) async {
        whenListen(
          authBloc,
          Stream.fromIterable([AuthenticationRequired()]),
          initialState: AuthenticationRequired(),
        );

        whenListen(
          loginBloc,
          Stream.fromIterable([LoginRequired()]),
          initialState: LoginRequired(),
        );

        await ScreenPumper.pumpScreenMultiBloc(
          tester,
          const LoginScreen(),
          [
            BlocProvider<AuthenticationBloc>.value(value: authBloc),
            BlocProvider<LoginBloc>.value(value: loginBloc),
          ],
        );

        expect(find.text('Login Screen'), findsOneWidget);
      },
    );

    testWidgets(
      'performs authentication',
      (WidgetTester tester) async {
        whenListen(
          loginBloc,
          Stream.fromIterable([LoginSucceeded(), LoginRequired()]),
          initialState: LoginSucceeded(),
        );

        await ScreenPumper.pumpScreenMultiBloc(
          tester,
          const LoginScreen(),
          [
            BlocProvider<AuthenticationBloc>.value(value: authBloc),
            BlocProvider<LoginBloc>.value(value: loginBloc),
          ],
        );

        await tester.tap(find.text('Authenticate'));

        await tester.pumpAndSettle();

        // expect(find.text('Login Screen'), findsOneWidget);
      },
    );
  });
}
