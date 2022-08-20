import 'dart:convert';

UpdateCategoryModel updateCategoryModelFromJson(String str) => UpdateCategoryModel.fromJson(json.decode(str));

String updateCategoryModelToJson(UpdateCategoryModel data) => json.encode(data.toJson());

class UpdateCategoryModel {
    UpdateCategoryModel({
        required this.success,
    });

    bool success;

    factory UpdateCategoryModel.fromJson(Map<String, dynamic> json) => UpdateCategoryModel(
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
    };
}
