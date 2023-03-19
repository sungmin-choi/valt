import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/auth/auth_first_page.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/button_lg_fill.dart';

class LoginInduce extends StatelessWidget {
  LoginInduce({super.key});
  String imgUrl = 'assets/images/dibs.png';
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image(width: 82, height: 120, image: AssetImage(imgUrl)),
      const SizedBox(
        height: 16,
      ),
      const Text(
        '로그인 후 찜 기능을 사용해 주세요',
        style: TextStyles.pretendardN16Gray90w700,
      ),
      const SizedBox(
        height: 24,
      ),
      ButtonLgFill(
          text: '로그인',
          textStyle: TextStyles.pretendardR14Gray90W600,
          onClick: () => Get.to(() => AuthFirstPage())),
      const SizedBox(
        height: 100,
      ),
    ]);
  }
}
