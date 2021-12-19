// To parse this JSON data, do
//
//     final favorite = favoriteFromJson(jsonString);

import 'dart:convert';

class Favorite {
  Favorite({
    required this.name,
    required this.rate,
    required this.description,
     this.images,
    required this.locations,
     this.menu,
    required this.tel,
  });

  String name;
  String rate;
  String description;
  List<String>? images;
  List<String> locations;
  List<String>? menu;
  String tel;

  factory Favorite.fromRawJson(String str) => Favorite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    name: json["Name"],
    rate: json["Rate"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    locations: List<String>.from(json["locations"].map((x) => x)),
    menu: List<String>.from(json["menu"].map((x) => x)),
    tel: json["tel"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Rate": rate,
    "description": description,
    "images": List<dynamic>.from(images??[].map((x) => x)),
    "locations": List<dynamic>.from(locations.map((x) => x)),
    "menu": List<dynamic>.from(menu??[].map((x) => x)),
    "tel": tel,
  };
}