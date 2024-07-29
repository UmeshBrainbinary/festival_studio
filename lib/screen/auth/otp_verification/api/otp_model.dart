// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  String? message;
  User? user;

  OtpModel({
    this.message,
    this.user,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  String? id;
  String? firstName;
  String? email;
  String? mobileNo;
  String? token;

  User({
    this.id,
    this.firstName,
    this.email,
    this.mobileNo,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    email: json["email"],
    mobileNo: json["mobileNo"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "email": email,
    "mobileNo": mobileNo,
    "token": token,
  };
}
