import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:valt/model/email_model.dart';
import 'package:valt/service/network_handler/network_handler.dart';

class AuthController extends GetxController {
  Future<bool> checkValidEmail(String email) async {
    // await Future.delayed(const Duration(seconds: 1));
    // if (emailTextController.text == 'namja306@naver.com') {
    //   return false;
    // }
    EmailModel emailModel = EmailModel(email: email);
    try {
      var response = await NetWorkHandler.post(
          emailModelToJson(emailModel), "member/check-email-duplication");
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
