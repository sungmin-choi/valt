import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:valt/model/email_model.dart';
import 'package:valt/service/network_handler/network_handler.dart';

class AuthController extends GetxController {
  RxString errorMessage = ''.obs;

  Future<bool> sendAuthenticationCode(String email) async {
    EmailModel emailModel = EmailModel(email: email);

    var response =
        await NetWorkHandler.put(emailModelToJson(emailModel), "reset-pw");

    var data = json.decode(response);

    if (data['statusCode'] == 200) {
      return true;
    }
    errorMessage.value = NetWorkHandler.returnErrorMessage(data['body']);

    return false;
  }

  Future<bool> checkValidEmail(String email) async {
    // await Future.delayed(const Duration(seconds: 1));
    // if (emailTextController.text == 'namja306@naver.com') {
    //   return false;
    // }
    EmailModel emailModel = EmailModel(email: email);

    var response = await NetWorkHandler.post(
        emailModelToJson(emailModel), "member/check-email-duplication");

    var data = json.decode(response);
    if (data['statusCode'] == 200) {
      if (json.decode(data['body'])['result'] == false) {
        return true;
      } else {
        return false;
      }
    }
    errorMessage.value = NetWorkHandler.returnErrorMessage(data['body']);
    return false;
  }
}
