// To parse this JSON data, do
//
//     final formulModel = formulModelFromJson(jsonString);

import 'dart:convert';

FormulModel formulModelFromJson(String str) => FormulModel.fromJson(json.decode(str));

String formulModelToJson(FormulModel data) => json.encode(data.toJson());

class FormulModel {
  FormulModel({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  List<Datumm> data;

  factory FormulModel.fromJson(Map<String, dynamic> json) => FormulModel(
    type: json["type"],
    message: json["message"],
    data: List<Datumm>.from(json["data"].map((x) => Datumm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datumm {
  Datumm({
    required this.forumId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
    required this.forumLikes,
    required this.forumComments,
    required this.user,
  });

  String forumId;
  String title;
  String description;
  String imageUrl;
  String userId;
  List<ForumLike> forumLikes;
  List<ForumComment> forumComments;
  Userr user;

  factory Datumm.fromJson(Map<String, dynamic> json) => Datumm(
    forumId: json["forumId"],
    title: json["title"],
    description: json["description"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    userId: json["userId"],
    forumLikes: List<ForumLike>.from(json["ForumLikes"].map((x) => ForumLike.fromJson(x))),
    forumComments: List<ForumComment>.from(json["ForumComments"].map((x) => ForumComment.fromJson(x))),
    user: Userr.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "forumId": forumId,
    "title": title,
    "description": description,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "userId": userId,
    "ForumLikes": List<dynamic>.from(forumLikes.map((x) => x.toJson())),
    "ForumComments": List<dynamic>.from(forumComments.map((x) => x.toJson())),
    "user": user.toJson(),
  };
}

class ForumComment {
  ForumComment({
    required this.forumCommentId,
    required this.forumId,
    required this.userId,
    required this.comment,
    required this.createdAt,
  });

  String forumCommentId;
  String forumId;
  String userId;
  String comment;
  DateTime createdAt;

  factory ForumComment.fromJson(Map<String, dynamic> json) => ForumComment(
    forumCommentId: json["forumCommentId"],
    forumId: json["forumId"],
    userId: json["userId"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "forumCommentId": forumCommentId,
    "forumId": forumId,
    "userId": userId,
    "comment": comment,
    "createdAt": createdAt.toIso8601String(),
  };
}

class ForumLike {
  ForumLike({
    required this.forumId,
    required this.userId,
  });

  String forumId;
  String userId;

  factory ForumLike.fromJson(Map<String, dynamic> json) => ForumLike(
    forumId: json["forumId"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "forumId": forumId,
    "userId": userId,
  };
}

class Userr {
  Userr({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  String firstName;
  String lastName;
  String imageUrl;

  factory Userr.fromJson(Map<String, dynamic> json) => Userr(
    firstName: json["firstName"],
    lastName: json["lastName"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "imageUrl": imageUrl,
  };
}
