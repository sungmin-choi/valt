import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valt/model/product_detail_model.dart';
import 'package:valt/model/products.dart';

import 'network_handler.dart';

class ProductServices {
  static var client = http.Client();

  static Uri buildUrl(String endpoint) {
    String host = "https://whiskeyshop.cf";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<Products?> fetchProducts(String? params) async {09
    var memberId = await NetWorkHandler.getMemberId();
    var deviceId = await NetWorkHandler.getDeviceId();
    var response =
        await client.get(buildUrl('/items${params ?? params}'), headers: {
      "Content-type": "application/json",
      "DeviceId": deviceId.toString(),
      "mid": memberId.toString()
    });

    if (response.statusCode == 200) {
      var jasonData = utf8.decode(response.bodyBytes);
      var products = productsFromJson(jasonData);
      return products;
    } else if (response.statusCode == 401) {
      print('401');
      return null;
    } else {
      return null;
    }
  }

  static Future<bool> likeProduct(int itemsId) async {
    var memberId = await NetWorkHandler.getMemberId();
    var deviceId = await NetWorkHandler.getDeviceId();
    var response =
        await client.post(buildUrl('/items/$itemsId/like'), headers: {
      "Content-type": "application/json",
      "DeviceId": deviceId.toString(),
      "mid": memberId.toString()
    });

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> unlikeProduct(int itemsId) async {
    var memberId = await NetWorkHandler.getMemberId();
    var deviceId = await NetWorkHandler.getDeviceId();
    var response =
        await client.delete(buildUrl('/items/$itemsId/like'), headers: {
      "Content-type": "application/json",
      "DeviceId": deviceId.toString(),
      "mid": memberId.toString()
    });

    if (response.statusCode == 200) {
      return true;
    }
    // var jasonData = utf8.decode(response.bodyBytes);
    // print(jasonData);
    return false;
  }

  static Future<ProductDetail?> fetchProductDetail(int itemsId) async {
    var memberId = await NetWorkHandler.getMemberId();
    var deviceId = await NetWorkHandler.getDeviceId();
    var response = await client.get(buildUrl('/item/$itemsId'), headers: {
      "Content-type": "application/json",
      "DeviceId": deviceId.toString(),
      "mid": memberId.toString()
    });
    var viewCnt = await client.post(buildUrl('/item/$itemsId'), headers: {
      "Content-type": "application/json",
      "DeviceId": deviceId.toString()
    });

    if (response.statusCode == 200 && viewCnt.statusCode == 200) {
      var jasonData = utf8.decode(response.bodyBytes);
      return productDetailFromJson(jasonData);
    } else {
      return null;
    }
  }
}
