import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/auth/register/controller/register_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valt/auth/auth_first_page.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/model/product.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/widgets/products_carousel.dart';

class Home extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
  final ProductController productController = Get.put(ProductController());
  final String logosmSvg = 'assets/icons/logosm.svg';

  final List<Product> list = [
    Product(
        itemsId: 10,
        name: "노아스 밑",
        englishName: "Noah's Mill",
        price: 173000,
        size: 750,
        strength: 57,
        country: '미국',
        categoryName: "BOURBON",
        linkUrl:
            "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png",
        rating: 2.7,
        ratingCount: 52,
        like: true,
        viewCount: 144,
        category: 'SINGLE_MALT'),
    Product(
        itemsId: 10,
        name: "글렌파클라스 105 CS 1L",
        englishName: "Noah's Mill",
        price: 164900,
        size: 750,
        strength: 57,
        country: '스코틀랜드',
        categoryName: "싱글몰트",
        linkUrl:
            "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png",
        rating: 2.7,
        ratingCount: 52,
        like: false,
        viewCount: 144,
        category: 'SINGLE_MALT'),
    Product(
        itemsId: 10,
        name: "노아스 밑",
        englishName: "Noah's Mill",
        price: 173000,
        size: 750,
        strength: 57,
        country: '미국',
        categoryName: "BOURBON",
        linkUrl:
            "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png",
        rating: 2.7,
        ratingCount: 52,
        like: true,
        viewCount: 144,
        category: 'SINGLE_MALT'),
    Product(
        itemsId: 10,
        name: "글렌파클라스 105 CS 1L",
        englishName: "Noah's Mill",
        price: 164900,
        size: 750,
        strength: 57,
        country: '스코틀랜드',
        categoryName: "싱글몰트",
        linkUrl:
            "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png",
        rating: 2.7,
        ratingCount: 52,
        like: false,
        viewCount: 144,
        category: 'SINGLE_MALT'),
    Product(
        itemsId: 10,
        name: "노아스 밑",
        englishName: "Noah's Mill",
        price: 173000,
        size: 750,
        strength: 57,
        country: '미국',
        categoryName: "BOURBON",
        linkUrl:
            "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png",
        rating: 2.7,
        ratingCount: 52,
        like: false,
        viewCount: 144,
        category: 'SINGLE_MALT'),
    Product(
        itemsId: 10,
        name: "글렌파클라스 105 CS 1L",
        englishName: "Noah's Mill",
        price: 164900,
        size: 750,
        strength: 57,
        country: '스코틀랜드',
        categoryName: "싱글몰트",
        linkUrl:
            "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png",
        rating: 2.7,
        ratingCount: 52,
        like: true,
        viewCount: 144,
        category: 'SINGLE_MALT'),
  ];

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
            ProductsCarousel(
              label: '🏆 BEST 위스키',
              option: 'BEST',
              isBest: true,
            ),
            const SizedBox(height: 24),
            ProductsCarousel(
              label: '🥃 5만원 이하 가성비 위스키',
              option: 'MONEY',
            ),
          ],
        ),
      ),
    );
  }
}
