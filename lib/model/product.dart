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
    required this.rating,
    required this.ratingCount,
    required this.linkUrl,
    required this.like,
    this.youtubeLink,
    this.category,
    this.viewCount,
  });

  int itemsId;
  String name;
  String englishName;
  int price;
  int size;
  int strength;
  String country;
  String categoryName;
  double rating;
  int ratingCount;
  String linkUrl;
  bool like;
  String? youtubeLink;
  String? category;
  int? viewCount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        itemsId: json["itemsId"],
        name: json["name"],
        englishName: json["englishName"],
        price: json["price"],
        size: json["size"],
        strength: json["strength"],
        country: json["country"],
        categoryName: json["categoryName"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        linkUrl: json["linkUrl"],
        like: json["like"],
        youtubeLink: json["youtubeLink"],
        category: json["category"],
        viewCount: json["viewCount"],
      );

  Map<String, dynamic> toJson() => {
        "itemsId": itemsId,
        "name": name,
        "englishName": englishName,
        "price": price,
        "size": size,
        "strength": strength,
        "country": country,
        "categoryName": categoryName,
        "rating": rating,
        "ratingCount": ratingCount,
        "linkUrl": linkUrl,
        "like": like,
        "youtubeLink": youtubeLink,
        "category": category,
        "viewCount": viewCount,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
