import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/bottomModal/category_info_bottom_modal.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valt/widgets/bottomModal/sort_orderBy_bottomModal.dart';
import 'package:valt/widgets/product_tile_m.dart';

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
  static const _pageSize = 20;

  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);

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

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(
          widget.category,
          widget.country,
          widget.displayCategory,
          orderBy,
          widget.option,
          widget.money,
          widget.maxPrice,
          widget.minPrice,
          _pageSize,
          pageKey);
    });
  }

  Future<void> _fetchPage(
      String? category,
      String? country,
      String? displayCategory,
      String? orderBy,
      String? option,
      bool? money,
      int? maxPrice,
      int? minPrice,
      int? size,
      int? page) async {
    try {
      final products = await controller.fetchProductList(
          category,
          country,
          displayCategory,
          orderBy,
          option,
          money,
          maxPrice,
          minPrice,
          size,
          page);
      final isLastPage = products!.last;
      if (totalLength == 0) {
        setState(() {
          totalLength = products.totalElements;
        });
      }
      if (isLastPage) {
        _pagingController.appendLastPage(products.content);
      } else {
        final nextPageKey = page! + 1;
        _pagingController.appendPage(products.content, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
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
                            _pagingController.refresh();
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
                child: PagedGridView<int, Product>(
              showNewPageProgressIndicatorAsGridChild: true,
              showNewPageErrorIndicatorAsGridChild: false,
              showNoMoreItemsIndicatorAsGridChild: true,
              pagingController: _pagingController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 20,
                childAspectRatio: 1 / 1.9,
              ),
              builderDelegate: PagedChildBuilderDelegate<Product>(
                  itemBuilder: (BuildContext context, item, index) =>
                      ProductTileM(item, index: index)),
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
