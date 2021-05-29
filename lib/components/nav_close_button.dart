import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavCloseButton extends StatelessWidget {
  final Color? color;

  NavCloseButton({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.close_rounded,
        color: this.color ?? Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
