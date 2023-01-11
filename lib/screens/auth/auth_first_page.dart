import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valt/screens/auth/auth_email_login_page.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
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
                  color: Color(0xff2D2C2C),
                ),
              ),
              const SizedBox(height: 12),
              SvgPicture.asset(logoSvg),
              const SizedBox(height: 89),
              ButtonLgFill(
                text: '이메일로 로그인',
                textStyle: TextStyles.pretendardB16Gray80,
                onClick: () {
                  Get.to(() => const EmailLoginPage());
                },
              ),
              const SizedBox(height: 8),
              ButtonLgFill(
                text: '네이버로 로그인',
                bgColor: const Color(0xff03C75A),
                textStyle: TextStyles.pretendardB16White,
                onClick: () => {},
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => {},
                      child: const Text('이메일로 가입',
                          style: TextStyles.pretendardR14Gray70)),
                  Container(
                    width: 1,
                    height: 12,
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    decoration: const BoxDecoration(color: ColorStyles.gray30),
                  ),
                  TextButton(
                      onPressed: () => {},
                      child: const Text(
                        '비밀번호 재설정',
                        style: TextStyles.pretendardR14Gray70,
                      ))
                ],
              ),
              const SizedBox(height: 173),
              const Text(
                '가입한 이메일이 기억이 안 난다면 고객센터로 문의해 주세요.',
                style: TextStyles.pretendardR13Gray60,
              ),
              TextButton(
                onPressed: () => {},
                child: const Text(
                  '고객센터 문의하기',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}