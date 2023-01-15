import 'package:flutter/material.dart';
import 'package:valt/styles/text_style.dart';

import '../styles/color_style.dart';

class InputPasswordCustom extends StatefulWidget {
  final String hintText;
  final String? label;
  final void Function(String? value) onChanged;
  final String? Function(String? value) validator;
  const InputPasswordCustom(
      {super.key,
      this.label,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Column(
                children: [
                  Text(widget.label.toString(),
                      style: TextStyles.pretendardR14Gray100),
                  const SizedBox(height: 8)
                ],
              )
            : const SizedBox(height: 0),
        SizedBox(
          width: 343,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            obscureText: _obscureText,
            textInputAction: TextInputAction.next,
            onChanged: widget.onChanged,
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
