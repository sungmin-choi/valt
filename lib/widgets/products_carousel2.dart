import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
      this.isBest,
      this.displayCategory});
  final String label;
  final String? option;
  final String? category;
  final bool? isBest;
  final String? displayCategory;

  @override
  State<ProductCarousel2> createState() => _ProductCarouselState2();
}

class _ProductCarouselState2 extends State<ProductCarousel2> {
  final ProductController productController = Get.put(ProductController());
  late List<Product> products = [];
  final String chevronRight = 'assets/icons/chevron-right.svg';
  List<Product> products_dummy = [
    Product(
        itemsId: 0,
        name: '....',
        englishName: '....',
        price: 00,
        size: 00,
        strength: 00,
        country: '...',
        categoryName: '...',
        rating: 0.0,
        ratingCount: 00,
        linkUrl: '',
        like: false,
        category: '',
        viewCount: 0),
    Product(
        itemsId: 1,
        name: '....',
        englishName: '....',
        price: 00,
        size: 00,
        strength: 00,
        country: '...',
        categoryName: '...',
        rating: 0.0,
        ratingCount: 00,
        linkUrl: '',
        like: false,
        category: '',
        viewCount: 0),
    Product(
        itemsId: 0,
        name: '....',
        englishName: '....',
        price: 00,
        size: 00,
        strength: 00,
        country: '...',
        categoryName: '...',
        rating: 0.0,
        ratingCount: 00,
        linkUrl: '',
        like: false,
        category: '',
        viewCount: 0),
    Product(
        itemsId: 2,
        name: '....',
        englishName: '....',
        price: 00,
        size: 00,
        strength: 00,
        country: '...',
        categoryName: '...',
        rating: 0.0,
        ratingCount: 00,
        linkUrl: '',
        like: false,
        category: '',
        viewCount: 0),
    Product(
        itemsId: 3,
        name: '....',
        englishName: '....',
        price: 00,
        size: 00,
        strength: 00,
        country: '...',
        categoryName: '...',
        rating: 0.0,
        ratingCount: 00,
        linkUrl: '',
        like: false,
        category: '',
        viewCount: 0)
  ];
  var isLoading = true;
  @override
  void initState() {
    super.initState();
    productController
        .fetchProductList(widget.category, null, widget.displayCategory, null,
            widget.option, null, null, null, 10, 0)
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
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: TextStyles.pretendardB18Gray100,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ProductsPage(
                        title: widget.label,
                        category: widget.category,
                        option: widget.option,
                        displayCategory: widget.displayCategory,
                      ));
                },
                child: Row(
                  children: [
                    const Text(
                      '더보기',
                      style: TextStyle(color: ColorStyles.gray60),
                    ),
                    SvgPicture.asset(chevronRight)
                  ],
                ),
              )
            ],
          ),
        ),
        isLoading
            ? CarouselSlider(
                items: products_dummy.asMap().entries.map((entry) {
                  int index = entry.key;
                  Product item = entry.value;
                  return Builder(
                    builder: (BuildContext context) {
                      return ProductTile(item,
                          isLoading: true,
                          index: index,
                          isBest: widget.isBest,
                          size: productController.producBestList.length);
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    height: 230,
                    viewportFraction: 0.4,
                    enableInfiniteScroll: false,
                    padEnds: false),
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
                    height: 280,
                    viewportFraction: 0.4,
                    enableInfiniteScroll: false,
                    padEnds: false),
              ),
      ],
    );
  }
}
