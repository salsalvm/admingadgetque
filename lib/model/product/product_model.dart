// To parse this JSON data, do
//
//     final productDatasModel = productDatasModelFromJson(jsonString);

import 'dart:convert';

ProductDatasModel productDatasModelFromJson(String str) =>
    ProductDatasModel.fromJson(json.decode(str));

String productDatasModelToJson(ProductDatasModel data) =>
    json.encode(data.toJson());

class ProductDatasModel {
  ProductDatasModel({
    required this.admin,
    required this.products,
  });

  bool admin;
  List<Product> products;

  factory ProductDatasModel.fromJson(Map<String, dynamic> json) =>
      ProductDatasModel(
        admin: json["admin"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.originalPrice,
    required this.price,
    required this.description,
    required this.imageId,
  });

  String? id;
  String? name;
  String? category;
  String? originalPrice;
  String? price;
  String? description;
  String? imageId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["Name"],
        category: json["Category"],
        originalPrice: json["originalPrice"],
        price: json["Price"],
        description: json["Description"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Category": category,
        "originalPrice": originalPrice,
        "Price": price,
        "Description": description,
        "imageId": imageId,
      };
}
