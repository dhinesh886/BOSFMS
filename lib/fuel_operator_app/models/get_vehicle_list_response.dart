// To parse this JSON data, do
//
//     final getVehicleList = getVehicleListFromJson(jsonString);

import 'dart:convert';

List<GetVehicleList> getVehicleListFromJson(String str) =>
    List<GetVehicleList>.from(
        json.decode(str).map((x) => GetVehicleList.fromJson(x)));

String getVehicleListToJson(List<GetVehicleList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetVehicleList {
  GetVehicleList({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory GetVehicleList.fromJson(Map<String, dynamic> json) => GetVehicleList(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
