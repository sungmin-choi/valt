import 'package:flutter/material.dart';
import 'package:valt/screens/products_page.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/styles/color_style.dart';
import 'package:get/get.dart';

class PriceRangeItem extends StatelessWidget {
  const PriceRangeItem(
      {super.key, required this.name, this.maxPrice, this.minPrice});
  final String name;
  final int? maxPrice;
  final int? minPrice;
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
                onPressed: () {
                  Get.to(() => ProductsPage(
                        title: '$name 위스키',
                        money: true,
                        minPrice: minPrice,
                        maxPrice: maxPrice,
                      ));
                },
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
