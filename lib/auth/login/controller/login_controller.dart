import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:valt/auth/login/model/login_model.dart';
import 'package:valt/service/network_handler/network_handler.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();
  Future<bool> login() async {
    LoginModel loginModel = LoginModel(
        email: emailTextController.text, password: passwordTextController.text);
    var response =
        await NetWorkHandler.post(loginModelToJson(loginModel), "member/login");

    var data = json.decode(response);
    if (data['statusCode'] == 200) {
      var a = json.decode(data['body']);
      var memberId = a['memberId'];

      await NetWorkHandler.storeMemberId(memberId.toString());
      emailTextController.clear();
      passwordTextController.clear();
      return true;
    }

    return false;
  }
}
