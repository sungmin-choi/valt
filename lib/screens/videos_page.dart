import 'package:flutter/material.dart';
import 'package:valt/controller/youtube_controller.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:get/get.dart';
import 'package:valt/widgets/youtube_tile.dart';

class VideosPage extends StatelessWidget {
  VideosPage({super.key});
  var controller = Get.find<YoutubeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title:
            const Text('👀 위스키 알아봐요', style: TextStyles.pretendardB17Gray100),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: 23,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('총 ${controller.youtubeHomeList.length.toString()}개')
            ]),
            const SizedBox(
              height: 12,
            ),
            for (var item in controller.youtubeHomeList)
              YoutubeTile(youtubeModel: item, page: 'detail'),
            const SizedBox(
              height: 12,
            )
          ]),
        ),
      ),
    );
  }
}
