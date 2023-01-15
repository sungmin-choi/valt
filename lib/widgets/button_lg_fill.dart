import 'package:flutter/material.dart';

class ButtonLgFill extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color bgColor;

  final void Function() onClick;
  const ButtonLgFill(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.onClick,
      this.bgColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: 343.0,
      height: 52.0,
      child: OutlinedButton(
        onPressed: onClick,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
