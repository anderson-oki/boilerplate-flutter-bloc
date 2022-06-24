import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:boilerplate_flutter/blocs/login/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        BlocProvider.of<AuthenticationBloc>(context)
            .add(AuthenticationRequested());
      },
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Main Screen'),
                CupertinoButton(
                  child: const Text('Logout'),
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context).add(LogoutRequested());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
