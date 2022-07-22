// To parse this JSON data, do
//
//     final addCategoryModel = addCategoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddCategoryModel addCategoryModelFromJson(String str) => AddCategoryModel.fromJson(json.decode(str));

String addCategoryModelToJson(AddCategoryModel data) => json.encode(data.toJson());

class AddCategoryModel {
    AddCategoryModel({
        required this.result,
        required this.success,
    });

    String result;
    bool success;

    factory AddCategoryModel.fromJson(Map<String, dynamic> json) => AddCategoryModel(
        result: json["result"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "success": success,
    };
}
