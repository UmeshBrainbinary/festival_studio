// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) => List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  String? category;
  List<PostsGroupedBySubCategory>? postsGroupedBySubCategory;
  List<PostsWithoutSubCategory>? postsWithoutSubCategory;

  HomeModel({
    this.category,
    this.postsGroupedBySubCategory,
    this.postsWithoutSubCategory,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    category: json["category"],
    postsGroupedBySubCategory: json["postsGroupedBySubCategory"] == null ? [] : List<PostsGroupedBySubCategory>.from(json["postsGroupedBySubCategory"]!.map((x) => PostsGroupedBySubCategory.fromJson(x))),
    postsWithoutSubCategory: json["postsWithoutSubCategory"] == null ? [] : List<PostsWithoutSubCategory>.from(json["postsWithoutSubCategory"]!.map((x) => PostsWithoutSubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "postsGroupedBySubCategory": postsGroupedBySubCategory == null ? [] : List<dynamic>.from(postsGroupedBySubCategory!.map((x) => x.toJson())),
    "postsWithoutSubCategory": postsWithoutSubCategory == null ? [] : List<dynamic>.from(postsWithoutSubCategory!.map((x) => x.toJson())),
  };
}

class PostsGroupedBySubCategory {
  String? subCategory;
  List<Post>? posts;

  PostsGroupedBySubCategory({
    this.subCategory,
    this.posts,
  });

  factory PostsGroupedBySubCategory.fromJson(Map<String, dynamic> json) => PostsGroupedBySubCategory(
    subCategory: json["subCategory"],
    posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subCategory": subCategory,
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}

class Post {
  dynamic postImg;
  FrameImg? frameImg;
  String? id;
  String? category;
  Subcategory? subcategory;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? date;
  String? description;

  Post({
    this.postImg,
    this.frameImg,
    this.id,
    this.category,
    this.subcategory,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.date,
    this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    postImg: json["postImg"],
    frameImg: json["frameImg"] == null ? null : FrameImg.fromJson(json["frameImg"]),
    id: json["_id"],
    category: json["category"],
    subcategory: json["subcategory"] == null ? null : Subcategory.fromJson(json["subcategory"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "postImg": postImg,
    "frameImg": frameImg?.toJson(),
    "_id": id,
    "category": category,
    "subcategory": subcategory?.toJson(),
    "user": user?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "date": date?.toIso8601String(),
    "description": description,
  };
}

class FrameImg {
  dynamic url;

  FrameImg({
    this.url,
  });

  factory FrameImg.fromJson(Map<String, dynamic> json) => FrameImg(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class PostImgElement {
  String? publicId;
  String? url;
  String? id;

  PostImgElement({
    this.publicId,
    this.url,
    this.id,
  });

  factory PostImgElement.fromJson(Map<String, dynamic> json) => PostImgElement(
    publicId: json["public_id"],
    url: json["url"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "url": url,
    "_id": id,
  };
}

class Img {
  String? publicId;
  String? url;

  Img({
    this.publicId,
    this.url,
  });

  factory Img.fromJson(Map<String, dynamic> json) => Img(
    publicId: json["public_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "url": url,
  };
}

class Subcategory {
  String? id;
  String? title;

  Subcategory({
    this.id,
    this.title,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
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

class PostsWithoutSubCategory {
  dynamic postImg;
  Img? frameImg;
  String? id;
  String? category;
  dynamic subcategory;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? date;
  String? description;

  PostsWithoutSubCategory({
    this.postImg,
    this.frameImg,
    this.id,
    this.category,
    this.subcategory,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.date,
    this.description,
  });

  factory PostsWithoutSubCategory.fromJson(Map<String, dynamic> json) => PostsWithoutSubCategory(
    postImg: json["postImg"],
    frameImg: json["frameImg"] == null ? null : Img.fromJson(json["frameImg"]),
    id: json["_id"],
    category: json["category"],
    subcategory: json["subcategory"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "postImg": postImg,
    "frameImg": frameImg?.toJson(),
    "_id": id,
    "category": category,
    "subcategory": subcategory,
    "user": user?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "date": date?.toIso8601String(),
    "description": description,
  };
}
