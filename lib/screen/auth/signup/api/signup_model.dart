// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  bool? success;
  int? code;
  String? message;
  User? user;

  SignUpModel({
    this.success,
    this.code,
    this.message,
    this.user,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  String? firstName;
  String? email;
  String? mobileNo;

  User({
    this.firstName,
    this.email,
    this.mobileNo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    email: json["email"],
    mobileNo: json["mobileNo"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "email": email,
    "mobileNo": mobileNo,
  };
}
