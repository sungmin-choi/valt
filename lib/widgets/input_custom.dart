import 'package:flutter/material.dart';
import 'package:valt/styles/text_style.dart';

import '../styles/color_style.dart';

class InputCustom extends StatelessWidget {
  final String hintText;
  final String? label;
  final void Function(String? value) onChanged;
  final String? Function(String? value) validator;
  const InputCustom(
      {super.key,
      this.label,
      required this.hintText,
      required this.onChanged,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Column(
                children: [
                  Text(label.toString(),
                      style: TextStyles.pretendardR14Gray100),
                  const SizedBox(height: 8)
                ],
              )
            : const SizedBox(height: 0),
        SizedBox(
          width: 343,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            textInputAction: TextInputAction.next,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintText: hintText,
              hintStyle: const TextStyle(color: ColorStyles.gray40),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorStyles.gray30),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorStyles.gray100),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorStyles.red10),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorStyles.red10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
