import 'dart:convert';

DeleteProductModel deleteProductModelFromJson(String str) =>
    DeleteProductModel.fromJson(json.decode(str));

String deleteProductModelToJson(DeleteProductModel data) =>
    json.encode(data.toJson());

class DeleteProductModel {
  DeleteProductModel({
    required this.response,
  });

  Response response;

  factory DeleteProductModel.fromJson(Map<String, dynamic> json) =>
      DeleteProductModel(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  Response({
    required this.acknowledged,
    required this.deletedCount,
  });

  bool acknowledged;
  int deletedCount;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        acknowledged: json["acknowledged"],
        deletedCount: json["deletedCount"],
      );

  Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "deletedCount": deletedCount,
      };
}
