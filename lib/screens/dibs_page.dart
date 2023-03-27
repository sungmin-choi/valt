import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/dibs/dibs_induce.dart';
import 'package:valt/widgets/dibs/login_induce.dart';
import 'package:get/get.dart';
import 'package:valt/widgets/product_tile_m.dart';

class DibsPage extends StatefulWidget {
  const DibsPage({super.key});

  @override
  State<DibsPage> createState() => _DibsPageState();
}

class _DibsPageState extends State<DibsPage> {
  var controller = Get.find<ProductController>();
  var totalLength = 0;
  var isError = false;
  var isEmpty = false;
  var _memberId;
  late List<Product> products = [];
  static const _pageSize = 20;
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    NetWorkHandler.getMemberId().then((value) => {
          setState(() {
            print(value);
            _memberId = value;
          })
        });

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(_pageSize, pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int? size, int? page) async {
    try {
      final products = await controller.fetchDibsProductList(size, page);
      final isLastPage = products!.last;
      if (products.empty) {
        setState(() {
          isEmpty = true;
        });
      }
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
      setState(() {
        isError = true;
      });
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text('찜한 상품', style: TextStyles.pretendardB17Gray100),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (isError && _memberId == null) ...[
              LoginInduce(),
            ] else if (isEmpty) ...[
              DibsInduce(),
            ] else ...[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('총 ${totalLength.toString()}개'),
              ]),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                  child: PagedGridView<int, Product>(
                showNewPageProgressIndicatorAsGridChild: true,
                showNewPageErrorIndicatorAsGridChild: true,
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
                        ProductTileM(
                          item,
                          index: index,
                          type: 'dib',
                        )),
              ))
            ]
          ])),
    );
  }
}
