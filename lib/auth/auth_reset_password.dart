import 'package:flutter/material.dart';
import 'package:valt/controller/email_controller.dart';
import 'package:get/get.dart';
import 'package:valt/styles/text_style.dart';
import 'package:valt/utils/validation.dart';
import 'package:valt/widgets/input_custom.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var emailController = Get.put(EmailController());
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
                        children: [
                          InputCustom(
                              controller: emailController.emailTextController,
                              hintText: '이메일 입력',
                              label: '이메일',
                              validator: (value) =>
                                  Validation().validateEmail(value)),
                          const SizedBox(height: 12),
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
    );
  }
}
