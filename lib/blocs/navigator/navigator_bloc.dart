import 'package:boilerplate_flutter/blocs/navigator/navigator_event.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> key;

  NavigatorBloc(this.key) : super(0) {
    on<NavigateToLoginEvent>(
      (NavigatorEvent event, Emitter emit) {
        key.currentState!.pushNamed('/login');
      },
    );

    on<NavigateToMainEvent>(
      (NavigatorEvent event, Emitter emit) {
        key.currentState!.pushNamed('/main');
      },
    );
  }
}
