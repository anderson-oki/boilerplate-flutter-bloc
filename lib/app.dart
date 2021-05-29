import 'package:boilerplate_flutter/blocs/authentication/authentication_bloc.dart';
import 'package:boilerplate_flutter/blocs/login/bloc.dart';
import 'package:boilerplate_flutter/blocs/navigator/navigator_bloc.dart';
import 'package:boilerplate_flutter/blocs/navigator/navigator_event.dart';
import 'package:boilerplate_flutter/components/loading/loading_indicator.dart';
import 'package:boilerplate_flutter/config/locale.dart';
import 'package:boilerplate_flutter/screens/login_screen.dart';
import 'package:boilerplate_flutter/screens/main_screen.dart';
import 'package:boilerplate_flutter/support/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/authentication/bloc.dart';

class App extends StatefulWidget {
  State<App> createState() => _AppState();

  App({Key? key}) : super(key: key);
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigatorBloc>(
      create: (BuildContext context) {
        return NavigatorBloc(_navigatorKey);
      },
      child: CupertinoApp(
        theme: CupertinoThemeData(
          barBackgroundColor: CustomTheme.PRIMARY_COLOR,
          primaryColor: CustomTheme.PRIMARY_COLOR,
          primaryContrastingColor: CustomTheme.PRIMARY_CONTRASTING_COLOR,
          scaffoldBackgroundColor: CustomTheme.SCAFFOLD_BACKGROUND_COLOR,
          brightness: CustomTheme.BRIGHTNESS,
        ),
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
              useCountryCode: false,
              decodeStrategies: [JsonDecodeStrategy()],
            ),
          ),
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        navigatorKey: _navigatorKey,
        supportedLocales: Locale.SUPPORTED_LOCALES,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationRequired) {
              context.read<NavigatorBloc>().add(NavigateToLoginEvent());
            } else if (state is AuthenticationSucceeded) {
              context.read<NavigatorBloc>().add(NavigateToMainEvent());
            }

            return LoadingIndicator();
          },
        ),
        onGenerateRoute: (RouteSettings settings) {
          final elements = settings.name!.split("/");
          // final arguments = settings.arguments as Map;

          if (elements.first.isNotEmpty) {
            return null;
          }

          switch (elements.last) {
            case '':
            case 'login':
              return CupertinoPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) {
                    return LoginBloc(LoginRequired());
                  },
                  child: LoginScreen(),
                ),
              );
            case 'main':
              return CupertinoPageRoute(
                builder: (BuildContext context) => MainScreen(),
              );
          }
        },
      ),
    );
  }
}
