import 'package:flutter/material.dart';

class ButtonLgFill extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  const ButtonLgFill(
      {super.key,
      required this.text,
      this.textColor = const Color(0xff5B6166),
      this.bgColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: 343.0,
      height: 52.0,
      child: OutlinedButton(
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700),
        ),
        onPressed: () {},
      ),
    );
  }
}

// Color(0xff5B6166)