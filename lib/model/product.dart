// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:valt/model/youtube_model.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

Product productDetailFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product(
      {required this.itemsId,
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
      this.youtube,
      required this.category,
      this.viewCount,
      this.taste,
      this.finish,
      this.aroma});

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
  YoutubeModel? youtube;
  String category;
  int? viewCount;
  String? taste;
  String? finish;
  String? aroma;

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
      youtube: json["youtubeLink"],
      category: json["category"],
      viewCount: json["viewCount"],
      taste: json["taste"],
      finish: json["finish"],
      aroma: json["aroma"]);

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
        "youtubeLink": youtube,
        "category": category,
        "viewCount": viewCount,
        "taste": taste,
        "aroma": aroma,
        "finish": finish
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
