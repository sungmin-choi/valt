import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) =>
    ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) =>
    json.encode(data.toJson());

class ResetPasswordModel {
  ResetPasswordModel({
    required this.code,
    required this.confirm,
    required this.email,
    required this.password,
  });

  String code;
  String confirm;
  String email;
  String password;

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        code: json["code"],
        confirm: json["confirm"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "confirm": confirm,
        "email": email,
        "password": password,
      };
}
