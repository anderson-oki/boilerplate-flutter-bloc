import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_wrapper.dart';

class ScreenPumper {
  static Future<void> pumpScreenMultiBloc(
    WidgetTester tester,
    Widget screen,
    List<BlocProvider> providers, {
    int waitFramesCount = 0,
  }) async {
    await tester.pumpWidget(
      CupertinoAppWrapper(
        home: MultiBlocProvider(providers: providers, child: screen),
      ),
    );

    if (waitFramesCount <= 0) {
      await tester.pumpAndSettle();

      return;
    }

    for (var i = 0; i < waitFramesCount; i += 1) {
      await tester.pump(const Duration(milliseconds: 17));
    }
  }

  static Future<void> pumpScreenSingleBloc<T extends Bloc<dynamic, dynamic>>(
    WidgetTester tester,
    Widget screen,
    T bloc, {
    int waitFramesCount = 0,
  }) async {
    await tester.pumpWidget(
      CupertinoAppWrapper(
        home: BlocProvider<T>(
          create: (BuildContext context) => bloc,
          child: screen,
        ),
      ),
    );

    if (waitFramesCount <= 0) {
      await tester.pumpAndSettle();

      return;
    }

    for (var i = 0; i < waitFramesCount; i += 1) {
      await tester.pump(const Duration(milliseconds: 17));
    }
  }
}

mixin MultiBloc on Bloc<dynamic, dynamic> {}
