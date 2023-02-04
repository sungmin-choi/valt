import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetWorkHandler {
  static final client = http.Client();
// Create storage
  static const storage = FlutterSecureStorage();
  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F60FE"
    });
    if (response.body.isNotEmpty) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
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
    return await storage.read(key: 'memberId');
  }
}
