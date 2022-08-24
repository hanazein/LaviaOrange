// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  Data data;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    required this.address,
    required this.role,
    this.userPoints,
    required this.userNotification,
  });

  String userId;
  String firstName;
  String lastName;
  String email;
  String imageUrl;
  String address;
  String role;
  dynamic userPoints;
  List<UserNotification> userNotification;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    address: json["address"],
    role: json["role"],
    userPoints: json["UserPoints"],
    userNotification: List<UserNotification>.from(json["UserNotification"].map((x) => UserNotification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "imageUrl": imageUrl,
    "address": address,
    "role": role,
    "UserPoints": userPoints,
    "UserNotification": List<dynamic>.from(userNotification.map((x) => x.toJson())),
  };
}

class UserNotification {
  UserNotification({
    required this.notificationId,
    required this.userId,
    required this.imageUrl,
    required this.message,
    required this.createdAt,
  });

  String notificationId;
  String userId;
  String imageUrl;
  String message;
  DateTime createdAt;

  factory UserNotification.fromJson(Map<String, dynamic> json) => UserNotification(
    notificationId: json["notificationId"],
    userId: json["userId"],
    imageUrl: json["imageUrl"],
    message: json["message"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "notificationId": notificationId,
    "userId": userId,
    "imageUrl": imageUrl,
    "message": message,
    "createdAt": createdAt.toIso8601String(),
  };
}
