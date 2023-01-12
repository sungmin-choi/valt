import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';

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
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        validator: Validation().validateEmail,
                        decoration: InputDecoration(
                          hintText: '이메일 입력',
                          hintStyle: const TextStyle(color: ColorStyles.gray40),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: ColorStyles.gray30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: const BorderSide(
                                width: 1, color: ColorStyles.gray100),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: ColorStyles.red10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: '비밀번호 입력'),
                      ),
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

                          showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Your story'),
                              content:
                                  Text('The $email developer saw a $password'),
                              actions: [
                                TextButton(
                                  child: const Text('Done'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
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
