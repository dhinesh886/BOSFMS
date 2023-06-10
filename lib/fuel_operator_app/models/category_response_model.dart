// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'dart:convert';

List<CategoryResponseModel> categoryResponseModelFromJson(String str) =>
    List<CategoryResponseModel>.from(
        json.decode(str).map((x) => CategoryResponseModel.fromJson(x)));

String categoryResponseModelToJson(List<CategoryResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponseModel {
  CategoryResponseModel({
    required this.productNo,
    required this.description,
    // required this.unit1,
    // required this.unit2,
    // required this.costPrice,
    // required this.salePrice,
  });

  String productNo;
  String description;
  // String unit1;
  // String unit2;
  // int costPrice;
  // int salePrice;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        productNo: json["productNo"],
        description: json["description"],
        // unit1: json["unit1"],
        // unit2: json["unit2"],
        // costPrice: json["costPrice"],
        // salePrice: json["salePrice"],
      );

  Map<String, dynamic> toJson() => {
        "productNo": productNo,
        "description": description,
        // "unit1": unit1,
        // "unit2": unit2,
        // "costPrice": costPrice,
        // "salePrice": salePrice,
      };
}
