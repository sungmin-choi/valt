import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class ProductInfoList extends StatelessWidget {
  const ProductInfoList({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorStyles.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      width: double.infinity,
      child: Row(
        children: [
          Text(
            label,
            style: TextStyles.pretendardN15Gray70,
          ),
          const SizedBox(width: 28),
          Flexible(
              child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text: TextSpan(
              text: value,
              style: TextStyles.pretendardN15Gray90,
            ),
          )),
        ],
      ),
    );
  }
}
