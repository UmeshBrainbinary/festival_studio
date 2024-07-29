// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  String? message;
  User? user;

  BrandModel({
    this.message,
    this.user,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
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
  String? mobileNo;
  String? email;
  String? password;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? refreshToken;
  BrandDetails? brandDetails;

  User({
    this.id,
    this.firstName,
    this.mobileNo,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.refreshToken,
    this.brandDetails,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["firstName"],
    mobileNo: json["mobileNo"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    refreshToken: json["refreshToken"],
    brandDetails: json["brandDetails"] == null ? null : BrandDetails.fromJson(json["brandDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "mobileNo": mobileNo,
    "email": email,
    "password": password,
    "role": role,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "refreshToken": refreshToken,
    "brandDetails": brandDetails?.toJson(),
  };
}

class BrandDetails {
  String? brandName;
  String? tagLine;
  String? phoneNo;
  String? email;
  String? website;
  String? address;

  BrandDetails({
    this.brandName,
    this.tagLine,
    this.phoneNo,
    this.email,
    this.website,
    this.address,
  });

  factory BrandDetails.fromJson(Map<String, dynamic> json) => BrandDetails(
    brandName: json["brandName"],
    tagLine: json["tagLine"],
    phoneNo: json["phoneNo"],
    email: json["email"],
    website: json["website"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "brandName": brandName,
    "tagLine": tagLine,
    "phoneNo": phoneNo,
    "email": email,
    "website": website,
    "address": address,
  };
}
