// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.user,
  });

  bool user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
      };
}
