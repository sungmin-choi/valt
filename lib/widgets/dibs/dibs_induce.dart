import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/screens/home.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/button_lg_fill.dart';

class DibsInduce extends StatelessWidget {
  DibsInduce({super.key});
  String imgUrl = 'assets/images/dibs.png';
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image(width: 82, height: 120, image: AssetImage(imgUrl)),
      const SizedBox(
        height: 16,
      ),
      const Text(
        '찜한 위스키가 없어요.',
        style: TextStyles.pretendardN16Gray90w700,
      ),
      const SizedBox(
        height: 8,
      ),
      const Text(
        '마음에 드는 위스키를 찾아 찜해보세요.',
        style: TextStyles.pretendardB14Gray60,
      ),
      const SizedBox(
        height: 24,
      ),
      ButtonLgFill(
          text: '내게 맞는 위스키 찾아보기',
          textStyle: TextStyles.pretendardR14Gray90W600,
          onClick: () => Get.to(() => Home())),
      const SizedBox(
        height: 100,
      ),
    ]);
  }
}
