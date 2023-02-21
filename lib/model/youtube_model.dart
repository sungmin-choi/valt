import 'dart:convert';

List<YoutubeModel> youtubeModelListFromJson(String str) =>
    List<YoutubeModel>.from(
        json.decode(str).map((x) => YoutubeModel.fromJson(x)));

String youtubeModelListToJson(List<YoutubeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

YoutubeModel youtubeModelFromJson(String str) =>
    YoutubeModel.fromJson(json.decode(str));

String youtubeModelToJson(YoutubeModel data) => json.encode(data.toJson());

class YoutubeModel {
  YoutubeModel({
    required this.title,
    required this.authorName,
    required this.thumbnailUrl,
    required this.youtubeLink,
  });

  String title;
  String authorName;
  String thumbnailUrl;
  String youtubeLink;

  factory YoutubeModel.fromJson(Map<String, dynamic> json) => YoutubeModel(
        title: json["title"],
        authorName: json["authorName"],
        thumbnailUrl: json["thumbnailUrl"],
        youtubeLink: json["youtubeLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authorName": authorName,
        "thumbnailUrl": thumbnailUrl,
        "youtubeLink": youtubeLink,
      };
}
