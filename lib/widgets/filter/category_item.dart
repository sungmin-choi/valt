import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/screens/products_page.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.name,
      required this.englishName,
      required this.imgUrl,
      required this.bottomModal,
      required this.category});

  final String name;
  final String englishName;
  final String imgUrl;
  final String category;
  final Widget bottomModal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductsPage(
              title: '$name 위스키',
              category: category,
              orderBy: 'MOST',
              bottomModal: bottomModal,
            ));
      },
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(width: 48, height: 48, image: AssetImage(imgUrl)),
                const SizedBox(width: 12),
                Text(
                  name,
                  style: TextStyles.pretendardN15Gray90,
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return bottomModal;
                        });
                  },
                  child: Row(
                    children: [
                      Text(
                        englishName,
                        style: TextStyles.pretendardN13Gray50,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.info_outline,
                        color: ColorStyles.gray60,
                        size: 17,
                      )
                    ],
                  ),
                ),
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
                        category: category,
                        orderBy: 'MOST',
                        bottomModal: bottomModal,
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
