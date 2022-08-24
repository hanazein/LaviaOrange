// To parse this JSON data, do
//
//     final likeModel = likeModelFromJson(jsonString);

import 'dart:convert';

LikeModel likeModelFromJson(String str) => LikeModel.fromJson(json.decode(str));

String likeModelToJson(LikeModel data) => json.encode(data.toJson());

class LikeModel {
  LikeModel({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  Data data;

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
    type: json["type"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.forumId,
    required this.userId,
  });

  String forumId;
  String userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    forumId: json["forumId"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "forumId": forumId,
    "userId": userId,
  };
}
