import 'package:flutter/material.dart';
import 'package:valt/widgets/label.dart';

import '../styles/color_style.dart';

class InputCustom extends StatelessWidget {
  final String hintText;
  final String? label;

  final String? Function(String? value) validator;
  final TextEditingController controller;
  const InputCustom(
      {super.key,
      this.label,
      required this.hintText,
      required this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Label(label: label) : const SizedBox(height: 0),
        SizedBox(
          width: double.maxFinite,
          child: TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
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
