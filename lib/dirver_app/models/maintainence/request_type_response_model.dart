// To parse this JSON data, do
//
//     final requestTypeResponseModel = requestTypeResponseModelFromJson(jsonString);

import 'dart:convert';

List<RequestTypeResponseModel> requestTypeResponseModelFromJson(String str) =>
    List<RequestTypeResponseModel>.from(
        json.decode(str).map((x) => RequestTypeResponseModel.fromJson(x)));

String requestTypeResponseModelToJson(List<RequestTypeResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestTypeResponseModel {
  RequestTypeResponseModel({
    required this.key,
    required this.value,
  });

  String key = "IN";
  String value = "INTERNAL";

  factory RequestTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      RequestTypeResponseModel(
        key: json["key"] ?? "IN",
        value: json["value"] ?? "INTERNAL",
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
