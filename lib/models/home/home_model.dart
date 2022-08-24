// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
   required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  DataAll data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    type: json["type"],
    message: json["message"],
    data: DataAll.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": data.toJson(),
  };
}

class DataAll {
  DataAll({
    required  this.productId,
    required this.name,
    required this.description,
    required  this.imageurl,
    required  this.type,
    required   this.price,
    required  this.plant,
    required  this.seed,
    required this.tool,
    required this.available
  });

  String productId;
  String name;
  String description;
  String imageurl;
  String type;
  double price;
  bool available;
  Plant plant;
  Seed seed;
  Seed tool;

  factory DataAll.fromJson(Map<String, dynamic> json) => DataAll(
    productId: json["productId"],
    name: json["name"],
    description: json["description"],
    imageurl: json["imageurl"],
    type: json["type"],
    price: json["price"].toDouble(),
    available: json["available"],
    plant: Plant.fromJson(json["plant"]),
    seed: Seed.fromJson(json["seed"]),
    tool: Seed.fromJson(json["tool"]),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "name": name,
    "description": description,
    "imageurl": imageurl,
    "type": type,
    "price": price,
    "available":available,
    "plant": plant.toJson(),
    "seed": seed.toJson(),
    "tool": tool.toJson(),
  };
}

class Plant {
  Plant({
    required  this.plantId,
    required  this.name,
    required  this.description,
    required  this.waterCapacity,
  required  this.sunLight,
   required this.temperature,
    required this.imageUrl,
  });
String imageUrl;
  String plantId;
  String name;
  String description;
  double waterCapacity;
  double sunLight;
  double temperature;

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    plantId: json["plantId"],
    name: json["name"],
    description: json["description"],
    waterCapacity: json["waterCapacity"].toDouble(),
    sunLight: json["sunLight"].toDouble(),
    temperature: json["temperature"].toDouble(),
      imageUrl:json['imageUrl']
  );

  Map<String, dynamic> toJson() => {
    "plantId": plantId,
    "name": name,
    "description": description,
    "waterCapacity": waterCapacity,
    "sunLight": sunLight,
    "temperature": temperature,
    "imageUrl":imageUrl,
  };
}

class Seed {
  Seed({
    required this.id,
 required   this.name,
  required  this.description,
    required this.imageUrl
  });

  String id;
  String name;
  String description;
  String imageUrl;
  factory Seed.fromJson(Map<String, dynamic> json) => Seed(
    id: json["seedId"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"]

  );

  Map<String, dynamic> toJson() => {
    "seedId": id,
    "name": name,
    "description": description,
    "imageUrl":imageUrl
  };
}
class Tool {
  Tool({
   required this.toolId,
   required this.name,
   required this.description,
    required this.imageUrl,
  });

  String toolId;
  String name;
  String description;
  String imageUrl;

  factory Tool.fromJson(Map<String, dynamic> json) => Tool(
    toolId: json["toolId"],
    name: json["name"]??"Axe",
    description: json["description"],
    imageUrl: json['imageUrl']
  );

  Map<String, dynamic> toJson() => {
    "toolId": toolId,
    "name": name,
    "description": description,
    "imageUrl":imageUrl
  };
}

