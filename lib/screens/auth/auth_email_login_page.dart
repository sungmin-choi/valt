import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  var disabled = true;

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
        title: const Text('이메일로 로그인', style: TextStyles.pretendardB17Gray100),
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
                  padding: const EdgeInsets.fromLTRB(16, 27, 16, 362),
                  child: Column(
                    children: [
                      InputCustom(
                          hintText: '이메일 입력',
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) =>
                              Validation().validateEmail(value)),
                      const SizedBox(height: 12),
                      InputPasswordCustom(
                        hintText: '비밀번호 입력',
                        onChanged: ((value) {
                          password = value;
                        }),
                        validator: ((value) {
                          if (value != null && value.isEmpty) {
                            return "비밀번호를 입력해 주세요";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 48),
                      // TextButton(
                      //     onPressed: () => {
                      //           Fluttertoast.showToast(
                      //               msg: "이메일 또는 비밀번호를 확인해 주세요",
                      //               toastLength: Toast.LENGTH_SHORT,
                      //               gravity: ToastGravity.TOP,
                      //               timeInSecForIosWeb: 2,
                      //               backgroundColor:
                      //                   Colors.black.withOpacity(0.7),
                      //               textColor: Colors.white,
                      //               fontSize: 16.0)
                      //         },
                      //     child: const Text('Click')),
                      ButtonLgFill(
                        text: '로그인',
                        textStyle: disabled
                            ? TextStyles.pretendardB16Gray50
                            : TextStyles.pretendardB16White,
                        bgColor:
                            disabled ? ColorStyles.gray15 : ColorStyles.gray90,
                        onClick: disabled
                            ? () => {}
                            : () {
                                // showToast();

                                var valid = _formKey.currentState!.validate();
                                if (!valid) {
                                  return;
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
