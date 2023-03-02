import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class Badge extends StatelessWidget {
  const Badge(
      {super.key,
      required this.text,
      required this.onClick,
      required this.isFocus});

  final String text;
  final bool isFocus;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onClick();
      },
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: isFocus ? Colors.black : ColorStyles.gray40,
            style: BorderStyle.solid,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)))),
      child: Text(text,
          style: isFocus
              ? TextStyles.pretendardN14Gray90
              : TextStyles.pretendardN14Gray40W400),
    );
  }
}
