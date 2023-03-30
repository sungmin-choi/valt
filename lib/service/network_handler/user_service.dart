import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valt/model/user_data.dart';

class UserServices {
  static var client = http.Client();

  static Uri buildUrl(String endpoint) {
    String host = "https://whiskeyshop.cf";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<bool> fetchPromotionReceive(bool value, String memberId) async {
    final msg = jsonEncode({"receive": value});
    try {
      var response = await client
          .patch(buildUrl('/member/promotion-receive'), body: msg, headers: {
        "Content-type": "application/json",
        "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE",
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

  static Future<bool> logout(String memberId) async {
    try {
      var response = await client.post(buildUrl('/member/logout'), headers: {
        "Content-type": "application/json",
        "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE",
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
      var response = await client.get(buildUrl('/member'), headers: {
        "Content-type": "application/json",
        "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE",
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
