import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:valt/auth/auth_reset_password.dart';
import 'package:valt/controller/email_controller.dart';
import 'package:get/get.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/input_custom.dart';

class AuthenticationCodePage extends StatefulWidget {
  const AuthenticationCodePage({super.key});

  @override
  State<AuthenticationCodePage> createState() => _AuthenticationCodePageState();
}

class _AuthenticationCodePageState extends State<AuthenticationCodePage> {
  var emailController = Get.put(EmailController());
  var disabled = true;
  var isLoading = false;
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
        title: const Text('비밀번호 찾기', style: TextStyles.pretendardB17Gray100),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          InputCustom(
                              controller: emailController.emailTextController,
                              hintText: '이메일 입력',
                              label: '이메일',
                              validator: (value) =>
                                  Validation().validateEmail(value)),
                          const SizedBox(height: 12),
                          const Text('입력한 이메일로 인증 코드가 발송됩니다.',
                              style: TextStyles.pretendardN13Gray70),
                          const SizedBox(height: 48),
                          ButtonLgFill(
                              text: isLoading ? '인증 코드 전송중...' : '인증 코드 전송',
                              textStyle: disabled
                                  ? TextStyles.pretendardB16Gray50
                                  : TextStyles.pretendardB16White,
                              bgColor: disabled
                                  ? ColorStyles.gray15
                                  : ColorStyles.gray90,
                              onClick: disabled && !isLoading
                                  ? () => {}
                                  : () async {
                                      bool result = await emailController
                                          .checkValidEmail();
                                      print(result);
                                      if (!result) {
                                        Get.to(() => const ResetPassword());
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "가입되어 있지 않은 이메일 입니다.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor:
                                                Colors.black.withOpacity(0.7),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    })
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const Text(
                    '가입한 이메일이 기억이 안 난다면 고객센터로 문의하세요',
                    style: TextStyles.pretendardR13Gray60,
                  ),
                  TextButton(
                    onPressed: () => {Get.to(const AuthenticationCodePage())},
                    child: const Text(
                      '고객센처 문의하기',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
