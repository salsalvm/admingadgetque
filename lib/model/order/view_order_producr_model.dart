import 'dart:convert';

ViewOrderProduct viewOrderProductFromJson(String str) => ViewOrderProduct.fromJson(json.decode(str));

String viewOrderProductToJson(ViewOrderProduct data) => json.encode(data.toJson());

class ViewOrderProduct {
    ViewOrderProduct({
        required this.products,
        required this.admin,
    });

    List<ProductElement>? products;
    bool? admin;

    factory ViewOrderProduct.fromJson(Map<String, dynamic> json) => ViewOrderProduct(
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
        admin: json["admin"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "admin": admin,
    };
}

class ProductElement {
    ProductElement({
        required this.id,
        required this.item,
        required this.quantity,
        required this.product,
    });

    String? id;
    String? item;
    int? quantity;
    ProductProduct? product;

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["_id"],
        item: json["item"],
        quantity: json["quantity"],
        product: ProductProduct.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "quantity": quantity,
        "product": product!.toJson(),
    };
}

class ProductProduct {
    ProductProduct({
        required this.id,
        required this.name,
        required this.category,
        required this.originalPrice,
        required this.price,
        required this.description,
        required this.imageId,
    });

    String ?id;
    String? name;
    String? category;
    String? originalPrice;
    String? price;
    String? description;
    String ?imageId;

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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
