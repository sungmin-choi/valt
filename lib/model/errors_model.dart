import 'dart:convert';

ErrorsModel errorsModelFromJson(String str) =>
    ErrorsModel.fromJson(json.decode(str));

String errorsModelToJson(ErrorsModel data) => json.encode(data.toJson());

class ErrorsModel {
  ErrorsModel({
    required this.errors,
  });

  List<Error> errors;

  factory ErrorsModel.fromJson(Map<String, dynamic> json) => ErrorsModel(
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Error {
  Error({
    required this.message,
  });

  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
