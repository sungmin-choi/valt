// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

import 'package:valt/model/youtube_model.dart';

ProductDetail productDetailFromJson(String str) =>
    ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  ProductDetail({
    required this.itemsId,
    required this.name,
    required this.englishName,
    required this.price,
    required this.size,
    required this.strength,
    required this.country,
    required this.category,
    required this.categoryName,
    required this.rating,
    required this.ratingCount,
    this.viewCount,
    required this.linkUrl,
    this.aroma,
    this.taste,
    this.finish,
    required this.youtube,
    required this.like,
  });

  int itemsId;
  String name;
  String englishName;
  int price;
  int size;
  int strength;
  String country;
  String category;
  String categoryName;
  double rating;
  int ratingCount;
  int? viewCount;
  String linkUrl;
  String? aroma;
  String? taste;
  String? finish;
  List<YoutubeModel> youtube;
  bool like;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        itemsId: json["itemsId"],
        name: json["name"],
        englishName: json["englishName"],
        price: json["price"],
        size: json["size"],
        strength: json["strength"],
        country: json["country"],
        category: json["category"],
        categoryName: json["categoryName"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        viewCount: json["viewCount"],
        linkUrl: json["linkUrl"],
        aroma: json["aroma"],
        taste: json["taste"],
        finish: json["finish"],
        youtube: List<YoutubeModel>.from(
            json["youtube"].map((x) => YoutubeModel.fromJson(x))),
        like: json["like"],
      );

  Map<String, dynamic> toJson() => {
        "itemsId": itemsId,
        "name": name,
        "englishName": englishName,
        "price": price,
        "size": size,
        "strength": strength,
        "country": country,
        "category": category,
        "categoryName": categoryName,
        "rating": rating,
        "ratingCount": ratingCount,
        "viewCount": viewCount,
        "linkUrl": linkUrl,
        "aroma": aroma,
        "taste": taste,
        "finish": finish,
        "youtube": List<dynamic>.from(youtube.map((x) => x.toJson())),
        "like": like,
      };
}
