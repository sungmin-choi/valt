import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valt/auth/auth_authentication_code.dart';
import 'package:valt/auth/login/controller/login_controller.dart';
import 'package:valt/main.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/input_custom.dart';
import 'package:valt/widgets/input_password_custom.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  var loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();
  var disabled = true;
  var isLoading = false;

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
            var value = Get.arguments;
            if (value == 'register') {
              Get.offAll(() => const MyApp());
            }
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: const Text('이메일로 로그인', style: TextStyles.pretendardB17Gray100),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                onChanged: () {
                  if (loginController.emailTextController.text.isNotEmpty &&
                      loginController.passwordTextController.text.isNotEmpty) {
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
                        children: [
                          InputCustom(
                              controller: loginController.emailTextController,
                              hintText: '이메일 입력',
                              validator: (value) =>
                                  Validation().validateEmail(value)),
                          const SizedBox(height: 12),
                          InputPasswordCustom(
                            controller: loginController.passwordTextController,
                            hintText: '비밀번호 입력',
                            validator: ((value) {
                              if (value != null && value.isEmpty) {
                                return "비밀번호를 입력해 주세요";
                              }
                              return null;
                            }),
                          ),
                          const SizedBox(height: 48),
                          ButtonLgFill(
                            text: isLoading ? '로그인중..' : '로그인',
                            textStyle: disabled
                                ? TextStyles.pretendardB16Gray50
                                : TextStyles.pretendardB16White,
                            bgColor: disabled
                                ? ColorStyles.gray15
                                : ColorStyles.gray90,
                            onClick: disabled && !isLoading
                                ? () => {}
                                : () async {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    bool response =
                                        await loginController.login();

                                    setState(() {
                                      isLoading = false;
                                    });

                                    if (response) {
                                      Get.to(const MyApp());
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "이메일 또는 비밀번호를 확인해 주세요",
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
              Column(
                children: [
                  const Text(
                    '비밀번호가 기억이 안 나시나요?',
                    style: TextStyles.pretendardR13Gray60,
                  ),
                  TextButton(
                    onPressed: () => {Get.to(const AuthenticationCodePage())},
                    child: const Text(
                      '비밀번호 재설정',
                      style: TextStyle(
                        color: ColorStyles.gray60,
                        fontFamily: 'Pretendard',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
