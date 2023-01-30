import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:valt/model/email_model.dart';
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

  Future<bool> register() async {
    await Future.delayed(const Duration(seconds: 1));
    // RegisterModel registerModel = RegisterModel(
    //     email: emailTextController.text,
    //     password: passwordTextController.text,
    //     username: usernameTextController.text,
    //     birthDate: birthDateTextController.text,
    //     gender: gender.value,
    //     whereListSelected: whereListSelected,
    //     registerReasonListSelected: registerReasonListSelected,
    //     agreeList: agreeList,
    //     extraReason: extraReasonTextController.text.isNotEmpty
    //         ? extraReasonTextController.text
    //         : '');

    // var response =
    //     await NetWorkHandler.post(registerModelToJson(registerModel), "sign");
    // var data = json.decode(response);
    /*
        response = {"token": dsadsadasdsasad, "message":"register Successful"}
       */
    // await NetWorkHandler.storeToken(data["token"]);
    return true;
  }
}
