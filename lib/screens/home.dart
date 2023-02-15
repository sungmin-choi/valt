import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/auth/register/controller/register_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valt/auth/auth_first_page.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/product_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
  final ProductController productController = Get.put(ProductController());
  final String logosmSvg = 'assets/icons/logosm.svg';
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final Product product = Product(
      itemsId: 10,
      name: "노아스 밑",
      englishName: "Noah's Mill",
      price: 173000,
      size: 750,
      strength: 57,
      country: '미국',
      categoryName: "BOURBON",
      linkUrl:
          "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png");
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44.0),
        child: AppBar(
          leadingWidth: 100,
          leading: Container(
              margin: const EdgeInsets.only(left: 16),
              child: SvgPicture.asset(logosmSvg)),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {
                var memberId = await NetWorkHandler.getMemberId();
                print(memberId);
                Get.to(() => AuthFirstPage());
              },
              icon: const Icon(
                Icons.mode_edit_outline_sharp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '🏆 BEST 위스키',
                    style: TextStyles.pretendardB18Gray100,
                  ),
                  IconButton(
                      iconSize: 30.0,
                      color: ColorStyles.gray60,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right))
                ],
              ),
            ),
            CarouselSlider(
              items: list.map((item) => ProductTile(product)).toList(),
              options: CarouselOptions(
                  height: 330,
                  viewportFraction: 0.4,
                  enableInfiniteScroll: false,
                  padEnds: false),
            ),
            const SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}
