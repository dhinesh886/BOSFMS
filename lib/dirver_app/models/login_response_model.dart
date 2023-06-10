// To parse this JSON data, do
//
//     final LoginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    // required this.dbOperation,
    required this.id,
    required this.userName,
    required this.email,
    // required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    // required this.fullName,
    // required this.dob,
    // required this.gender,
    // required this.avatar,
    // required this.address,
    // required this.city,
    // required this.state,
    // required this.country,
    // required this.zip,
    // required this.additionalDetails,
    required this.token,
    required this.rolesAsString,
    // required this.roles,
    required this.apiBaseUrl,
    // required this.defaultLink,
    // required this.avator,
    required this.userCode,
  });

  // String dbOperation;
  int id;
  String userName;
  String email;
  // String phoneNumber;
  String firstName;
  String lastName;
  // String fullName;
  // DateTime dob;
  // String gender;
  // String avatar;
  // String address;
  // String city;
  // int state;
  // int country;
  // String zip;
  // String additionalDetails;
  String token;
  List<String> rolesAsString;
  // List<Role> roles;
  String apiBaseUrl;
  // String defaultLink;
  // String avator;
  String userCode;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        // dbOperation: json["dbOperation"],
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        // phoneNumber: json["phoneNumber"],
        firstName: json["firstName"] ?? "Guest",
        lastName: json["lastName"] ?? "",
        // fullName: json["fullName"],
        // dob: DateTime.parse(json["dob"]),
        // gender: json["gender"],
        // avatar: json["avatar"],
        // address: json["address"],
        // city: json["city"],
        // state: json["state"],
        // country: json["country"],
        // zip: json["zip"],
        // additionalDetails: json["additionalDetails"],
        token: json["token"],
        rolesAsString: List<String>.from(json["rolesAsString"].map((x) => x)),
        // roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        apiBaseUrl: json["apiBaseUrl"],
        // defaultLink: json["defaultLink"],
        // avator: json["avator"],
        userCode: json["userCode"],
      );

  Map<String, dynamic> toJson() => {
        // "dbOperation": dbOperation,
        "id": id,
        "userName": userName,
        "email": email,
        // "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
        // "fullName": fullName,
        // "dob": dob.toIso8601String(),
        // "gender": gender,
        // "avatar": avatar,
        // "address": address,
        // "city": city,
        // "state": state,
        // "country": country,
        // "zip": zip,
        // "additionalDetails": additionalDetails,
        "token": token,
        // "rolesAsString": List<dynamic>.from(rolesAsString.map((x) => x)),
        // "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        // "defaultLink": defaultLink,
        // "avator": avator,
        "userCode": userCode,
      };
}

class Role {
  Role({
    required this.dbOperation,
    required this.userId,
    required this.roleId,
    required this.name,
  });

  String dbOperation;
  int userId;
  int roleId;
  String name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        dbOperation: json["dbOperation"],
        userId: json["userId"],
        roleId: json["roleId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "dbOperation": dbOperation,
        "userId": userId,
        "roleId": roleId,
        "name": name,
      };
}
