import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:valt/auth/login/model/login_model.dart';
import 'package:valt/model/email_model.dart';
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
    if (data['errors'] != null) {
      return false;
    }
    var memberId = data['memberId'];
    await NetWorkHandler.storeMemberId(memberId.toString());
    return true;
  }

  Future<bool> checkValidEmail() async {
    EmailModel email = EmailModel(email: emailTextController.text);
    try {
      var response = await NetWorkHandler.post(
          emailModelToJson(email), "member/check-email-duplication");
      var data = json.decode(response);
      if (data['result'] == true) {
        return false;
      } else if (data['result'] == false) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
