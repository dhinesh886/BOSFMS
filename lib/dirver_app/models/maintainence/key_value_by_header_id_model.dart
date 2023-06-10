import 'dart:convert';

List<KeyValueByHeaderIdModel> keyValueByHeaderIdModelFromJson(String str) =>
    List<KeyValueByHeaderIdModel>.from(
        json.decode(str).map((x) => KeyValueByHeaderIdModel.fromJson(x)));

String keyValueByHeaderIdModelToJson(List<KeyValueByHeaderIdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KeyValueByHeaderIdModel {
  KeyValueByHeaderIdModel({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory KeyValueByHeaderIdModel.fromJson(Map<String, dynamic> json) =>
      KeyValueByHeaderIdModel(
        key: json["key"] ?? "",
        value: json["value"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
