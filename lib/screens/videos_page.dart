import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:get/get.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const []),
        ]),
      ),
    );
  }
}
