// To parse this JSON data, do
//
//     final viewCategoryModel = viewCategoryModelFromJson(jsonString);

import 'dart:convert';

ViewCategoryModel viewCategoryModelFromJson(String str) =>
    ViewCategoryModel.fromJson(json.decode(str));

String viewCategoryModelToJson(ViewCategoryModel data) =>
    json.encode(data.toJson());

class ViewCategoryModel {
  ViewCategoryModel({
    required this.admin,
    required this.category,
  });

  bool admin;
  List<Category> category;

  factory ViewCategoryModel.fromJson(Map<String, dynamic> json) =>
      ViewCategoryModel(
        admin: json["admin"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.id,
    required this.category,
  });

  String? id;
  String? category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Category": category,
      };
}
