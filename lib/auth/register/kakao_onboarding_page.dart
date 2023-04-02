import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:get/get.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/labeled_checkbox.dart';

class KakaoOnboarding extends StatefulWidget {
  const KakaoOnboarding({super.key});

  @override
  State<KakaoOnboarding> createState() => _KakaoOnboardingState();
}

class _KakaoOnboardingState extends State<KakaoOnboarding> {
  void handelDisabled(bool value) {
    setState(() {
      disabled = value;
    });
  }

  TextEditingController reason = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool disabled = true;
  List whereList = ['레스토랑', '위스키바', '파티', '홈술', '선물용'];
  List whereListEnglish = ['RESTAURANT', 'WHISKEY', 'PARTY', 'HOME', 'GIFT'];
  List whereListSelected = [];
  List registerReasonList = [
    '위스키 종류를 알고 싶어요.',
    '위스키 배경 지식을 알고 싶어요.',
    '위스키 맛을 알고 싶어요.',
    '평균 가격을 알고 싶어요.',
    '사람들의 후기를 보고 싶어요.',
    '기타'
  ];
  List registerReasonListSelected = [];
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
        centerTitle: true,
        title: const Text('회원가입', style: TextStyles.pretendardB17Gray100),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                                    const Text('어디서 위스키를 가장 많이 즐기시나요?',
                                        style: TextStyles.pretendardB16Black),
                                    const SizedBox(height: 2),
                                    const Text('최대 3개까지 선택할 수 있어요.',
                                        style: TextStyles.pretendardR13Gray60),
                                    const SizedBox(height: 16),
                                    for (int i = 0; i < whereList.length; i++)
                                      LabeledCheckbox(
                                        label: whereList[i].toString(),
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        value: whereListSelected
                                            .contains(whereListEnglish[i]),
                                        onChanged: ((value) {
                                          if (!value) {
                                            whereListSelected.removeWhere(
                                                (ele) =>
                                                    ele == whereListEnglish[i]);
                                            setState(() {
                                              whereListSelected =
                                                  whereListSelected;
                                            });
                                          } else {
                                            whereListSelected
                                                .add(whereListEnglish[i]);
                                            setState(() {
                                              whereListSelected =
                                                  whereListSelected;
                                            });
                                          }
                                        }),
                                      ),
                                    const SizedBox(height: 20),
                                    const Text('가입하시는 이유를 알고 싶어요.',
                                        style: TextStyles.pretendardB16Black),
                                    const SizedBox(height: 2),
                                    const Text('최대 3개까지 선택할 수 있어요.',
                                        style: TextStyles.pretendardR13Gray60),
                                    const SizedBox(height: 16),
                                    for (var item in registerReasonList)
                                      LabeledCheckbox(
                                        label: item.toString(),
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        value: registerReasonListSelected
                                            .contains(item),
                                        onChanged: ((value) {
                                          if (!value) {
                                            registerReasonListSelected
                                                .removeWhere(
                                                    (ele) => ele == item);
                                          } else {
                                            registerReasonListSelected
                                                .add(item);
                                          }
                                        }),
                                      ),
                                    TextFormField(
                                      controller: reason,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      decoration: const InputDecoration(
                                          hintText: "내용을 입력해 주세요",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: ColorStyles.gray30)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: ColorStyles.gray90))),
                                    ),
                                    const SizedBox(height: 32),
                                    ButtonLgFill(
                                        text: '변경하기',
                                        textStyle: disabled
                                            ? TextStyles.pretendardB16Gray50
                                            : TextStyles.pretendardB16White,
                                        bgColor: disabled
                                            ? ColorStyles.gray15
                                            : ColorStyles.gray90,
                                        onClick: disabled ? () => {} : () {}),
                                    const SizedBox(height: 42),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        )),
      ),
    );
  }
}
