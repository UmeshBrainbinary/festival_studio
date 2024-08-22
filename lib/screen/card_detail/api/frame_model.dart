// To parse this JSON data, do
//
//     final frameModel = frameModelFromJson(jsonString);

import 'dart:convert';

FrameModel frameModelFromJson(String str) => FrameModel.fromJson(json.decode(str));

String frameModelToJson(FrameModel data) => json.encode(data.toJson());

class FrameModel {
  bool? success;
  int? code;
  String? message;
  List<Datum>? data;

  FrameModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory FrameModel.fromJson(Map<String, dynamic> json) => FrameModel(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  FrameImg? frameImg;
  String? id;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.frameImg,
    this.id,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    frameImg: json["frameImg"] == null ? null : FrameImg.fromJson(json["frameImg"]),
    id: json["_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "frameImg": frameImg?.toJson(),
    "_id": id,
    "user": user?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class FrameImg {
  String? publicId;
  String? url;

  FrameImg({
    this.publicId,
    this.url,
  });

  factory FrameImg.fromJson(Map<String, dynamic> json) => FrameImg(
    publicId: json["public_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "url": url,
  };
}

class User {
  String? id;
  String? firstName;
  String? email;

  User({
    this.id,
    this.firstName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["firstName"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "email": email,
  };
}
