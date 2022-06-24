import 'package:boilerplate_flutter/blocs/authentication/bloc.dart';
import 'package:boilerplate_flutter/blocs/login/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginSucceeded) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationRequested());

          // GoRouter.of(context).push(AppRouter.ROUTE_MAIN_PATH);
        }
      },
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Login Screen'),
                CupertinoButton(
                  child: const Text('Authenticate'),
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context).add(LoginRequested());
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
