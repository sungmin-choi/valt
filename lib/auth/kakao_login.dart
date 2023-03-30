import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:valt/auth/register/auth_onboarding_full_page.dart';
import 'package:valt/model/kakao_duplication_check_body.dart';
import 'package:valt/model/kakao_login_body.dart';
import 'package:valt/screens/home.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:get/get.dart';

class KakaoLogin {
  Future<void> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
          var result = await checkDuplication('KAKAO', token.accessToken);
          if (result is bool) {
            if (result == false) {
              Get.to(() => const OnboardingFullPage());
            }
          }
          // return true;
        } catch (e) {
          // return false;
        }
      } else {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          var result = await checkDuplication('KAKAO', token.accessToken);
          print('result:$result');
          if (result is bool) {
            if (result == false) {
              Get.to(() => const OnboardingFullPage());
            } else {
              User? kakaoUser;
              kakaoUser = await UserApi.instance.me();
              var isLogin = await blatLogin(
                  kakaoUser.kakaoAccount!.email.toString(), token.accessToken);

              print('isLogin:$isLogin');
              if (isLogin) {
                Get.to(() => Home());
              } else {
                Fluttertoast.showToast(
                    msg: "로그인 실패.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.black.withOpacity(0.9),
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          }
          // await UserApi.instance.loginWithKakaoAccount();

        } catch (e) {
          // return false;
        }
      }
    } catch (e) {
      // return false;
    }
  }

  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> blatLogin(String email, String token) async {
    KakaoLoginBody loginBody =
        KakaoLoginBody(email: email, token: token, platform: 'KAKAO');

    var response = await NetWorkHandler.post(
        kakaoLoginBodyToJson(loginBody), "member/social-login");

    var data = json.decode(response);
    if (data['statusCode'] == 200) {
      var a = json.decode(data['body']);
      var memberId = a['memberId'];

      await NetWorkHandler.storeMemberId(memberId.toString());

      return true;
    }

    return false;
  }

  Future<dynamic> checkDuplication(String platform, String token) async {
    KakaoDuplicationCheckBody body =
        KakaoDuplicationCheckBody(platform: platform, token: token);
    try {
      var response = await NetWorkHandler.post(
          kakaoDuplicationCheckBodyToJson(body),
          "member/social-signup-duplication");
      var data = json.decode(response);

      if (data['statusCode'] == 200) {
        if (json.decode(data['body'])['result'] == false) {
          return true;
        } else {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
