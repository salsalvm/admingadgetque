import 'dart:convert';

UnBlockAdminActions unBlockAdminActionsFromJson(String str) => UnBlockAdminActions.fromJson(json.decode(str));

String unBlockAdminActionsToJson(UnBlockAdminActions data) => json.encode(data.toJson());

class UnBlockAdminActions {
    UnBlockAdminActions({
        required this.status,
    });

    bool status;

    factory UnBlockAdminActions.fromJson(Map<String, dynamic> json) => UnBlockAdminActions(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
