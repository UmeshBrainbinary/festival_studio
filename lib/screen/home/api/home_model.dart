// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) => List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  String? category;
  List<PostsGroupedBySubCategory>? postsGroupedBySubCategory;
  List<Post>? postsWithoutSubCategory;

  HomeModel({
    this.category,
    this.postsGroupedBySubCategory,
    this.postsWithoutSubCategory,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    category: json["category"],
    postsGroupedBySubCategory: json["postsGroupedBySubCategory"] == null ? [] : List<PostsGroupedBySubCategory>.from(json["postsGroupedBySubCategory"]!.map((x) => PostsGroupedBySubCategory.fromJson(x))),
    postsWithoutSubCategory: json["postsWithoutSubCategory"] == null ? [] : List<Post>.from(json["postsWithoutSubCategory"]!.map((x) => Post.fromJson(x))),
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
  PostImg? postImg;
  FrameImg? frameImg;
  String? id;
  String? category;
  Subcategory? subcategory;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

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
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    postImg: json["postImg"] == null ? null : PostImg.fromJson(json["postImg"]),
    frameImg: json["frameImg"] == null ? null : FrameImg.fromJson(json["frameImg"]),
    id: json["_id"],
    category: json["category"],
    subcategory: json["subcategory"] == null ? null : Subcategory.fromJson(json["subcategory"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "postImg": postImg?.toJson(),
    "frameImg": frameImg?.toJson(),
    "_id": id,
    "category": category,
    "subcategory": subcategory?.toJson(),
    "user": user?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
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

class PostImg {
  String? publicId;
  String? url;

  PostImg({
    this.publicId,
    this.url,
  });

  factory PostImg.fromJson(Map<String, dynamic> json) => PostImg(
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
