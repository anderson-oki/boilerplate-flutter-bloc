import 'package:boilerplate_flutter/blocs/navigator/navigator_event.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> key;

  NavigatorBloc(this.key) : super(0);

  @override
  Stream<dynamic> mapEventToState(event) async* {
    if (event is NavigateToLoginEvent) {
      key.currentState!.pushNamed('/login');
    } else if (event is NavigateToMainEvent) {
      key.currentState!.pushNamed('/main');
    }
  }
}
