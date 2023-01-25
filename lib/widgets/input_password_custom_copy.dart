import 'package:flutter/material.dart';
import 'package:valt/widgets/label.dart';

import '../styles/color_style.dart';

class InputPasswordCustomCopy extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? label;

  final String? Function(String? value) validator;
  const InputPasswordCustomCopy({
    super.key,
    this.label,
    required this.hintText,
    required this.validator,
    required this.controller,
  });

  @override
  State<InputPasswordCustomCopy> createState() =>
      _InputPasswordCustomCopyState();
}

class _InputPasswordCustomCopyState extends State<InputPasswordCustomCopy> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Label(label: widget.label)
            : const SizedBox(height: 0),
        SizedBox(
          width: double.maxFinite,
          child: TextFormField(
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: _obscureText,
            textInputAction: TextInputAction.next,
            validator: widget.validator,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ColorStyles.gray50),
                onPressed: _toggle,
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: ColorStyles.gray40),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorStyles.gray30),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorStyles.gray100),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                gapPadding: 10.0,
                borderSide: BorderSide(width: 1, color: ColorStyles.red10),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: ColorStyles.red10,
                    strokeAlign: StrokeAlign.outside),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
