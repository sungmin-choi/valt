import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
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
                            _formKey.currentState?.validate();
                          },
                          validator: (value) =>
                              Validation().validateEmail(value)),
                      const SizedBox(height: 12),
                      InputPasswordCustom(
                          hintText: '비밀번호 입력',
                          onChanged: ((value) {
                            password = value;
                          }),
                          validator: (value) => null),
                      TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.black),
                        child: const Text('Submit'),
                        onPressed: () {
                          // Validate the form by getting the FormState from the GlobalKey
                          // and calling validate() on it.
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
