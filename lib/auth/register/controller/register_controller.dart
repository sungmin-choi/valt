import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:valt/auth/register/model/register_model.dart';
import 'package:valt/service/network_handler/network_handler.dart';

class RegisterController extends GetxController {
  RxString errorMessage = ''.obs;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController birthDateTextController = TextEditingController();
  TextEditingController extraReasonTextController = TextEditingController();
  RxString gender = "".obs;
  RxList whereListSelected = [].obs;
  RxList registerReasonListSelected = [].obs;
  RxList agreeList = [].obs;

  Future<bool> register() async {
    RegisterModel registerModel = RegisterModel(
        birth: int.parse(birthDateTextController.text),
        confirm: passwordTextController.text,
        email: emailTextController.text,
        gender: gender.value,
        name: usernameTextController.text,
        password: passwordTextController.text,
        privateInfoAgree: true,
        promotionReceiveAgree: agreeList.contains(3),
        reason: extraReasonTextController.text,
        recommendType: ['RESTAURANT', 'WHISKEY', 'PARTY', 'HOME', 'GIFT'],
        termsAgree: true);

    var response = await NetWorkHandler.post(
        registerModelToJson(registerModel), "member/signup");
    var data = json.decode(response);

    if (data['statusCode'] == 201) {
      return true;
    }

    errorMessage.value = NetWorkHandler.returnErrorMessage(data['body']);

    return false;
  }
}
