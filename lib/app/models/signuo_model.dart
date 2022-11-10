// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.name,
    required this.email,
    required this.number,
    required this.password,
  });

  String name;
  String email;
  String number;
  String password;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json["name"],
        email: json["email"],
        number: json["number"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "number": number,
        "password": password,
      };
}
