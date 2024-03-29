import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:valt/auth/login/email_login_page.dart';

import 'package:valt/auth/register/controller/register_controller.dart';
import 'package:valt/styles/color_style.dart';
import 'package:get/get.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/auth/agree_terms_bottom_modal.dart';
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
  final RegisterController registerController = Get.find<RegisterController>();

  final _formKey = GlobalKey<FormState>();
  void handelDisabled(bool value) {
    setState(() {
      disabled = value;
    });
  }

  List whereList = ['레스토랑', '위스키바', '파티', '홈술', '선물용'];
  List whereListEnglish = ['RESTAURANT', 'WHISKEY', 'PARTY', 'HOME', 'GIFT'];
  List registerReasonList = [
    '위스키 종류를 알고 싶어요.',
    '위스키 배경 지식을 알고 싶어요.',
    '위스키 맛을 알고 싶어요.',
    '평균 가격을 알고 싶어요.',
    '사람들의 후기를 보고 싶어요.',
    '기타'
  ];
  bool disabled = true;

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
          child: Form(
            onChanged: () {
              if (registerController.usernameTextController.text.isNotEmpty &&
                  registerController.birthDateTextController.text.isNotEmpty) {
                var valid = _formKey.currentState!.validate();
                if (!valid) {
                  handelDisabled(true);
                } else {
                  handelDisabled(false);
                }
              } else {
                handelDisabled(true);
              }
            },
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
                              controller:
                                  registerController.usernameTextController,
                              hintText: '이름 입력',
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
                                child: Obx(
                                  () => ButtonM(
                                      text: '남',
                                      bgColor:
                                          registerController.gender.value == 'M'
                                              ? ColorStyles.gray90
                                              : ColorStyles.white,
                                      textStyle:
                                          registerController.gender.value == 'M'
                                              ? TextStyles.pretendardN14White
                                              : TextStyles.pretendardN14Gray90,
                                      onClick: () => {
                                            registerController.gender.value =
                                                'M'
                                          }),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                  fit: FlexFit.tight,
                                  child: Obx(
                                    () => ButtonM(
                                        text: '여',
                                        bgColor:
                                            registerController.gender.value ==
                                                    'F'
                                                ? ColorStyles.gray90
                                                : ColorStyles.white,
                                        textStyle: registerController
                                                    .gender.value ==
                                                'F'
                                            ? TextStyles.pretendardN14White
                                            : TextStyles.pretendardN14Gray90,
                                        onClick: () => {
                                              registerController.gender.value =
                                                  'F'
                                            }),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 20),
                          InputCustom(
                              controller:
                                  registerController.birthDateTextController,
                              hintText: 'ex) 19990101',
                              label: '생년월일',
                              validator: ((value) =>
                                  Validation().validateBrithDate(value))),
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
                          const Text('어디서 위스키를 가장 많이 즐기시나요?',
                              style: TextStyles.pretendardB16Black),
                          const SizedBox(height: 2),
                          const Text('최대 3개까지 선택할 수 있어요.',
                              style: TextStyles.pretendardR13Gray60),
                          const SizedBox(height: 16),
                          for (int i = 0; i < whereList.length; i++)
                            Obx(
                              () => LabeledCheckbox(
                                  label: whereList[i].toString(),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  value: registerController.whereListSelected
                                      .contains(whereListEnglish[i]),
                                  onChanged: ((value) {
                                    if (!value) {
                                      registerController.whereListSelected
                                          .removeWhere((ele) =>
                                              ele == whereListEnglish[i]);
                                    } else {
                                      registerController.whereListSelected
                                          .add(whereListEnglish[i]);
                                    }
                                  })),
                            ),
                          const SizedBox(height: 20),
                          const Text('가입하시는 이유를 알고 싶어요.',
                              style: TextStyles.pretendardB16Black),
                          const SizedBox(height: 2),
                          const Text('최대 3개까지 선택할 수 있어요.',
                              style: TextStyles.pretendardR13Gray60),
                          const SizedBox(height: 16),
                          for (var item in registerReasonList)
                            Obx(
                              () => LabeledCheckbox(
                                  label: item.toString(),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  value: registerController
                                      .registerReasonListSelected
                                      .contains(item),
                                  onChanged: ((value) {
                                    if (!value) {
                                      registerController
                                          .registerReasonListSelected
                                          .removeWhere((ele) => ele == item);
                                    } else {
                                      registerController
                                          .registerReasonListSelected
                                          .add(item);
                                    }
                                  })),
                            ),
                          Obx(
                            () => registerController.registerReasonListSelected
                                    .contains('기타')
                                ? TextFormField(
                                    controller: registerController
                                        .extraReasonTextController,
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
                                  )
                                : const SizedBox(height: 0, width: 0),
                          ),
                          const SizedBox(height: 32),
                          ButtonLgFill(
                              text: '다음',
                              bgColor: disabled
                                  ? ColorStyles.gray15
                                  : ColorStyles.gray90,
                              textStyle: disabled
                                  ? TextStyles.pretendardB16Gray50
                                  : TextStyles.pretendardB16White,
                              onClick: disabled
                                  ? () => {}
                                  : () => {
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AgreeTermsBottomModal(
                                                onClick: () async {
                                                  bool result =
                                                      await registerController
                                                          .register();

                                                  if (result) {
                                                    Get.offAll(
                                                        const EmailLoginPage(),
                                                        arguments: 'register');
                                                  } else {
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                    Fluttertoast.showToast(
                                                        msg: registerController
                                                            .errorMessage.value,
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.TOP,
                                                        timeInSecForIosWeb: 2,
                                                        backgroundColor: Colors
                                                            .black
                                                            .withOpacity(0.7),
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
                                                },
                                              );
                                            })
                                      }),
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
