// To parse this JSON data, do
//
//     final userListByRoleResponse = userListByRoleResponseFromJson(jsonString);

import 'dart:convert';

List<UserListByRoleResponse> userListByRoleResponseFromJson(String str) =>
    List<UserListByRoleResponse>.from(
        json.decode(str).map((x) => UserListByRoleResponse.fromJson(x)));

String userListByRoleResponseToJson(List<UserListByRoleResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListByRoleResponse {
  UserListByRoleResponse({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory UserListByRoleResponse.fromJson(Map<String, dynamic> json) =>
      UserListByRoleResponse(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
