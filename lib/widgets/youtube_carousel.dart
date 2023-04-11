import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:valt/controller/youtube_controller.dart';
import 'package:valt/model/youtube_model.dart';
import 'package:valt/screens/videos_page.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/youtube_tile.dart';

class YoutubeCarousel extends StatelessWidget {
  const YoutubeCarousel({
    super.key,
    required this.label,
    required this.page,
  });

  final String label;

  final String page;
  final String chevronRight = 'assets/icons/chevron-right.svg';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyles.pretendardB18Gray100,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => VideosPage());
                },
                child: Row(
                  children: [
                    const Text(
                      '더보기',
                      style: TextStyle(color: ColorStyles.gray60),
                    ),
                    SvgPicture.asset(chevronRight)
                  ],
                ),
              )
            ],
          ),
        ),
        GetX<YoutubeController>(builder: ((controller) {
          return CarouselSlider(
            items: controller.getProductList(page).asMap().entries.map((entry) {
              int index = entry.key;
              YoutubeModel item = entry.value;

              return Builder(
                builder: (BuildContext context) {
                  return YoutubeTile(
                    youtubeModel: item,
                    page: 'HOME',
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
                height: 270,
                viewportFraction: 0.65,
                enableInfiniteScroll: false,
                padEnds: false),
          );
        })),
      ],
    );
  }
}
