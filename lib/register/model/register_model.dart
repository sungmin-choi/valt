import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.email,
    required this.password,
    required this.username,
    required this.birthDate,
    required this.gender,
    required this.whereListSelected,
    required this.registerReasonListSelected,
    required this.agreeList,
    required this.extraReason,
  });

  String email;
  String password;
  String username;
  String birthDate;
  String gender;
  List whereListSelected;
  List registerReasonListSelected;
  List agreeList;
  String extraReason;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json["email"],
        password: json["password"],
        username: json["username"],
        birthDate: json["birthDate"],
        gender: json["gender"],
        whereListSelected:
            List<String>.from(json["whereListSelected"].map((x) => x)),
        registerReasonListSelected:
            List<String>.from(json["registerReasonListSelected"].map((x) => x)),
        agreeList: List<int>.from(json["agreeList"].map((x) => x)),
        extraReason: json["extraReason"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "username": username,
        "birthDate": birthDate,
        "gender": gender,
        "whereListSelected":
            List<dynamic>.from(whereListSelected.map((x) => x)),
        "registerReasonListSelected":
            List<dynamic>.from(registerReasonListSelected.map((x) => x)),
        "agreeList": List<dynamic>.from(agreeList.map((x) => x)),
        "extraReason": extraReason,
      };
}
