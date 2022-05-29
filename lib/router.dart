import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:boilerplate_flutter/blocs/login/bloc.dart';
import 'package:boilerplate_flutter/components/login/login_screen.dart';
import 'package:boilerplate_flutter/components/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const ROUTE_MAIN_PATH = '/';
  static const ROUTE_LOGIN_PATH = '/login';

  static make(AuthenticationBloc authBloc) {
    return GoRouter(
      redirect: (GoRouterState state) {
        final isLoggedIn = authBloc.state is AuthenticationSucceeded;
        final isLoggingIn = state.subloc == ROUTE_LOGIN_PATH;

        if (!isLoggedIn) {
          return isLoggingIn ? null : ROUTE_LOGIN_PATH;
        }

        if (isLoggingIn) {
          return ROUTE_MAIN_PATH;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: ROUTE_MAIN_PATH,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => LoginBloc(LoginSucceeded()),
              child: MainScreen(),
            );
          },
        ),
        GoRoute(
          path: ROUTE_LOGIN_PATH,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (BuildContext context) => LoginBloc(LoginRequired()),
              child: LoginScreen(),
            );
          },
        ),
      ],
      refreshListenable: authBloc,
    );
  }
}
