// To parse this JSON data, do
//
//     final getLatestTripDataLite = getLatestTripDataLiteFromJson(jsonString);

import 'dart:convert';

GetLatestTripDataLite getLatestTripDataLiteFromJson(String str) =>
    GetLatestTripDataLite.fromJson(json.decode(str));

String getLatestTripDataLiteToJson(GetLatestTripDataLite data) =>
    json.encode(data.toJson());

class GetLatestTripDataLite {
  GetLatestTripDataLite({
    required this.id,
    required this.accountId,
    this.accountName,
    required this.routeId,
    required this.routeName,
    required this.originLocation,
    required this.destinationLocation,
    required this.startTime,
    required this.endTime,
    required this.vehicleId,
    required this.vehicleCode,
    required this.driver,
    required this.driverHelper,
    this.supervisor,
    required this.userLoginTime,
    required this.actualStartTime,
    required this.actualEndTime,
    required this.startOdoMeterReading,
    required this.endOdoMeterReading,
    required this.tripStatus,
    required this.tripStatusText,
    required this.isAssetUndermaintenance,
    required this.createdByEntityId,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.createdByEntity,
    this.dbOperation,
  });

  String id = "";
  String accountId = "";
  dynamic accountName;
  String routeId = "";
  String routeName = "";
  String originLocation = "";
  String destinationLocation = "";
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  String vehicleId = "";
  String vehicleCode = "";
  Driver driver = Driver(code: "", fullName: "");

  DriverHelper? driverHelper;
  dynamic supervisor;
  DateTime userLoginTime = DateTime.now();
  DateTime actualStartTime = DateTime.now();
  DateTime actualEndTime = DateTime.now();
  int startOdoMeterReading = 0;
  int endOdoMeterReading = 0;
  int tripStatus = 0;
  String tripStatusText = "";
  bool isAssetUndermaintenance = false;
  String tripType = "";
  int createdByEntityId = 0;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic createdByEntity;
  dynamic dbOperation;

  GetLatestTripDataLite.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    accountId = json["accountId"] ?? "";
    accountName = json["accountName"];
    routeId = json["routeId"] ?? "";
    routeName = json["routeName"] ?? "";
    originLocation = json["originLocation"] ?? "";
    destinationLocation = json["destinationLocation"] ?? "";
    startTime = DateTime.parse(json["startTime"]);
    endTime = DateTime.parse(json["endTime"]);
    vehicleId = json["vehicleId"] ?? "";
    vehicleCode = json["vehicleCode"] ?? "";
    driver = json['driver'] != null
        ? Driver.fromJson(json["driver"])
        : Driver(code: "", fullName: "");
    driverHelper = json['driverHelper'] != null
        ? DriverHelper.fromJson(json['driverHelper'])
        : DriverHelper(code: "", fullName: "");
    supervisor = json['supervisor'];
    userLoginTime = DateTime.parse(json["userLoginTime"]);
    actualStartTime = DateTime.parse(json["actualStartTime"]);
    actualEndTime = DateTime.parse(json["actualEndTime"]);
    startOdoMeterReading = json["startOdoMeterReading"] ?? 0;
    endOdoMeterReading = json["endOdoMeterReading"] ?? 0;
    tripStatus = json["tripStatus"] ?? 2;
    tripStatusText = json["tripStatusText"] ?? "";
    isAssetUndermaintenance = json["isAssetUndermaintenance"] ?? false;
    tripType = json["tripType"];
    createdByEntityId = json["createdByEntityId"] ?? 0;
    createdBy = json["createdBy"];
    createdDate = json["createdDate"];
    modifiedBy = json["modifiedBy"];
    modifiedDate = json["modifiedDate"];
    createdByEntity = json["createdByEntity"];
    dbOperation = json["dbOperation"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountId": accountId,
        "accountName": accountName,
        "routeId": routeId,
        "routeName": routeName,
        "originLocation": originLocation,
        "destinationLocation": destinationLocation,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "vehicleId": vehicleId,
        "vehicleCode": vehicleCode,
        "driver": driver.toJson(),
        "driverHelper": driverHelper == null ? null : driverHelper!.toJson(),
        "supervisor": supervisor,
        "userLoginTime": userLoginTime.toIso8601String(),
        "actualStartTime": actualStartTime.toIso8601String(),
        "actualEndTime": actualEndTime.toIso8601String(),
        "startOdoMeterReading": startOdoMeterReading,
        "endOdoMeterReading": endOdoMeterReading,
        "tripStatus": tripStatus,
        "tripStatusText": tripStatusText,
        "isAssetUndermaintenance": isAssetUndermaintenance,
        "tripType": tripType,
        "createdByEntityId": createdByEntityId,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "createdByEntity": createdByEntity,
        "dbOperation": dbOperation,
      };
}

class Driver {
  Driver({
    required this.code,
    this.email,
    this.phoneNumber,
    required this.fullName,
  });

  String code;
  dynamic email;
  dynamic phoneNumber;
  String fullName;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        code: json["code"] ?? "",
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        fullName: json["fullName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "email": email,
        "phoneNumber": phoneNumber,
        "fullName": fullName,
      };
}

class DriverHelper {
  DriverHelper({
    this.code,
    this.email,
    this.phoneNumber,
    this.fullName,
  });

  String? code;
  dynamic? email;
  dynamic? phoneNumber;
  String? fullName;

  factory DriverHelper.fromJson(Map<String, dynamic> json) => DriverHelper(
        code: json["code"],
        // email: json["email"],
        // phoneNumber: json["phoneNumber"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "email": email,
        "phoneNumber": phoneNumber,
        "fullName": fullName,
      };
}
