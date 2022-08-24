// To parse this JSON data, do
//
//     final planetsModel = planetsModelFromJson(jsonString);

import 'dart:convert';

PlanetsModel planetsModelFromJson(String str) => PlanetsModel.fromJson(json.decode(str));

String planetsModelToJson(PlanetsModel data) => json.encode(data.toJson());

class PlanetsModel {
  PlanetsModel({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  List<PlanetData> data;

  factory PlanetsModel.fromJson(Map<String, dynamic> json) => PlanetsModel(
    type: json["type"],
    message: json["message"],
    data: List<PlanetData>.from(json["data"].map((x) => PlanetData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PlanetData {
  PlanetData({
    required this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,
  });

  String plantId;
  String name;
  String description;
  String imageUrl;
  int waterCapacity;
  int sunLight;
  int temperature;

  factory PlanetData.fromJson(Map<String, dynamic> json) => PlanetData(
    plantId: json["plantId"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    waterCapacity: json["waterCapacity"],
    sunLight: json["sunLight"],
    temperature: json["temperature"],
  );

  Map<String, dynamic> toJson() => {
    "plantId": plantId,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
    "waterCapacity": waterCapacity,
    "sunLight": sunLight,
    "temperature": temperature,
  };
}
