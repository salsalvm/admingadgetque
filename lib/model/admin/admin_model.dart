import 'package:meta/meta.dart';
import 'dart:convert';

AdminActions adminActionsFromJson(String str) =>
    AdminActions.fromJson(json.decode(str));

String adminActionsToJson(AdminActions data) => json.encode(data.toJson());

class AdminActions {
  AdminActions({
    required this.admin,
    required this.users,
  });

  bool? admin;
  List<User>? users;

  factory AdminActions.fromJson(Map<String, dynamic> json) => AdminActions(
        admin: json["admin"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.mobile,
    required this.emailaddress,
    required this.password,
    required this.userBlocked,
    required this.address,
    required this.wallet,
    required this.referedBy,
    required this.refer,
    required this.confirmPass,
  });

  String? id;
  String? name;
  String? mobile;
  String? emailaddress;
  String? password;
  bool? userBlocked;
  List<Address>? address;
  int? wallet;
  String? referedBy;
  String? refer;
  String? confirmPass;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["Name"],
        mobile: json["Mobile"],
        emailaddress: json["Emailaddress"],
        password: json["Password"],
        userBlocked: json["userBlocked"] == null ? null : json["userBlocked"],
        address: json["address"] == null
            ? null
            : List<Address>.from(
                json["address"].map((x) => Address.fromJson(x))),
        wallet: json["wallet"] == null ? null : json["wallet"],
        referedBy: json["referedBy"] == null ? null : json["referedBy"],
        refer: json["refer"] == null ? null : json["refer"],
        confirmPass: json["confirmPass"] == null ? null : json["confirmPass"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Mobile": mobile,
        "Emailaddress": emailaddress,
        "Password": password,
        "userBlocked": userBlocked == null ? null : userBlocked,
        "address": address == null
            ? null
            : List<dynamic>.from(address!.map((x) => x.toJson())),
        "wallet": wallet == null ? null : wallet,
        "referedBy": referedBy == null ? null : referedBy,
        "refer": refer == null ? null : refer,
        "confirmPass": confirmPass == null ? null : confirmPass,
      };
}

class Address {
  Address({
    required this.addressId,
    required this.name,
    required this.mobile,
    required this.address,
    required this.type,
    required this.pincode,
  });

  String addressId;
  String name;
  String mobile;
  String address;
  String type;
  String pincode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressId: json["addressId"],
        name: json["name"],
        mobile: json["mobile"],
        address: json["address"],
        type: json["type"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "name": name,
        "mobile": mobile,
        "address": address,
        "type": type,
        "pincode": pincode,
      };
}
