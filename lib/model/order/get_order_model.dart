import 'dart:convert';

AllOrders allOrdersFromJson(String str) => AllOrders.fromJson(json.decode(str));

String allOrdersToJson(AllOrders data) => json.encode(data.toJson());

class AllOrders {
    AllOrders({
        required this.allOrders,
        required this.admin,
    });

    List<AllOrder>? allOrders;
    bool? admin;

    factory AllOrders.fromJson(Map<String, dynamic> json) => AllOrders(
        allOrders: List<AllOrder>.from(json["allOrders"].map((x) => AllOrder.fromJson(x))),
        admin: json["admin"],
    );

    Map<String, dynamic> toJson() => {
        "allOrders": List<dynamic>.from(allOrders!.map((x) => x.toJson())),
        "admin": admin,
    };
}

class AllOrder {
    AllOrder({
        required this.id,
        required this.deliveryDetails,
        required this.userName,
        required this.userId,
        required this.paymentMethod,
        required this.products,
        required this.totalAmount,
        required this.status,
        required this.dateIso,
        required this.date,
        required this.time,
        required this.coupon,
        required this.cancelled,
        required this.delivered,
    });

    String? id;
   DeliveryDetails? deliveryDetails;
    String? userName;
    String? userId;
    String? paymentMethod;
    List<Product>? products;
    int? totalAmount;
    String? status;
    DateTime? dateIso;
    String? date;
    String? time;
    String? coupon;
    bool ?cancelled;
    bool? delivered;

    factory AllOrder.fromJson(Map<String, dynamic> json) => AllOrder(
        id: json["_id"],
        deliveryDetails: DeliveryDetails.fromJson(json["deliveryDetails"]),
        userName: json["userName"],
        userId: json["userId"],
        paymentMethod: json["paymentMethod"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        totalAmount: json["totalAmount"],
        status: json["status"],
        dateIso: DateTime.parse(json["DateISO"]),
        date: json["Date"],
        time: json["Time"],
        coupon: json["Coupon"],
        cancelled: json["cancelled"] == null ? null : json["cancelled"],
        delivered: json["delivered"] == null ? null : json["delivered"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "deliveryDetails": deliveryDetails!.toJson(),
        "userName": userName,
        "userId": userId,
        "paymentMethod": paymentMethod,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "status": status,
        "DateISO": dateIso!.toIso8601String(),
        "Date": date,
        "Time": time,
        "Coupon": coupon,
        "cancelled": cancelled == null ? null : cancelled,
        "delivered": delivered == null ? null : delivered,
    };
}

class DeliveryDetails {
    DeliveryDetails({
        required this.mobile,
        required this.address,
        required this.type,
        required this.pincode,
    });

    String? mobile;
    String? address;
    String? type;
    String? pincode;

    factory DeliveryDetails.fromJson(Map<String, dynamic> json) => DeliveryDetails(
        mobile: json["mobile"],
        address: json["address"],
        type: json["type"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "address": address,
        "type": type,
        "pincode": pincode,
    };
}

class Product {
    Product({
        required this.item,
        required this.quantity,
        required this.totalAmount,
    });

    String? item;
    int ?quantity;
    int? totalAmount;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        item: json["item"],
        quantity: json["quantity"],
        totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
    );

    Map<String, dynamic> toJson() => {
        "item": item,
        "quantity": quantity,
        "totalAmount": totalAmount == null ? null : totalAmount,
    };
}
