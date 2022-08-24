// To parse this JSON data, do
//
//     final updateModel = updateModelFromJson(jsonString);

import 'dart:convert';

UpdateModel updateModelFromJson(String str) => UpdateModel.fromJson(json.decode(str));

String updateModelToJson(UpdateModel data) => json.encode(data.toJson());

class UpdateModel {
  UpdateModel({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  Data data;

  factory UpdateModel.fromJson(Map<String, dynamic> json) => UpdateModel(
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
    required this.userPoints,
    required this.userNotification,
  });

  String userId;
  String firstName;
  String lastName;
  String email;
  String imageUrl;
  String address;
  String userPoints;
  List<String> userNotification;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    address: json["address"]??"",
    userPoints: json["UserPoints"],
    userNotification: List<String>.from(json["UserNotification"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "imageUrl": imageUrl,
    "address": address,
    "UserPoints": userPoints,
    "UserNotification": List<dynamic>.from(userNotification.map((x) => x)),
  };
}
