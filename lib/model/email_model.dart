import 'dart:convert';

EmailModel emailModelFromJson(String str) =>
    EmailModel.fromJson(json.decode(str));

String emailModelToJson(EmailModel data) => json.encode(data.toJson());

class EmailModel {
  EmailModel({
    required this.email,
  });

  String email;

  factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
