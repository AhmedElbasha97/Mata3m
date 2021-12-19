// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

class Users {
  Users({
    required this.name,
    required this.email,
    required this.password,
  });

  String name;
  String email;
  String password;

  factory Users.fromRawJson(String str) => Users.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    name: json["Name"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "email": email,
    "password": password,
  };
}
