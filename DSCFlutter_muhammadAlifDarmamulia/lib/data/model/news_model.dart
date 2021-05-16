// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.code,
    this.messege,
    this.data,
  });

  int code;
  String messege;
  List<Datum> data;

  factory News.fromJson(Map<String, dynamic> json) => News(
    code: json["code"],
    messege: json["messege"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "messege": messege,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.contentId,
    this.channelName,
    this.published,
    this.title,
    this.thumbnail,
    this.url,
    this.author,
    this.summary,
  });

  String contentId;
  String channelName;
  String published;
  String title;
  String thumbnail;
  String url;
  String author;
  String summary;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    contentId: json["content_id"],
    channelName: json["channel_name"],
    published: json["published"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    url: json["url"],
    author: json["author"],
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "content_id": contentId,
    "channel_name": channelName,
    "published": published,
    "title": title,
    "thumbnail": thumbnail,
    "url": url,
    "author": author,
    "summary": summary,
  };
}
