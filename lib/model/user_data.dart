// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.email,
    required this.name,
    required this.gender,
    required this.birth,
    required this.socialJoinType,
    required this.isPromotionReceiveAgree,
    required this.promotionReceiveDate,
    this.joinReason,
    required this.recommendType,
  });

  String email;
  String name;
  String gender;
  int birth;
  String socialJoinType;
  bool isPromotionReceiveAgree;
  DateTime promotionReceiveDate;
  String? joinReason;
  List<String> recommendType;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        email: json["email"],
        name: json["name"],
        gender: json["gender"],
        birth: json["birth"],
        socialJoinType: json["socialJoinType"],
        isPromotionReceiveAgree: json["isPromotionReceiveAgree"],
        promotionReceiveDate: DateTime.parse(json["promotionReceiveDate"]),
        joinReason: json["joinReason"],
        recommendType: List<String>.from(json["recommendType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "gender": gender,
        "birth": birth,
        "socialJoinType": socialJoinType,
        "isPromotionReceiveAgree": isPromotionReceiveAgree,
        "promotionReceiveDate":
            "${promotionReceiveDate.year.toString().padLeft(4, '0')}-${promotionReceiveDate.month.toString().padLeft(2, '0')}-${promotionReceiveDate.day.toString().padLeft(2, '0')}",
        "joinReason": joinReason,
        "recommendType": List<dynamic>.from(recommendType.map((x) => x)),
      };
}
