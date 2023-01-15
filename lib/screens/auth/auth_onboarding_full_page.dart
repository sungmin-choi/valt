import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:get/get.dart';
import 'package:valt/styles/text_style.dart';

class OnboardingFullPage extends StatefulWidget {
  const OnboardingFullPage({super.key});

  @override
  State<OnboardingFullPage> createState() => _OnboardingFullPageState();
}

class _OnboardingFullPageState extends State<OnboardingFullPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
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
        title: const Text('회원가입', style: TextStyles.pretendardB17Gray100),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('프로필', style: TextStyles.pretendardB20Black),
                    SizedBox(height: 2),
                    Text('계정을 찾기 위해 정확하게 적어주세요.',
                        style: TextStyles.pretendardR14Gray70)
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
