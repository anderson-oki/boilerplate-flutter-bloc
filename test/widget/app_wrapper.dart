import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CupertinoAppWrapper extends StatelessWidget {
  const CupertinoAppWrapper({Key? key, this.children, this.home})
      : super(key: key);

  final List<Widget>? children;

  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            decodeStrategies: [JsonDecodeStrategy()],
          ),
        ),
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: home ??
          CupertinoPageScaffold(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children!,
            ),
          ),
    );
  }
}
