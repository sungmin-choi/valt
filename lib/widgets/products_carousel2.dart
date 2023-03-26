import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product.dart';
import 'package:flutter/material.dart';
import 'package:valt/screens/products_page.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/product_tile.dart';

class ProductCarousel2 extends StatefulWidget {
  const ProductCarousel2(
      {super.key,
      required this.label,
      this.option,
      this.category,
      this.isBest});
  final String label;
  final String? option;
  final String? category;
  final bool? isBest;

  @override
  State<ProductCarousel2> createState() => _ProductCarouselState2();
}

class _ProductCarouselState2 extends State<ProductCarousel2> {
  final ProductController productController = Get.put(ProductController());
  late List<Product> products = [];
  var isLoading = true;
  @override
  void initState() {
    super.initState();
    productController
        .fetchProductList(widget.category, null, null, null, widget.option,
            null, null, null, 10, 0)
        .then((value) => {
              if (value != null)
                setState(
                  () {
                    products = value.content;
                    isLoading = false;
                  },
                )
            })
        .onError((error, stackTrace) => {
              setState(() {
                isLoading = false;
              })
            });
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
                  onPressed: () {
                    Get.to(() => ProductsPage(
                          title: widget.label,
                          category: widget.category,
                          option: widget.option,
                        ));
                  },
                  icon: const Icon(Icons.chevron_right))
            ],
          ),
        ),
        isLoading
            ? SizedBox(
                height: 190,
                width: double.infinity,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulseSync,

                  /// Required, The loading type of the widget
                  colors: const [Colors.white],

                  /// Optional, The stroke of the line, only applicable to widget which contains line
                  backgroundColor: Colors.black.withOpacity(0.2),

                  /// Optional, Background of the widget
                  pathBackgroundColor: Colors.black.withOpacity(0.2),

                  /// Optional, the stroke backgroundColor
                ),
              )
            : CarouselSlider(
                items: products.asMap().entries.map((entry) {
                  int index = entry.key;
                  Product item = entry.value;
                  return Builder(
                    builder: (BuildContext context) {
                      return ProductTile(item,
                          index: index,
                          isBest: widget.isBest,
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
      ],
    );
  }
}
