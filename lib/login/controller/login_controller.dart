import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<bool> login() async {
    await Future.delayed(const Duration(seconds: 1));
    if (emailTextController.text == 'namja306@naver.com' &&
        passwordTextController.text == 'test1234!') {
      return true;
    } else {
      return false;
    }
    // LoginModel loginModel = LoginModel(
    //     email: emailTextController.text, password: passwordTextController.text);
    // var response =
    //     await NetWorkHandler.post(loginModelToJson(loginModel), "login");
    // var data = json.decode(response);
  }
}
