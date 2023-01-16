import 'package:flutter/material.dart';

class ButtonM extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color bgColor;

  final void Function() onClick;
  const ButtonM(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.onClick,
      this.bgColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.0,
      color: bgColor,
      // width: double.maxFinite,
      height: 42.0,
      child: OutlinedButton(
        onPressed: onClick,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
