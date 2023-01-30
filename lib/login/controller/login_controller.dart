import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:valt/login/model/login_model.dart';
import 'package:valt/service/network_handler/network_handler.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<bool> login() async {
    LoginModel loginModel = LoginModel(
        email: emailTextController.text, password: passwordTextController.text);
    var response =
        await NetWorkHandler.post(loginModelToJson(loginModel), "member/login");
    var data = json.decode(response);
    print(data);
    return false;
  }
}
