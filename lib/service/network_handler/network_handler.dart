import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:valt/model/errors_model.dart';

class NetWorkHandler {
  static final client = http.Client();
// Create storage
  static const storage = FlutterSecureStorage();

  static String returnErrorMessage(String body) {
    var errorBody = errorsModelFromJson(body);
    var errorBodyJson = errorsModelToJson(errorBody);
    var errorsArr = json.decode(errorBodyJson);
    return errorsArr['errors'][0]['message'];
  }

  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE"
    });

    var utf8body = utf8.decode(response.bodyBytes);

    return responseTypeToJson(
        ResponseType(body: utf8body, statusCode: response.statusCode));
  }

  static Future<String> get(String endpoint) async {
    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE"
    });

    var utf8body = utf8.decode(response.bodyBytes);

    return responseTypeToJson(
        ResponseType(body: utf8body, statusCode: response.statusCode));
  }

  static Future<String> put(var body, String endpoint) async {
    var response = await client.put(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE"
    });

    var utf8body = utf8.decode(response.bodyBytes);
    return responseTypeToJson(
        ResponseType(body: utf8body, statusCode: response.statusCode));
  }

  static Uri buildUrl(String endpoint) {
    String host = "https://whiskeyshop.cf/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken(String token) async {
    return await storage.read(key: 'token');
  }

  static Future<void> storeMemberId(String token) async {
    await storage.write(key: 'memberId', value: token);
  }

  static Future<String?> getMemberId() async {
    var memberId = await storage.read(key: 'memberId');
    return memberId;
  }

  static Future<void> storeRecentSearchs(String keyword) async {
    // await storage.write(key: 'RecentSearchs', value: keyword);

    var keywords = await storage.read(key: 'RecentSearchs');

    if (keywords == null) {
      List<String> keyWordsList = [keyword];
      await storage.write(
          key: 'RecentSearchs', value: jsonEncode(keyWordsList));
    }
    List<dynamic> listOfkeywords = jsonDecode(keywords!);
    if (listOfkeywords.length > 10) {
      listOfkeywords.removeAt(0);
    }
    listOfkeywords.add(keyword);

    await storage.write(
        key: 'RecentSearchs', value: jsonEncode(listOfkeywords));

    // await storage.write(key: 'RecentSearchs', value: keyword);
  }

  static Future<List<dynamic>?> getRecentSearchs() async {
    var keywords = await storage.read(key: 'RecentSearchs');
    return jsonDecode(keywords!);
  }

  static Future<void> deleteRecentSearchs() async {
    return await storage.delete(key: 'RecentSearchs');
  }

  static Future<void> deleteMemberId() async {
    return await storage.delete(key: 'memberId');
  }
}

ResponseType responseTypeFromJson(String str) =>
    ResponseType.fromJson(json.decode(str));

String responseTypeToJson(ResponseType data) => json.encode(data.toJson());

class ResponseType {
  ResponseType({
    required this.body,
    required this.statusCode,
  });

  String body;
  int statusCode;

  factory ResponseType.fromJson(Map<String, dynamic> json) => ResponseType(
        body: json["body"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "statusCode": statusCode,
      };
}
