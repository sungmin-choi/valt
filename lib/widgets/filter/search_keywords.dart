import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valt/controller/search_keywords_controller.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/bottomModal/sort_orderBy_bottomModal.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/filter/recent_searchs_keyword.dart';
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
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: controller.productList.isEmpty &&
                    controller.textController.text.isNotEmpty
                ? 48
                : 22,
            vertical: 12),
        child: Obx(
          () =>
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            if (controller.textController.text.isEmpty)
              Column(children: const [RecentSearchsKeywords()]),
            if (controller.productList.isEmpty &&
                controller.textController.text.isNotEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height - 220,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '찾으시는 위스키 결과가 없어요',
                        style: TextStyles.pretendardN16Gray90w700,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('위스키 등록을 제안해주시면'),
                      const Text('서비스에 빠르게 반영할게요.'),
                      const SizedBox(
                        height: 50,
                      ),
                      ButtonLgFill(
                          text: '위스키 등록 제안하기',
                          textStyle: TextStyles.pretendardN16Gray90w700,
                          onClick: () async {
                            if (await canLaunchUrl(Uri.parse(
                                'https://forms.gle/JWLC13RgJhtYx5tw5'))) {
                              await launchUrl(
                                  Uri.parse(
                                      'https://forms.gle/JWLC13RgJhtYx5tw5'),
                                  mode: LaunchMode.externalApplication);
                            }
                          })
                    ],
                  ),
                ),
              ),
            if (controller.productList.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() =>
                      Text('총 ${controller.productList.length.toString()}개')),
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
            if (controller.productList.isNotEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height - 220,
                child: Expanded(
                  child: Obx(() => GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 25, //수평 Padding
                              crossAxisSpacing: 20,
                              childAspectRatio: 1 / 1.9,
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          child: ProductTileM(controller.productList[index],
                              index: index),
                        );
                      })),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
