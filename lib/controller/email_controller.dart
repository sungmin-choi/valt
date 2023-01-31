import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:valt/model/email_model.dart';
import 'package:valt/service/network_handler/network_handler.dart';

class EmailController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  Future<bool> checkValidEmail() async {
    // await Future.delayed(const Duration(seconds: 1));
    // if (emailTextController.text == 'namja306@naver.com') {
    //   return false;
    // }
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
