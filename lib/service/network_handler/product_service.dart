import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valt/model/product.dart';

class ProductServices {
  static var client = http.Client();

  static Uri buildUrl(String endpoint) {
    String host = "https://whiskeyshop.cf";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(buildUrl('/items?option=BEST'), headers: {
      "Content-type": "application/json",
    });

    if (response.statusCode == 200) {
      var jasonData = utf8.decode(response.bodyBytes);

      return productFromJson(jasonData);
    } else {
      return null;
    }
  }

  static Future<Product?> fetchProductDetail(int itemsId) async {
    var response = await client.get(buildUrl('/item/$itemsId'), headers: {
      "Content-type": "application/json",
    });
    if (response.statusCode == 200) {
      var jasonData = utf8.decode(response.bodyBytes);
      print(jasonData);
      return productDetailFromJson(jasonData);
    } else {
      return null;
    }
  }
}
