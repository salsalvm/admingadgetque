import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
    DashboardModel({
        required this.admin,
        required this.currentDaySale,
        required this.totalUsers,
        required this.topSelling,
    });

    bool admin;
    int? currentDaySale;
    int? totalUsers;
    List<TopSelling>? topSelling;

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        admin: json["admin"],
        currentDaySale: json["currentDaySale"],
        totalUsers: json["totalUsers"],
        topSelling: List<TopSelling>.from(json["topSelling"].map((x) => TopSelling.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
        "currentDaySale": currentDaySale,
        "totalUsers": totalUsers,
        "topSelling": List<dynamic>.from(topSelling!.map((x) => x.toJson())),
    };
}

class TopSelling {
    TopSelling({
        required this.id,
        required this.totalQty,
    });

    String id;
    int totalQty;

    factory TopSelling.fromJson(Map<String, dynamic> json) => TopSelling(
        id: json["_id"],
        totalQty: json["totalQty"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "totalQty": totalQty,
    };
}
