// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  bool? success;
  int? code;
  List<Datum>? data;

  FaqModel({
    this.success,
    this.code,
    this.data,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
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
  String? question;
  String? answer;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.question,
    this.answer,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    question: json["question"],
    answer: json["answer"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "answer": answer,
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
