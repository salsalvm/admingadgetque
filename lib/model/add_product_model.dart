// To parse this JSON data, do
//
//     final addProductModel = addProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddProductModel addProductModelFromJson(String str) => AddProductModel.fromJson(json.decode(str));

String addProductModelToJson(AddProductModel data) => json.encode(data.toJson());

class AddProductModel {
    AddProductModel({
        required this.result,
        required this.success,
    });

    String result;
    bool success;

    factory AddProductModel.fromJson(Map<String, dynamic> json) => AddProductModel(
        result: json["result"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "success": success,
    };
}
