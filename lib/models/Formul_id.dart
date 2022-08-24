// To parse this JSON data, do
//
//     final postCommentId = postCommentIdFromJson(jsonString);

import 'dart:convert';

PostCommentId postCommentIdFromJson(String str) => PostCommentId.fromJson(json.decode(str));

String postCommentIdToJson(PostCommentId data) => json.encode(data.toJson());

class PostCommentId {
  PostCommentId({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  DataId data;

  factory PostCommentId.fromJson(Map<String, dynamic> json) => PostCommentId(
    type: json["type"],
    message: json["message"],
    data: DataId.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": data.toJson(),
  };
}

class DataId {
  DataId({
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
  List<dynamic> forumLikes;
  List<ForumCommentId> forumComments;
  User user;

  factory DataId.fromJson(Map<String, dynamic> json) => DataId(
    forumId: json["forumId"],
    title: json["title"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    userId: json["userId"],
    forumLikes: List<dynamic>.from(json["ForumLikes"].map((x) => x)),
    forumComments: List<ForumCommentId>.from(json["ForumComments"].map((x) => ForumCommentId.fromJson(x))),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "forumId": forumId,
    "title": title,
    "description": description,
    "imageUrl": imageUrl,
    "userId": userId,
    "ForumLikes": List<dynamic>.from(forumLikes.map((x) => x)),
    "ForumComments": List<dynamic>.from(forumComments.map((x) => x.toJson())),
    "user": user.toJson(),
  };
}

class ForumCommentId {
  ForumCommentId({
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

  factory ForumCommentId.fromJson(Map<String, dynamic> json) => ForumCommentId(
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

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  String firstName;
  String lastName;
  String imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
