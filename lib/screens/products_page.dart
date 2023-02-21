import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/product_tile_m.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage(
      {super.key, this.option, this.category, required this.title});

  final String? option;
  final String? category;
  final String title;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductController controller = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
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
              Text(
                  '총 ${controller.getProductList(widget.option, widget.category).length.toString()}개'),
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
