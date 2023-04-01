import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valt/service/network_handler/user_service.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/widgets/button_lg_fill.dart';
import 'package:valt/widgets/input_password_custom.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({super.key});

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  bool disabled = true;
  void handelDisabled(bool value) {
    setState(() {
      disabled = value;
    });
  }

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
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
        title: const Text('비밀번호 변경', style: TextStyles.pretendardB17Gray100),
      ),
      body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: Form(
              key: _formKey,
              onChanged: () {
                if (confirmPassword.text.isNotEmpty &&
                    newPassword.text.isNotEmpty &&
                    currentPassword.text.isNotEmpty) {
                  print('ddd');
                  var valid = _formKey.currentState!.validate();
                  if (!valid) {
                    handelDisabled(true);
                  } else {
                    handelDisabled(false);
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 200),
                child: Column(
                  children: [
                    InputPasswordCustom(
                        controller: currentPassword,
                        hintText: '비밀번호 입력',
                        label: '현재 비밀번호',
                        validator: (value) =>
                            Validation().validatePassword(value)),
                    const SizedBox(height: 20),
                    InputPasswordCustom(
                        controller: newPassword,
                        hintText: '영문, 숫자, 특수문자 조합 8-20자',
                        label: '새 비밀번호',
                        validator: (value) =>
                            Validation().validatePassword(value)),
                    const SizedBox(height: 20),
                    InputPasswordCustom(
                        controller: confirmPassword,
                        hintText: '비밀번호 재입력',
                        validator: ((value) {
                          if (value != null && value.isEmpty) {
                            return "비밀번호를 입력해 주세요";
                          } else if (value != newPassword.text) {
                            return "비밀번호가 일치하지 않습니다.";
                          }
                          return null;
                        })),
                    const SizedBox(height: 48),
                    ButtonLgFill(
                      text: '변경',
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
                                  await UserServices.fetchEditPassword(
                                      confirmPassword.text,
                                      newPassword.text,
                                      currentPassword.text,
                                      Get.arguments['memberId']);
                              if (result) {
                                Fluttertoast.showToast(
                                    msg: "비밀번호를 변경하였습니다.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor:
                                        Colors.black.withOpacity(0.7),
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Get.back();
                              } else {
                                Fluttertoast.showToast(
                                    msg: "비밀번호가 일치하지 않습니다.",
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
              ),
            ),
          )),
    );
  }
}
