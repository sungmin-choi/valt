import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/auth/register/controller/register_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valt/auth/auth_first_page.dart';
import 'package:valt/controller/product_controller.dart';
import 'package:valt/controller/youtube_controller.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/widgets/products_carousel.dart';
import 'package:valt/widgets/youtube_carousel.dart';

class Home extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
  final ProductController productController = Get.put(ProductController());
  final YoutubeController youtubeController = Get.put(YoutubeController());
  final String logosmSvg = 'assets/icons/logosm.svg';

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
                print('memberId: $memberId');
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
            const SizedBox(height: 24),
            const YoutubeCarousel(label: '👀 위스키 알아봐요', page: 'HOME'),
          ],
        ),
      ),
    );
  }
}
