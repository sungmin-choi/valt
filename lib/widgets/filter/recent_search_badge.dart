import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class RecentSearchBadge extends StatelessWidget {
  const RecentSearchBadge({
    super.key,
    required this.text,
    required this.onClick,
  });

  final String text;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onClick();
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: ColorStyles.gray20,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)))),
      child: Text(text, style: TextStyles.pretendardN14Gray60W400),
    );
  }
}
