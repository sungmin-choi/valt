// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.itemsId,
    required this.name,
    required this.englishName,
    required this.price,
    required this.size,
    required this.strength,
    required this.country,
    required this.categoryName,
    required this.linkUrl,
  });

  int itemsId;
  String name;
  String englishName;
  int price;
  int size;
  int strength;
  String country;
  String categoryName;
  String linkUrl;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        itemsId: json["itemsId"],
        name: json["name"],
        englishName: json["englishName"],
        price: json["price"],
        size: json["size"],
        strength: json["strength"],
        country: json["country"],
        categoryName: json["categoryName"],
        linkUrl: json["linkUrl"],
      );

  Map<String, dynamic> toJson() => {
        "itemsId": itemsId,
        "name": name,
        "englishName": englishName,
        "price": price,
        "size": size,
        "strength": strength,
        "country": countryValues.reverse[country],
        "categoryName": categoryName,
        "linkUrl": linkUrl,
      };
}

enum Country { EMPTY, COUNTRY, PURPLE }

final countryValues = EnumValues(
    {"일본": Country.COUNTRY, "스코틀랜드": Country.EMPTY, "미국": Country.PURPLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
