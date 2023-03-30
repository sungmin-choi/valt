import 'dart:convert';

KakaoDuplicationCheckBody kakaoDuplicationCheckBodyFromJson(String str) =>
    KakaoDuplicationCheckBody.fromJson(json.decode(str));

String kakaoDuplicationCheckBodyToJson(KakaoDuplicationCheckBody data) =>
    json.encode(data.toJson());

class KakaoDuplicationCheckBody {
  KakaoDuplicationCheckBody({
    required this.platform,
    required this.token,
  });

  String platform;
  String token;

  factory KakaoDuplicationCheckBody.fromJson(Map<String, dynamic> json) =>
      KakaoDuplicationCheckBody(
        platform: json["platform"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "platform": platform,
        "token": token,
      };
}
