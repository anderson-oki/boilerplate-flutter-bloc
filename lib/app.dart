import 'package:boilerplate_flutter/blocs/authentication/authentication_bloc.dart';
import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:boilerplate_flutter/config/locale.dart';
import 'package:boilerplate_flutter/router.dart';
import 'package:boilerplate_flutter/support/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  State<App> createState() => _AppState();

  App({Key? key}) : super(key: key);
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final router = AppRouter.make(BlocProvider.of<AuthenticationBloc>(context));

    return CupertinoApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
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
      supportedLocales: Locale.SUPPORTED_LOCALES,
    );
  }
}
