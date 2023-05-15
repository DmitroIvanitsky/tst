// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
  final int albumId;
  final int userId;
  final String name;
  final String url;
  final String thumbnailUrl;

  User({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    albumId: json["albumId"],
    userId: json["userId"],
    name: json["name"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "userId": userId,
    "name": name,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}