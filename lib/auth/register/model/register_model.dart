// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.birth,
    required this.confirm,
    required this.email,
    required this.gender,
    required this.name,
    required this.password,
    required this.privateInfoAgree,
    required this.promotionReceiveAgree,
    required this.reason,
    required this.recommendType,
    required this.termsAgree,
  });

  int birth;
  String confirm;
  String email;
  String gender;
  String name;
  String password;
  bool privateInfoAgree;
  bool promotionReceiveAgree;
  String reason;
  List<String> recommendType;
  bool termsAgree;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        birth: json["birth"],
        confirm: json["confirm"],
        email: json["email"],
        gender: json["gender"],
        name: json["name"],
        password: json["password"],
        privateInfoAgree: json["privateInfoAgree"],
        promotionReceiveAgree: json["promotionReceiveAgree"],
        reason: json["reason"],
        recommendType: List<String>.from(json["recommendType"].map((x) => x)),
        termsAgree: json["termsAgree"],
      );

  Map<String, dynamic> toJson() => {
        "birth": birth,
        "confirm": confirm,
        "email": email,
        "gender": gender,
        "name": name,
        "password": password,
        "privateInfoAgree": privateInfoAgree,
        "promotionReceiveAgree": promotionReceiveAgree,
        "reason": reason,
        "recommendType": List<dynamic>.from(recommendType.map((x) => x)),
        "termsAgree": termsAgree,
      };
}
