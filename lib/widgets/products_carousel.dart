import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/product_tile.dart';

class ProductsCarousel extends StatelessWidget {
  ProductsCarousel(
      {super.key, required this.label, this.option, this.category});
  final ProductController productController = Get.find<ProductController>();
  final String label;

  final String? option;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyles.pretendardB18Gray100,
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
        ),
        GetX<ProductController>(builder: ((controller) {
          if (option != null) {
            if (option == 'BEST') {
              return CarouselSlider(
                items: controller.producBestList.asMap().entries.map((entry) {
                  int index = entry.key;
                  Product item = entry.value;

                  return Builder(
                    builder: (BuildContext context) {
                      return ProductTile(item,
                          index: index, size: controller.producBestList.length);
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    height: 330,
                    viewportFraction: 0.4,
                    enableInfiniteScroll: false,
                    padEnds: false),
              );
            } else if (option == 'MONEY') {
              return CarouselSlider(
                items: controller.producMoneyList.asMap().entries.map((entry) {
                  int index = entry.key;
                  Product item = entry.value;

                  return Builder(
                    builder: (BuildContext context) {
                      return ProductTile(item,
                          index: index,
                          size: controller.producMoneyList.length);
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    height: 330,
                    viewportFraction: 0.4,
                    enableInfiniteScroll: false,
                    padEnds: false),
              );
            }
            if (category != null) {
              return CarouselSlider(
                items:
                    controller.producCategoryList.asMap().entries.map((entry) {
                  int index = entry.key;
                  Product item = entry.value;

                  return Builder(
                    builder: (BuildContext context) {
                      return ProductTile(item,
                          index: index,
                          size: controller.producCategoryList.length);
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    height: 330,
                    viewportFraction: 0.4,
                    enableInfiniteScroll: false,
                    padEnds: false),
              );
            }
          }

          return CarouselSlider(
            items: controller.producBestList.asMap().entries.map((entry) {
              int index = entry.key;
              Product item = entry.value;

              return Builder(
                builder: (BuildContext context) {
                  return ProductTile(item,
                      index: index, size: controller.producBestList.length);
                },
              );
            }).toList(),
            options: CarouselOptions(
                height: 330,
                viewportFraction: 0.4,
                enableInfiniteScroll: false,
                padEnds: false),
          );
        })),
      ],
    );
  }
}
