import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/bottomModal/category_info_bottom_modal.dart';
import 'package:valt/widgets/bottomModal/sort_orderBy_bottomModal.dart';
import 'package:valt/widgets/product_tile_m.dart';
import 'package:flutter_svg/svg.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    super.key,
    required this.title,
    this.category,
    this.country,
    this.displayCategory,
    this.orderBy,
    this.option,
    this.maxPrice,
    this.minPrice,
    this.money,
    this.bottomModal,
    this.searchText,
  });

  final Widget? bottomModal;
  final String? category;
  final String? country;
  final String? displayCategory;
  final String? orderBy;
  final String? option;
  final bool? money;
  final int? maxPrice;
  final int? minPrice;
  final String? searchText;
  final String title;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductController controller = Get.find<ProductController>();
  final String sortIcon = 'assets/icons/sortLine.svg';
  late List<Product> products = [];
  late String orderBy = 'MOST';
  var totalLength = 0;
  String renderSortText(String orderBy) {
    if (orderBy == 'MOST') {
      return '평점 높은 순';
    } else if (orderBy == 'HIGH_PRICE') {
      return '가격 높은 순';
    }
    return '가격 낮은 순';
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      orderBy = widget.orderBy ?? 'MOST';
    });
    controller
        .fetchProductList(
            widget.category,
            widget.country,
            widget.displayCategory,
            widget.orderBy,
            widget.option,
            widget.money,
            widget.maxPrice,
            widget.minPrice,
            20,
            1)
        .then((value) => {
              if (value != null)
                setState(
                  () {
                    products = value.content;
                    totalLength = value.totalElements;
                  },
                )
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: widget.searchText != null
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
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
              actions: [
                if (widget.bottomModal != null)
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return widget.bottomModal ??
                                  const CategoryInfoBottomModal(
                                      title: ' 위스키', infoText: '준비중');
                            });
                      },
                      icon: const Icon(Icons.info_outline,
                          color: ColorStyles.gray60, size: 22))
              ],
              elevation: 0,
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('총 ${totalLength.toString()}개'),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      builder: (BuildContext context) {
                        return SortOrderByBottomModal(
                          curOrderBy: orderBy,
                          onChangeSort: (value) {
                            setState(() {
                              orderBy = value;
                            });
                            controller
                                .fetchProductList(
                                    widget.category,
                                    widget.country,
                                    widget.displayCategory,
                                    value,
                                    widget.option,
                                    widget.money,
                                    widget.maxPrice,
                                    widget.minPrice,
                                    20,
                                    1)
                                .then((value) => {
                                      if (value != null)
                                        setState(
                                          () {
                                            products = value.content;
                                          },
                                        )
                                    });
                          },
                        );
                      });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(sortIcon),
                    Text(renderSortText(orderBy))
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 25, //수평 Padding
                      crossAxisSpacing: 20,
                      childAspectRatio: 1 / 1.9,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: ProductTileM(products[index], index: index),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
