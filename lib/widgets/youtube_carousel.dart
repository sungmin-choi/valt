import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/controller/youtube_controller.dart';
import 'package:valt/model/youtube_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
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
        GetX<YoutubeController>(builder: ((controller) {
          return CarouselSlider(
            items: controller.getProductList(page).asMap().entries.map((entry) {
              int index = entry.key;
              YoutubeModel item = entry.value;

              return Builder(
                builder: (BuildContext context) {
                  return YoutubeTile(youtubeModel: item);
                },
              );
            }).toList(),
            options: CarouselOptions(
                height: 220,
                viewportFraction: 0.5,
                enableInfiniteScroll: false,
                padEnds: false),
          );
        })),
      ],
    );
  }
}
