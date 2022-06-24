import 'package:flutter/material.dart';

class NavCloseButton extends StatelessWidget {
  const NavCloseButton({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.close_rounded,
        color: color ?? Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
