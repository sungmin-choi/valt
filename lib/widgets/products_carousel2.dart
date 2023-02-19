import 'package:get/get.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/product_tile.dart';

class ProductCarousel2 extends StatefulWidget {
  const ProductCarousel2(
      {super.key, required this.label, this.option, this.category});
  final String label;

  final String? option;
  final String? category;

  @override
  State<ProductCarousel2> createState() => _ProductCarouselState2();
}

class _ProductCarouselState2 extends State<ProductCarousel2> {
  final ProductController productController = Get.put(ProductController());
  final List<Product> product = [];

  @override
  void initState() {
    if (widget.option != null) {
      if (widget.option == 'BEST') {
        setState(() {
          product.assignAll(productController.producBestList);
        });
      } else if (widget.option == 'MONEY') {
        setState(() {
          product.assignAll(productController.producMoneyList);
        });
      }
    }

    super.initState();
  }

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
                widget.label,
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
        Obx(
          () => CarouselSlider(
            items:
                productController.producBestList.asMap().entries.map((entry) {
              int index = entry.key;
              Product item = entry.value;
              return Builder(
                builder: (BuildContext context) {
                  return ProductTile(item,
                      index: index,
                      size: productController.producBestList.length);
                },
              );
            }).toList(),
            options: CarouselOptions(
                height: 330,
                viewportFraction: 0.4,
                enableInfiniteScroll: false,
                padEnds: false),
          ),
        ),
      ],
    );
  }
}
