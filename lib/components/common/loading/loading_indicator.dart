import 'package:boilerplate_flutter/components/common/nav_close_button.dart';
import 'package:boilerplate_flutter/support/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key, this.hasCloseButton = false})
      : super(key: key);

  final bool hasCloseButton;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        leading: hasCloseButton ? const NavCloseButton() : Container(),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.PRIMARY_COLOR),
        ),
      ),
    );
  }
}
