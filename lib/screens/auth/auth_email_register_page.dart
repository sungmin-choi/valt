import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valt/register/controller/register_controller.dart';

import 'package:valt/screens/auth/auth_onboarding_full_page.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/input_custom.dart';
import 'package:valt/widgets/input_password_custom.dart';

class EmailRegisterPage extends StatefulWidget {
  const EmailRegisterPage({super.key});

  @override
  State<EmailRegisterPage> createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState extends State<EmailRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final RegisterController registerController = Get.put(RegisterController());
  String? email;
  String? password;
  String? confirmPassword;
  bool disabled = true;

  void handelDisabled(bool value) {
    setState(() {
      disabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SafeArea(
        child: Center(
          child: Form(
            onChanged: () {
              var valid = _formKey.currentState!.validate();
              if (!valid) {
                handelDisabled(true);
              } else {
                handelDisabled(false);
              }
            },
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 200),
                  child: Column(
                    children: [
                      InputCustom(
                          controller: registerController.emailTextController,
                          hintText: '이메일 입력',
                          label: '이메일',
                          validator: (value) =>
                              Validation().validateEmail(value)),
                      const SizedBox(height: 12),
                      InputPasswordCustom(
                          controller: registerController.passwordTextController,
                          hintText: '영문, 숫자, 특수문자 조합 8-20자',
                          label: '비밀번호',
                          validator: (value) =>
                              Validation().validatePassword(value)),
                      const SizedBox(height: 12),
                      InputPasswordCustom(
                        hintText: '비밀번호 재입력',
                        validator: ((value) {
                          if (value != null && value.isEmpty) {
                            return "비밀번호를 입력해 주세요";
                          } else if (value !=
                              registerController.passwordTextController.text) {
                            return "비밀번호가 일치하지 않습니다.";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 48),
                      ButtonLgFill(
                        text: '다음',
                        textStyle: disabled
                            ? TextStyles.pretendardB16Gray50
                            : TextStyles.pretendardB16White,
                        bgColor:
                            disabled ? ColorStyles.gray15 : ColorStyles.gray90,
                        onClick: disabled
                            ? () => {}
                            : () async {
                                // showToast();
                                bool result =
                                    await registerController.checkValidEmail();
                                if (result) {
                                  Get.to(() => const OnboardingFullPage());
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "이미 존재하는 이메일입니다.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor:
                                          Colors.black.withOpacity(0.7),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                      ),
                    ],
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
