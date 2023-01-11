import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valt/widgets/button_lg_fill.dart';

class AuthFirstPage extends StatelessWidget {
  const AuthFirstPage({super.key});
  final String logoSvg = 'assets/icons/logo.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 120),
            const Text(
              '위스키의 시작은',
              style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff2D2C2C)),
            ),
            const SizedBox(height: 12),
            SvgPicture.asset(logoSvg),
            const SizedBox(height: 89),
            const ButtonLgFill(text: '이메일로 로그인'),
            const SizedBox(height: 8),
            const ButtonLgFill(
              text: '네이버로 로그인',
              bgColor: Color(0xff03C75A),
              textColor: Colors.white,
            ),
          ],
        )),
      ),
    );
  }
}
