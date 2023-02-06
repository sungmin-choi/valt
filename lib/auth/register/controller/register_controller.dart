import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:valt/auth/register/model/register_model.dart';
import 'package:valt/service/network_handler/network_handler.dart';

class RegisterController extends GetxController {
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
        recommendType: ["RESTAURANT", "WHISKEY"],
        termsAgree: true);

    print(registerModelToJson(registerModel));
    var response = await NetWorkHandler.post(
        registerModelToJson(registerModel), "member/signup");
    var data = json.decode(response);
    print(data);
    if (data == '201') {
      return true;
    } else {
      return false;
    }
  }
}
