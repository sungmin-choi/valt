import 'dart:convert';

KakaoSignUpBody kakaoSignUpBodyFromJson(String str) =>
    KakaoSignUpBody.fromJson(json.decode(str));

String kakaoSignUpBodyToJson(KakaoSignUpBody data) =>
    json.encode(data.toJson());

class KakaoSignUpBody {
  KakaoSignUpBody({
    required this.platform,
    required this.privateInfoAgree,
    required this.promotionReceiveAgree,
    this.reason,
    required this.recommendType,
    required this.termsAgree,
    required this.token,
  });

  String platform;
  bool privateInfoAgree;
  bool promotionReceiveAgree;
  String? reason;
  List<String> recommendType;
  bool termsAgree;
  String token;

  factory KakaoSignUpBody.fromJson(Map<String, dynamic> json) =>
      KakaoSignUpBody(
        platform: json["platform"],
        privateInfoAgree: json["privateInfoAgree"],
        promotionReceiveAgree: json["promotionReceiveAgree"],
        reason: json["reason"],
        recommendType: List<String>.from(json["recommendType"].map((x) => x)),
        termsAgree: json["termsAgree"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "platform": platform,
        "privateInfoAgree": privateInfoAgree,
        "promotionReceiveAgree": promotionReceiveAgree,
        "reason": reason,
        "recommendType": List<dynamic>.from(recommendType.map((x) => x)),
        "termsAgree": termsAgree,
        "token": token,
      };
}
