// To parse this JSON data, do
//
//     final postComment = postCommentFromJson(jsonString);

import 'dart:convert';

PostComment postCommentFromJson(String str) => PostComment.fromJson(json.decode(str));

String postCommentToJson(PostComment data) => json.encode(data.toJson());

class PostComment {
  PostComment({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  DataComment data;

  factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
    type: json["type"],
    message: json["message"],
    data: DataComment.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": data.toJson(),
  };
}

class DataComment {
  DataComment({
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

  factory DataComment.fromJson(Map<String, dynamic> json) => DataComment(
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
