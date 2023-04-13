import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valt/model/user_data.dart';
import 'package:valt/service/network_handler/network_handler.dart';

class UserServices {
  static var client = http.Client();
  static String error401message = '세션이 끊어졌습니다. 다시 로그인 해 주세요.';
  static Uri buildUrl(String endpoint) {
    String host = "https://whiskeyshop.cf";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<bool> fetchPromotionReceive(bool value, String memberId) async {
    final msg = jsonEncode({"receive": value});
    var deviceId = await NetWorkHandler.getDeviceId();
    try {
      var response = await client
          .patch(buildUrl('/member/promotion-receive'), body: msg, headers: {
        "Content-type": "application/json",
        "DeviceId": deviceId.toString(),
        "mid": memberId.toString()
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> fetchEditPassword(String confirm, String newPassword,
      String password, String memberId) async {
    final msg = jsonEncode(
        {"confirm": confirm, "newPassword": newPassword, "password": password});
    try {
      var deviceId = await NetWorkHandler.getDeviceId();
      var response =
          await client.patch(buildUrl('/member/password'), body: msg, headers: {
        "Content-type": "application/json",
        "DeviceId": deviceId.toString(),
        "mid": memberId.toString()
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<String> fetchEditProfile(
      String memberId,
      String reason,
      int birth,
      String name,
      String platform,
      String gender,
      List<dynamic> reocommendType) async {
    final msg = jsonEncode({
      "birth": birth,
      "gender": gender,
      "name": name,
      "platform": platform,
      "reason": reason,
      "recommendType": reocommendType
    });

    try {
      var deviceId = await NetWorkHandler.getDeviceId();
      var response = await client.put(buildUrl('/member'), body: msg, headers: {
        "Content-type": "application/json",
        "DeviceId": deviceId.toString(),
        "mid": memberId.toString()
      });
      if (response.statusCode == 200) {
        // var utf8body = utf8.decode(response.bodyBytes);
        return 'true';
      }

      var utf8Body = utf8.decode(response.bodyBytes);
      // return utf8.decode(json.decode(utf8Body)['errors'][0]['message']);
      return json.decode(utf8Body)['errors'][0]['message'].toString();
    } on Exception {
      return 'false';
    }
  }

  static Future<bool> logout(String memberId) async {
    try {
      var deviceId = await NetWorkHandler.getDeviceId();
      var response = await client.post(buildUrl('/member/logout'), headers: {
        "Content-type": "application/json",
        "DeviceId": deviceId.toString(),
        "mid": memberId.toString()
      });
      if (response.statusCode == 200) {
        // var utf8body = utf8.decode(response.bodyBytes);
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  static Future<bool> withdraw(String memberId) async {
    try {
      var deviceId = await NetWorkHandler.getDeviceId();
      var response = await client.post(buildUrl('/member/withdraw'), headers: {
        "Content-type": "application/json",
        "DeviceId": deviceId.toString(),
        "mid": memberId.toString()
      });
      if (response.statusCode == 200) {
        // var utf8body = utf8.decode(response.bodyBytes);
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  static Future<UserData?> fetchUserData(String memberId) async {
    try {
      var deviceId = await NetWorkHandler.getDeviceId();
      var response = await client.get(buildUrl('/member'), headers: {
        "Content-type": "application/json",
        "DeviceId": deviceId.toString(),
        "mid": memberId.toString()
      });
      if (response.statusCode == 200) {
        var utf8body = utf8.decode(response.bodyBytes);
        return userDataFromJson(utf8body);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
