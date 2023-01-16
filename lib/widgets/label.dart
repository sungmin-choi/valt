import 'package:flutter/material.dart';
import 'package:valt/styles/text_style.dart';

class Label extends StatelessWidget {
  final String? label;
  const Label({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label.toString(), style: TextStyles.pretendardR14Gray100),
        const SizedBox(height: 8)
      ],
    );
  }
}
