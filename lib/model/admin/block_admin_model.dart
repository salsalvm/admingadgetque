import 'dart:convert';

BlockAdminActions blockAdminActionsFromJson(String str) =>
    BlockAdminActions.fromJson(json.decode(str));

String blockAdminActionsToJson(BlockAdminActions data) =>
    json.encode(data.toJson());

class BlockAdminActions {
  BlockAdminActions({
    required this.status,
  });

  bool status;

  factory BlockAdminActions.fromJson(Map<String, dynamic> json) =>
      BlockAdminActions(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
