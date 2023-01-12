import 'package:flutter/material.dart';

import '../styles/color_style.dart';

class InputPasswordCustom extends StatefulWidget {
  final String hintText;
  final void Function(String? value) onChanged;
  final String? Function(String? value) validator;
  const InputPasswordCustom(
      {super.key,
      required this.hintText,
      required this.onChanged,
      required this.validator});

  @override
  State<InputPasswordCustom> createState() => _InputPasswordCustomState();
}

class _InputPasswordCustomState extends State<InputPasswordCustom> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
              color: ColorStyles.gray50),
          onPressed: _toggle,
        ),
        hintText: widget.hintText,
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
