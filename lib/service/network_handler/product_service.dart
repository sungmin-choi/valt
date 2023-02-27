import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valt/model/product.dart';
import 'package:valt/model/product_detail_model.dart';

import 'network_handler.dart';

class ProductServices {
  static var client = http.Client();

  static Uri buildUrl(String endpoint) {
    String host = "https://whiskeyshop.cf";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<List<Product>?> fetchProducts(String? params) async {
    var memberId = await NetWorkHandler.getMemberId();
    print(memberId);
    var response =
        await client.get(buildUrl('/items${params ?? params}'), headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE",
      "mid": memberId.toString()
    });

    if (response.statusCode == 200) {
      var jasonData = utf8.decode(response.bodyBytes);

      return productFromJson(jasonData);
    } else {
      return null;
    }
  }

  static Future<bool> likeProduct(int itemsId) async {
    var memberId = await NetWorkHandler.getMemberId();

    var response =
        await client.post(buildUrl('/items/$itemsId/like'), headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE",
      "mid": memberId.toString()
    });

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> unlikeProduct(int itemsId) async {
    var memberId = await NetWorkHandler.getMemberId();
    print(memberId);
    var response =
        await client.delete(buildUrl('/items/$itemsId/like'), headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE",
      "mid": memberId.toString()
    });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<ProductDetail?> fetchProductDetail(int itemsId) async {
    var memberId = await NetWorkHandler.getMemberId();
    print(memberId);
    var response = await client.get(buildUrl('/item/$itemsId'), headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE",
      "mid": memberId.toString()
    });
    var viewCnt = await client.post(buildUrl('/item/$itemsId'), headers: {
      "Content-type": "application/json",
      "DeviceId": "365C96E6-B22A-41FA-B569-BAF68E5F61FE"
    });

    if (response.statusCode == 200 && viewCnt.statusCode == 200) {
      var jasonData = utf8.decode(response.bodyBytes);
      print(jasonData);
      return productDetailFromJson(jasonData);
    } else {
      return null;
    }
  }
}
