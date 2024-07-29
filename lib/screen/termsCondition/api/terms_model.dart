// To parse this JSON data, do
//
//     final termsConditionModel = termsConditionModelFromJson(jsonString);

import 'dart:convert';

TermsConditionModel termsConditionModelFromJson(String str) => TermsConditionModel.fromJson(json.decode(str));

String termsConditionModelToJson(TermsConditionModel data) => json.encode(data.toJson());

class TermsConditionModel {
  bool? success;
  int? code;
  List<Datum>? data;

  TermsConditionModel({
    this.success,
    this.code,
    this.data,
  });

  factory TermsConditionModel.fromJson(Map<String, dynamic> json) => TermsConditionModel(
    success: json["success"],
    code: json["code"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? description;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.description,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    description: json["description"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "description": description,
    "user": user?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class User {
  String? id;

  User({
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
  };
}
