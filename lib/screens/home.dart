import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/auth/register/controller/register_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/controller/youtube_controller.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/products_carousel2.dart';
import 'package:valt/widgets/youtube_carousel.dart';

class Home extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
  final ProductController productController = Get.put(ProductController());
  final YoutubeController youtubeController = Get.put(YoutubeController());
  final String logosmSvg = 'assets/icons/logosm.svg';
  final String logoGreySvg = 'assets/icons/logo_grey.svg';
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
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductCarousel2(
              label: '🏆 BEST 위스키',
              option: 'BEST',
              isBest: true,
            ),
            const SizedBox(height: 24),
            const ProductCarousel2(
              label: '🥃 편의점 위스키',
              displayCategory: 'STORE',
            ),
            const SizedBox(height: 24),
            const ProductCarousel2(
              label: '🥃 5만원 이하 가성비 위스키',
              option: 'MONEY',
            ),
            const SizedBox(height: 24),
            const YoutubeCarousel(label: '👀 위스키 알아봐요', page: 'HOME'),
            const ProductCarousel2(
              label: '🥃 스모키한 위스키',
              displayCategory: 'SMOKEY',
            ),
            const SizedBox(height: 24),
            const ProductCarousel2(
              label: '🥃 달달한 위스키',
              displayCategory: 'SWEET',
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              color: ColorStyles.gray10,
              height: 160,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(logoGreySvg),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    '발트는 국세청의 주류 통매에 관한 명령에 따라 주류에 대한',
                    style: TextStyles.pretendardN13Gray60,
                  ),
                  const Text(
                    '전자상거래를 하지 않으며, 상품에 대한 정보만을 제공합니다.',
                    style: TextStyles.pretendardN13Gray60,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
