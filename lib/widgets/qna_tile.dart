import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class QNATile extends StatelessWidget {
  const QNATile({super.key, required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(question, style: TextStyles.pretendardB16Black),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: ColorStyles.gray10,
          ),
          child: Text(
            answer,
            style: TextStyles.pretendardN14Gray90W400,
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
