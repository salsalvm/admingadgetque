import 'dart:convert';

DeleteAdminActions deleteAdminActionsFromJson(String str) => DeleteAdminActions.fromJson(json.decode(str));

String deleteAdminActionsToJson(DeleteAdminActions data) => json.encode(data.toJson());

class DeleteAdminActions {
    DeleteAdminActions({
        required this.acknowledged,
        required this.deletedCount,
    });

    bool acknowledged;
    int deletedCount;

    factory DeleteAdminActions.fromJson(Map<String, dynamic> json) => DeleteAdminActions(
        acknowledged: json["acknowledged"],
        deletedCount: json["deletedCount"],
    );

    Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "deletedCount": deletedCount,
    };
}
