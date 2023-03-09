import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/product_tile_m.dart';
import 'package:flutter_svg/svg.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({
    super.key,
    required this.title,
    this.category,
    this.country,
    this.displayCategory,
    this.orderBy,
    this.maxPrice,
    this.minPrice,
  });

  final String? category;
  final String? country;
  final String? displayCategory;
  final String? orderBy;
  int? maxPrice;
  int? minPrice;
  final String title;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductController controller = Get.find<ProductController>();
  final String sortIcon = 'assets/icons/sortLine.svg';

  @override
  void initState() {
    super.initState();
    controller
        .fetchProductList(category, country, displayCategory, orderBy, money,
            maxPrice, minPrice)
        .then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title, style: TextStyles.pretendardB17Gray100),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: 23,
          ),
        ),
        elevation: 0,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                    '총 ${controller.getProductList(widget.option, widget.category).length.toString()}개'),
                Row(
                  children: [SvgPicture.asset(sortIcon), const Text('평점 높은 순')],
                )
              ]),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller
                        .getProductList(widget.option, widget.category)
                        .length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 25, //수평 Padding
                            crossAxisSpacing: 20,
                            childAspectRatio: 1 / 1.9,
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: ProductTileM(
                            controller.getProductList(
                                widget.option, widget.category)[index],
                            index: index),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
