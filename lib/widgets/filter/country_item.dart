import 'package:flutter/material.dart';
import 'package:valt/screens/products_page.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:get/get.dart';

class CountryItem extends StatelessWidget {
  const CountryItem(
      {super.key,
      required this.name,
      required this.englishName,
      required this.imgUrl});

  final String name;
  final String englishName;
  final String imgUrl;
  final String chevronRight = 'assets/icons/chevron-right.svg';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.to(() => ProductsPage(
              title: '$name 위스키',
              country: name,
            ));
      }),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(width: 48, height: 30, image: AssetImage(imgUrl)),
                const SizedBox(width: 12),
                Text(
                  name,
                  style: TextStyles.pretendardN15Gray90,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  englishName,
                  style: TextStyles.pretendardN13Gray50,
                )
              ],
            ),
            IconButton(
                iconSize: 30.0,
                color: ColorStyles.gray60,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Get.to(() => ProductsPage(
                        title: '$name 위스키',
                        country: name,
                      ));
                },
                icon: const Icon(Icons.chevron_right))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
