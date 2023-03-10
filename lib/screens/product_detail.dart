import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product_detail_model.dart';
import 'package:valt/service/network_handler/product_service.dart';
import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/bottomModal/average_price_bottom_modal.dart';
import 'package:valt/widgets/product_info_list.dart';
import 'package:valt/widgets/bottomModal/whiskybase_info_bottom_modal.dart';
import 'package:valt/widgets/products_carousel2.dart';
import 'package:valt/widgets/youtube_tile.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.itemsId});
  final int itemsId;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var f = NumberFormat('###,###,###,###');
  final ProductController productController = Get.find<ProductController>();
  String _category = '';
  bool viewCarousel = false;
  ProductDetail product = ProductDetail(
      itemsId: 0,
      name: '',
      englishName: '',
      price: 0,
      size: 0,
      strength: 0,
      country: '',
      categoryName: '',
      rating: 0,
      ratingCount: 0,
      linkUrl: '',
      category: 'aaaa',
      like: false,
      youtube: []);

  @override
  void initState() {
    super.initState();
    ProductServices.fetchProductDetail(widget.itemsId)
        .then((response) => setState(() {
              if (response != null) {
                product = response;
                _category = response.category;
                viewCarousel = true;
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.gray20,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(color: ColorStyles.white),
                  height: 368,
                  width: double.infinity,
                  child: Image.network(
                    product.linkUrl.isNotEmpty
                        ? product.linkUrl
                        : "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png",
                  ),
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: ColorStyles.gray80.withOpacity(0.05),
                    ),
                    height: 368,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: ColorStyles.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyles.pretendardN17Gray100,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.englishName,
                    style: TextStyles.pretendardB14Gray60,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const AveragePriceBottomModal();
                          });
                    },
                    child: Row(
                      children: const [
                        Text(
                          '평균가',
                          style: TextStyles.pretendardN13Gray60,
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.info_outline,
                          color: ColorStyles.gray60,
                          size: 17,
                        )
                      ],
                    ),
                  ),
                  Text(
                    '${f.format(product.price)} 원',
                    style: TextStyles.pretendardN20Gray100,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return const WhiskybaseInfoBottomModal();
                              });
                        },
                        child: const Text('위스키 베이스',
                            style: TextStyles.pretendardN15Gray60),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 22,
                      ),
                      Text(product.rating.toString(),
                          style: TextStyles.pretendardN15Gray100)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorStyles.gray20,
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: ColorStyles.white),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              width: double.infinity,
              child: const Text(
                '위스키 정보',
                style: TextStyles.pretendardB18Gray100,
              ),
            ),
            Column(
              children: [
                ProductInfoList(label: '종류', value: product.categoryName),
                ProductInfoList(
                    label: '용량', value: '${product.size.toString()}ml'),
                ProductInfoList(
                    label: '도수', value: '${product.strength.toString()}%'),
              ],
            ),
            Container(
              height: 8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorStyles.white,
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: ColorStyles.white),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              width: double.infinity,
              child: const Text(
                '테이스팅 노트',
                style: TextStyles.pretendardB18Gray100,
              ),
            ),
            Column(
              children: [
                ProductInfoList(label: 'Aroma', value: product.aroma ?? ''),
                ProductInfoList(label: 'Taste  ', value: product.taste ?? ''),
                ProductInfoList(label: 'Finish ', value: product.finish ?? ''),
              ],
            ),
            Container(
              height: 8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorStyles.gray20,
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: ColorStyles.white),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '추천영상',
                      style: TextStyles.pretendardB18Gray100,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    for (int i = 0; i < product.youtube.length; i++)
                      YoutubeTile(
                          youtubeModel: product.youtube[i], page: 'detail')
                  ]),
            ),
            Container(
              height: 8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorStyles.gray20,
              ),
            ),
            if (viewCarousel)
              Container(
                decoration: const BoxDecoration(
                  color: ColorStyles.white,
                ),
                child: ProductCarousel2(
                  label: '${product.categoryName} 위스키',
                  category: _category,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
