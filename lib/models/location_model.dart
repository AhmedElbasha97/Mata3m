// To parse this JSON data, do
//
//     final restraunts = restrauntsFromJson(jsonString);

import 'dart:convert';

class Restraunts {
  Restraunts({
     this.city,
     this.gov,
     this.image,
  });

  List<City>? city;
  String? gov;
  String? image;

  factory Restraunts.fromRawJson(String str) => Restraunts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Restraunts.fromJson(Map<String, dynamic> json) => Restraunts(
    city: List<City>.from(json["city"].map((x) => x == null ? null : City.fromJson(x))),
    gov: json["gov"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "city": List<dynamic>.from(city??[].map((x) => x == null ? null : x.toJson())),
    "gov": gov,
    "image": image,
  };
}

class City {
  City({
    required this.description,
    required this.location,
    required this.name,
    required this.phoneNumber,
    required this.rate,
    required this.id,
    this.images,
    this.menu,
  });

  String description;
  List<String> location;
  String name;
  String phoneNumber;
  String rate;
  String id;
  List<String>? images;
  List<String>? menu;

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
    description: json["Description"],
    location: List<String>.from(json["Location"].map((x) => x)),
    name: json["Name"],
    phoneNumber: json["Phone number"],
    rate: json["Rate"],
    id: json["id"],
    images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
    menu: json["menu"] == null ? null : List<String>.from(json["menu"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Description": description,
    "Location": List<dynamic>.from(location.map((x) => x)),
    "Name": name,
    "Phone number": phoneNumber,
    "Rate": rate,
    "id": id,
    "images": images == null ? null : List<dynamic>.from(images??[].map((x) => x)),
    "menu": menu == null ? null : List<dynamic>.from(menu??[].map((x) => x)),
  };
}




