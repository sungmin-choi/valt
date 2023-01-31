import 'package:flutter/material.dart';
import 'package:valt/auth/login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/input_password_custom.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var loginController = Get.find<LoginController>();
  var disabled = true;
  final _formKey = GlobalKey<FormState>();
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
        title: const Text('비밀번호 재설정', style: TextStyles.pretendardB17Gray100),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
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
                        padding: const EdgeInsets.fromLTRB(16, 27, 16, 362),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('전송 받은 인증 코드를 입력해 주세요',
                                style: TextStyles.pretendardB16Black),
                            const SizedBox(height: 16),
                            InputPasswordCustom(
                                controller: loginController.codeTextController,
                                hintText: '인증 코드',
                                validator: (value) => null),
                            const SizedBox(height: 24),
                            const Text('변경할 비밀번호를 입력해 주세요',
                                style: TextStyles.pretendardB16Black),
                            const SizedBox(height: 16),
                            InputPasswordCustom(
                                controller:
                                    loginController.passwordTextController,
                                hintText: '영문, 숫자, 특수문자 조합 8-20자',
                                validator: (value) =>
                                    Validation().validatePassword(value)),
                            const SizedBox(height: 12),
                            InputPasswordCustom(
                              hintText: '비밀번호 재입력',
                              validator: ((value) {
                                if (value != null && value.isEmpty) {
                                  return "비밀번호를 입력해 주세요";
                                } else if (value !=
                                    loginController
                                        .passwordTextController.text) {
                                  return "비밀번호가 일치하지 않습니다.";
                                }
                                return null;
                              }),
                            ),
                            const SizedBox(height: 14),
                            ButtonLgFill(
                              text: '로그인',
                              textStyle: disabled
                                  ? TextStyles.pretendardB16Gray50
                                  : TextStyles.pretendardB16White,
                              bgColor: disabled
                                  ? ColorStyles.gray15
                                  : ColorStyles.gray90,
                              onClick: disabled
                                  ? () => {}
                                  : () async {
                                      // showToast();
                                    },
                            ),
                          ],
                        ),
                      )
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
