import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:get/get.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/buttom_m.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/input_custom.dart';
import 'package:valt/widgets/label.dart';
import 'package:valt/widgets/labeled_checkbox.dart';

class OnboardingFullPage extends StatefulWidget {
  const OnboardingFullPage({super.key});

  @override
  State<OnboardingFullPage> createState() => _OnboardingFullPageState();
}

class _OnboardingFullPageState extends State<OnboardingFullPage> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? birthDate;
  bool? gender;
  bool _isSelected = false;
  List whereList = ['레스토랑', '위스키바', '파티', '홈술', '선물용'];
  List registerReasonList = ['레스토랑', '위스키바', '파티', '홈술', '선물용', '기타'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.gray20,
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
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  color: ColorStyles.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('프로필',
                              style: TextStyles.pretendardB20Black),
                          const SizedBox(height: 2),
                          const Text('계정을 찾기 위해 정확하게 적어주세요.',
                              style: TextStyles.pretendardR14Gray70),
                          const SizedBox(height: 20),
                          InputCustom(
                              hintText: '이름 입력',
                              onChanged: ((value) {
                                name = value;
                              }),
                              label: '이름',
                              validator: ((value) {
                                if (value != null && value.isEmpty) {
                                  return "이름을 입력해 주세요";
                                }
                                return null;
                              })),
                          const SizedBox(height: 20),
                          const Label(label: '성별'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: ButtonM(
                                    text: '남',
                                    textStyle: TextStyles.pretendardN14Gray90,
                                    onClick: () => {}),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                  fit: FlexFit.tight,
                                  child: ButtonM(
                                      text: '여',
                                      textStyle: TextStyles.pretendardN14Gray90,
                                      onClick: () => {})),
                            ],
                          ),
                          const SizedBox(height: 20),
                          InputCustom(
                              hintText: 'ex) 19990101',
                              onChanged: ((value) {
                                name = value;
                              }),
                              label: '생년월일',
                              validator: ((value) {
                                if (value != null && value.isEmpty) {
                                  return "이름을 입력해 주세요";
                                }
                                return null;
                              })),
                          const SizedBox(height: 32),
                        ]),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  color: ColorStyles.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 32),
                          const Text('취향 설정',
                              style: TextStyles.pretendardB20Black),
                          const SizedBox(height: 2),
                          const Text('취향에 맞는 위스키를 추천해드릴게요.',
                              style: TextStyles.pretendardR14Gray70),
                          const SizedBox(height: 32),
                          const Text('어디서 위스키를 즐기시나요?',
                              style: TextStyles.pretendardB16Black),
                          const SizedBox(height: 2),
                          const Text('복수 선택 가능해요.',
                              style: TextStyles.pretendardR13Gray60),
                          const SizedBox(height: 16),
                          for (var item in whereList)
                            LabeledCheckbox(
                                label: item.toString(),
                                padding: const EdgeInsets.only(bottom: 10),
                                value: _isSelected,
                                onChanged: ((value) {
                                  setState(() {
                                    _isSelected = value;
                                  });
                                })),
                          const SizedBox(height: 20),
                          const Text('가입하시는 이유를 알고 싶어요.',
                              style: TextStyles.pretendardB16Black),
                          const SizedBox(height: 2),
                          const Text('복수 선택 가능해요.',
                              style: TextStyles.pretendardR13Gray60),
                          const SizedBox(height: 16),
                          for (var item in whereList)
                            LabeledCheckbox(
                                label: item.toString(),
                                padding: const EdgeInsets.only(bottom: 10),
                                value: _isSelected,
                                onChanged: ((value) {
                                  setState(() {
                                    _isSelected = value;
                                  });
                                })),
                          const SizedBox(height: 32),
                          ButtonLgFill(
                              text: '다음',
                              bgColor: ColorStyles.gray90,
                              textStyle: TextStyles.pretendardB16White,
                              onClick: () => {}),
                          const SizedBox(height: 42),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
