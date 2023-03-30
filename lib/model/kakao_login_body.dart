// To parse this JSON data, do
//
//     final kakaoLoginBody = kakaoLoginBodyFromJson(jsonString);

import 'dart:convert';

KakaoLoginBody kakaoLoginBodyFromJson(String str) =>
    KakaoLoginBody.fromJson(json.decode(str));

String kakaoLoginBodyToJson(KakaoLoginBody data) => json.encode(data.toJson());

class KakaoLoginBody {
  KakaoLoginBody({
    required this.email,
    required this.token,
    required this.platform,
  });

  String email;
  String token;
  String platform;

  factory KakaoLoginBody.fromJson(Map<String, dynamic> json) => KakaoLoginBody(
        email: json["email"],
        token: json["token"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
        "platform": platform,
      };
}
