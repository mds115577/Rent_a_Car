// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromJson(jsonString);

import 'dart:convert';

OtpVerifyModel otpVerifyModelFromJson(String str) =>
    OtpVerifyModel.fromJson(json.decode(str));

String otpVerifyModelToJson(OtpVerifyModel data) => json.encode(data.toJson());

class OtpVerifyModel {
  OtpVerifyModel({
    required this.email,
    required this.number,
    required this.otp,
  });

  String email;
  String number;
  String otp;

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) => OtpVerifyModel(
        email: json["email"],
        number: json["number"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "number": number,
        "otp": otp,
      };
}
