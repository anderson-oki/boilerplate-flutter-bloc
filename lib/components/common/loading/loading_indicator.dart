import 'package:boilerplate_flutter/components/common/nav_close_button.dart';
import 'package:boilerplate_flutter/support/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final bool hasCloseButton;

  LoadingIndicator({Key? key, this.hasCloseButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        leading: hasCloseButton ? NavCloseButton() : Container(),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //
          ],
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(CustomTheme.PRIMARY_COLOR),
        ),
      ),
    );
  }
}
