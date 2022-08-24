// To parse this JSON data, do
//
//     final productFetch = productFetchFromJson(jsonString);

import 'dart:convert';

ProductFetch productFetchFromJson(String str) => ProductFetch.fromJson(json.decode(str));

String productFetchToJson(ProductFetch data) => json.encode(data.toJson());

class ProductFetch {
  ProductFetch({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  Data data;

  factory ProductFetch.fromJson(Map<String, dynamic> json) => ProductFetch(
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
    required this.plants,
    required this.seeds,
    required this.tools,
  });

  List<PlantBLog> plants;
  List<SeedBlog> seeds;
  List<SeedBlog> tools;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    plants: List<PlantBLog>.from(json["plants"].map((x) => PlantBLog.fromJson(x))),
    seeds: List<SeedBlog>.from(json["seeds"].map((x) => SeedBlog.fromJson(x))),
    tools: List<SeedBlog>.from(json["tools"].map((x) => SeedBlog.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plants": List<dynamic>.from(plants.map((x) => x.toJson())),
    "seeds": List<dynamic>.from(seeds.map((x) => x.toJson())),
    "tools": List<dynamic>.from(tools.map((x) => x.toJson())),
  };
}

class PlantBLog {
  PlantBLog({
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

  factory PlantBLog.fromJson(Map<String, dynamic> json) => PlantBLog(
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

class SeedBlog {
  SeedBlog({
    required this.seedId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.toolId,
  });

  String seedId;
  String name;
  String description;
  String imageUrl;
  String toolId;

  factory SeedBlog.fromJson(Map<String, dynamic> json) => SeedBlog(
    seedId: json["seedId"] == null ? null : json["seedId"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    toolId: json["toolId"] == null ? null : json["toolId"],
  );

  Map<String, dynamic> toJson() => {
    "seedId": seedId == null ? null : seedId,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
    "toolId": toolId == null ? null : toolId,
  };
}
