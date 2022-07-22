
import 'package:meta/meta.dart';
import 'dart:convert';

DeleteCategoryModel deleteCategoryModelFromJson(String str) => DeleteCategoryModel.fromJson(json.decode(str));

String deleteCategoryModelToJson(DeleteCategoryModel data) => json.encode(data.toJson());

class DeleteCategoryModel {
    DeleteCategoryModel({
        required this.acknowledged,
        required this.deletedCount,
    });

    bool acknowledged;
    int deletedCount;

    factory DeleteCategoryModel.fromJson(Map<String, dynamic> json) => DeleteCategoryModel(
        acknowledged: json["acknowledged"],
        deletedCount: json["deletedCount"],
    );

    Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "deletedCount": deletedCount,
    };
}
