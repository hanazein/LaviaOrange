// To parse this JSON data, do
//
//     final formulPostModel = formulPostModelFromJson(jsonString);

import 'dart:convert';

FormulPostModel formulPostModelFromJson(String str) => FormulPostModel.fromJson(json.decode(str));

String formulPostModelToJson(FormulPostModel data) => json.encode(data.toJson());

class FormulPostModel {
  FormulPostModel({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  PostData data;

  factory FormulPostModel.fromJson(Map<String, dynamic> json) => FormulPostModel(
    type: json["type"],
    message: json["message"],
    data: PostData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": data.toJson(),
  };
}

class PostData {
  PostData({
    required this.forumId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
  });

  String forumId;
  String title;
  String description;
  String imageUrl;
  String userId;

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
    forumId: json["forumId"],
    title: json["title"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "forumId": forumId,
    "title": title,
    "description": description,
    "imageUrl": imageUrl,
    "userId": userId,
  };
}
