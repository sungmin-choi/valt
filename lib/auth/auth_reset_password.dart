import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:valt/auth/controller/auth_controller.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/input_password_custom.dart';

import 'login/email_login_page.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthController authController = Get.find<AuthController>();

  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();
  var disabled = true;
  final _formKey = GlobalKey<FormState>();
  void handelDisabled(bool value) {
    setState(() {
      disabled = value;
    });
  }

  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(
        msg: "인증코드가 전송되었습니다.                         전송된 코드는 10분 후에 만료됩니다.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black.withOpacity(0.9),
        textColor: Colors.white,
        fontSize: 16.0);
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
                    if (codeTextController.text.isNotEmpty &&
                        passwordTextController.text.isNotEmpty &&
                        confirmPasswordTextController.text.isNotEmpty) {
                      var valid = _formKey.currentState!.validate();
                      if (!valid) {
                        handelDisabled(true);
                      } else {
                        handelDisabled(false);
                      }
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
                                controller: codeTextController,
                                hintText: '인증 코드',
                                validator: (value) => null),
                            const SizedBox(height: 24),
                            const Text('변경할 비밀번호를 입력해 주세요',
                                style: TextStyles.pretendardB16Black),
                            const SizedBox(height: 16),
                            InputPasswordCustom(
                                controller: passwordTextController,
                                hintText: '영문, 숫자, 특수문자 조합 8-20자',
                                validator: (value) =>
                                    Validation().validatePassword(value)),
                            const SizedBox(height: 12),
                            InputPasswordCustom(
                              controller: confirmPasswordTextController,
                              hintText: '비밀번호 재입력',
                              validator: ((value) {
                                if (value != null && value.isEmpty) {
                                  return "비밀번호를 입력해 주세요";
                                } else if (value !=
                                    confirmPasswordTextController.text) {
                                  return "비밀번호가 일치하지 않습니다.";
                                }
                                return null;
                              }),
                            ),
                            const SizedBox(height: 148),
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
                                      final email = Get.arguments;
                                      bool result =
                                          await authController.resetPassword(
                                              codeTextController.text,
                                              passwordTextController.text,
                                              email);

                                      if (result) {
                                        Get.offAll(const EmailLoginPage(),
                                            arguments: 'register');
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                        Fluttertoast.showToast(
                                            msg: authController
                                                .errorMessage.value,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor:
                                                Colors.black.withOpacity(0.7),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
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
