import 'package:flutter/material.dart';

import '../styles/color_style.dart';

class InputCustom extends StatelessWidget {
  final String hintText;
  final void Function(String? value) onChanged;
  final String? Function(String? value) validator;
  const InputCustom(
      {super.key,
      required this.hintText,
      required this.onChanged,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorStyles.gray40),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorStyles.gray30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0),
          borderSide: const BorderSide(width: 1, color: ColorStyles.gray100),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorStyles.red10),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorStyles.red10),
        ),
      ),
    );
  }
}
