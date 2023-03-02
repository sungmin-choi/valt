import 'package:flutter/material.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/styles/color_style.dart';

class PriceRangeItem extends StatelessWidget {
  const PriceRangeItem({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyles.pretendardN15Gray90,
            ),
            IconButton(
                iconSize: 30.0,
                color: ColorStyles.gray60,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: const Icon(Icons.chevron_right))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
