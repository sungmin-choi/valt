import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:valt/controller/search_keywords_controller.dart';
import 'package:valt/widgets/bottomModal/sort_orderBy_bottomModal.dart';
import 'package:valt/widgets/product_tile_m.dart';

class SearchKeywordsContainer extends StatefulWidget {
  const SearchKeywordsContainer({super.key});

  @override
  State<SearchKeywordsContainer> createState() =>
      _SearchKeywordsContainerState();
}

class _SearchKeywordsContainerState extends State<SearchKeywordsContainer> {
  var controller = Get.find<SearchKeywordsController>();
  late String orderBy = 'MOST';
  final String sortIcon = 'assets/icons/sortLine.svg';

  String renderSortText(String orderBy) {
    if (orderBy == 'MOST') {
      return '평점 높은 순';
    } else if (orderBy == 'HIGH_PRICE') {
      return '가격 높은 순';
    }
    return '가격 낮은 순';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text('총 ${controller.producList.length.toString()}개')),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SortOrderByBottomModal(
                        curOrderBy: orderBy,
                        onChangeSort: (value) {
                          setState(() {
                            orderBy = value;
                          });
                          controller.fetchProductList(
                              controller.textController.text, value);
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
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 220,
          child: Expanded(
            child: Obx(() => GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.producList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 25, //수평 Padding
                    crossAxisSpacing: 20,
                    childAspectRatio: 1 / 1.9,
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: ProductTileM(controller.producList[index],
                        index: index),
                  );
                })),
          ),
        )
      ]),
    );
  }
}
