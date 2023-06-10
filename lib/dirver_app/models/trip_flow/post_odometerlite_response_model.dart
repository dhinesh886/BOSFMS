// To parse this JSON data, do
//
//     final postOdometerLiteResponseModel = postOdometerLiteResponseModelFromJson(jsonString);

import 'dart:convert';

PostOdometerLiteResponseModel postOdometerLiteResponseModelFromJson(
        String str) =>
    PostOdometerLiteResponseModel.fromJson(json.decode(str));

String postOdometerLiteResponseModelToJson(
        PostOdometerLiteResponseModel data) =>
    json.encode(data.toJson());

class PostOdometerLiteResponseModel {
  bool status;
  // dynamic txnNumber;
  String message;
  // dynamic error;

  PostOdometerLiteResponseModel({
    required this.status,
    // this.txnNumber,
    required this.message,
    // this.error,
  });

  factory PostOdometerLiteResponseModel.fromJson(Map<String, dynamic> json) =>
      PostOdometerLiteResponseModel(
        status: json["status"],
        // txnNumber: json["txnNumber"],
        message: json["message"],
        // error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        // "txnNumber": txnNumber,
        "message": message,
        // "error": error,
      };
}
