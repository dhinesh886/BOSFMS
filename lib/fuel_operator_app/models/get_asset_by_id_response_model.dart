// To parse this JSON data, do
//
//     final getAssetByIdResponseModel = getAssetByIdResponseModelFromJson(jsonString);

import 'dart:convert';

GetAssetByIdResponseModel getAssetByIdResponseModelFromJson(String str) =>
    GetAssetByIdResponseModel.fromJson(json.decode(str));

String getAssetByIdResponseModelToJson(GetAssetByIdResponseModel data) =>
    json.encode(data.toJson());

class GetAssetByIdResponseModel {
  GetAssetByIdResponseModel({
    required this.code,
    required this.id,
    required this.assetNo,
    // required this.invoiceNo,
    // required this.invoiceSlno,
    // required this.assetSerial,
    // this.description,
    // this.referenceNo,
    // required this.manufacturer,
    // this.yearofMake,
    // required this.capacity,
    // this.accountName,
    // this.accunntBranch,
    // this.driverName,
    // this.driver,
    // this.depot,
    // required this.lastTripCompletedDate,
    required this.lastOdometerRecorded,
    // required this.nextServiceDue,
    // this.warranties,
    // this.documents,
    // required this.noOfTrips,
    // required this.fuelEconomy,
    // required this.assetType,
    // required this.vehicleType,
    // required this.vehicleTypeDesp,
    // required this.category,
    // required this.categoryDesp,
    // required this.engineNo,
    // required this.chassisNo,
    // required this.modelasperRc,
    // required this.acNonAc,
    // required this.bodyCapacity,
    // this.wheelBase,
    // required this.dateofReg,
    // required this.humanResources,
    // this.make,
    // this.madeBy,
    // this.insuranceDue,
    // this.permitRenewal,
    // this.emissioncheckDate,
    // required this.createdByEntityId,
    // this.createdBy,
    // this.createdDate,
    // this.modifiedBy,
    // this.modifiedDate,
    // this.createdByEntity,
    // this.dbOperation,
  });

  String code;
  String id;
  String assetNo;
  // String invoiceNo;
  // String invoiceSlno;
  // String assetSerial;
  // dynamic description;
  // dynamic referenceNo;
  // String manufacturer;
  // dynamic yearofMake;
  // String capacity;
  // dynamic accountName;
  // dynamic accunntBranch;
  // dynamic driverName;
  // dynamic driver;
  // dynamic depot;
  // DateTime lastTripCompletedDate;
  int lastOdometerRecorded;
  // DateTime nextServiceDue;
  // dynamic warranties;
  // dynamic documents;
  // int noOfTrips;
  // int fuelEconomy;
  // String assetType;
  // String vehicleType;
  // String vehicleTypeDesp;
  // String category;
  // String categoryDesp;
  // String engineNo;
  // String chassisNo;
  // String modelasperRc;
  // String acNonAc;
  // String bodyCapacity;
  // dynamic wheelBase;
  // DateTime dateofReg;
  // List<HumanResource> humanResources;
  // dynamic make;
  // dynamic madeBy;
  // dynamic insuranceDue;
  // dynamic permitRenewal;
  // dynamic emissioncheckDate;
  // int createdByEntityId;
  // dynamic createdBy;
  // dynamic createdDate;
  // dynamic modifiedBy;
  // dynamic modifiedDate;
  // dynamic createdByEntity;
  // dynamic dbOperation;

  factory GetAssetByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAssetByIdResponseModel(
        code: json["code"] ?? "",
        id: json["id"] ?? "",
        assetNo: json["assetNo"] ?? "",
        // invoiceNo: json["invoiceNo"],
        // invoiceSlno: json["invoiceSlno"],
        // assetSerial: json["assetSerial"],
        // description: json["description"],
        // referenceNo: json["referenceNo"],
        // manufacturer: json["manufacturer"],
        // yearofMake: json["yearofMake"],
        // capacity: json["capacity"],
        // accountName: json["accountName"],
        // accunntBranch: json["accunntBranch"],
        // driverName: json["driverName"],
        // driver: json["driver"],
        // depot: json["depot"],
        // lastTripCompletedDate: DateTime.parse(json["lastTripCompletedDate"]),
        lastOdometerRecorded: json["lastOdometerRecorded"] ?? 0,
        // nextServiceDue: DateTime.parse(json["nextServiceDue"]),
        // warranties: json["warranties"],
        // documents: json["documents"],
        // noOfTrips: json["noOfTrips"],
        // fuelEconomy: json["fuelEconomy"],
        // assetType: json["assetType"],
        // vehicleType: json["vehicleType"],
        // vehicleTypeDesp: json["vehicleTypeDesp"],
        // category: json["category"],
        // categoryDesp: json["categoryDesp"],
        // engineNo: json["engineNo"],
        // chassisNo: json["chassisNo"],
        // modelasperRc: json["modelasperRC"],
        // acNonAc: json["acNonAC"],
        // bodyCapacity: json["bodyCapacity"],
        // wheelBase: json["wheelBase"],
        // dateofReg: DateTime.parse(json["dateofReg"]),
        // humanResources: List<HumanResource>.from(
        //     json["humanResources"].map((x) => HumanResource.fromJson(x))),
        // make: json["make"],
        // madeBy: json["madeBy"],
        // insuranceDue: json["insuranceDue"],
        // permitRenewal: json["permitRenewal"],
        // emissioncheckDate: json["emissioncheckDate"],
        // createdByEntityId: json["createdByEntityId"],
        // createdBy: json["createdBy"],
        // createdDate: json["createdDate"],
        // modifiedBy: json["modifiedBy"],
        // modifiedDate: json["modifiedDate"],
        // createdByEntity: json["createdByEntity"],
        // dbOperation: json["dbOperation"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "id": id,
        "assetNo": assetNo,
        // "invoiceNo": invoiceNo,
        // "invoiceSlno": invoiceSlno,
        // "assetSerial": assetSerial,
        // "description": description,
        // "referenceNo": referenceNo,
        // "manufacturer": manufacturer,
        // "yearofMake": yearofMake,
        // "capacity": capacity,
        // "accountName": accountName,
        // "accunntBranch": accunntBranch,
        // "driverName": driverName,
        // "driver": driver,
        // "depot": depot,
        // "lastTripCompletedDate": lastTripCompletedDate.toIso8601String(),
        "lastOdometerRecorded": lastOdometerRecorded,
        // "nextServiceDue": nextServiceDue.toIso8601String(),
        // "warranties": warranties,
        // "documents": documents,
        // "noOfTrips": noOfTrips,
        // "fuelEconomy": fuelEconomy,
        // "assetType": assetType,
        // "vehicleType": vehicleType,
        // "vehicleTypeDesp": vehicleTypeDesp,
        // "category": category,
        // "categoryDesp": categoryDesp,
        // "engineNo": engineNo,
        // "chassisNo": chassisNo,
        // "modelasperRC": modelasperRc,
        // "acNonAC": acNonAc,
        // "bodyCapacity": bodyCapacity,
        // "wheelBase": wheelBase,
        // "dateofReg": dateofReg.toIso8601String(),
        // "humanResources":
        //     List<dynamic>.from(humanResources.map((x) => x.toJson())),
        // "make": make,
        // "madeBy": madeBy,
        // "insuranceDue": insuranceDue,
        // "permitRenewal": permitRenewal,
        // "emissioncheckDate": emissioncheckDate,
        // "createdByEntityId": createdByEntityId,
        // "createdBy": createdBy,
        // "createdDate": createdDate,
        // "modifiedBy": modifiedBy,
        // "modifiedDate": modifiedDate,
        // "createdByEntity": createdByEntity,
        // "dbOperation": dbOperation,
      };
}

class HumanResource {
  HumanResource({
    required this.slno,
    required this.sourceId,
    this.personId,
    required this.resource,
  });

  int slno;
  int sourceId;
  dynamic personId;
  Resource resource;

  factory HumanResource.fromJson(Map<String, dynamic> json) => HumanResource(
        slno: json["slno"],
        sourceId: json["sourceId"],
        personId: json["personId"],
        resource: Resource.fromJson(json["resource"]),
      );

  Map<String, dynamic> toJson() => {
        "slno": slno,
        "sourceId": sourceId,
        "personId": personId,
        "resource": resource.toJson(),
      };
}

class Resource {
  Resource({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.address,
    this.userId,
    this.user,
    required this.code,
    this.designationCode,
    this.designation,
    this.resourceId,
    this.fullName,
    this.defaultLink,
    this.avator,
    this.documents,
    this.dbOperation,
  });

  String id;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic phoneNumber;
  dynamic address;
  dynamic userId;
  dynamic user;
  String code;
  dynamic designationCode;
  dynamic designation;
  dynamic resourceId;
  dynamic fullName;
  dynamic defaultLink;
  dynamic avator;
  dynamic documents;
  dynamic dbOperation;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        userId: json["userId"],
        user: json["user"],
        code: json["code"],
        designationCode: json["designationCode"],
        designation: json["designation"],
        resourceId: json["resourceId"],
        fullName: json["fullName"],
        defaultLink: json["defaultLink"],
        avator: json["avator"],
        documents: json["documents"],
        dbOperation: json["dbOperation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "userId": userId,
        "user": user,
        "code": code,
        "designationCode": designationCode,
        "designation": designation,
        "resourceId": resourceId,
        "fullName": fullName,
        "defaultLink": defaultLink,
        "avator": avator,
        "documents": documents,
        "dbOperation": dbOperation,
      };
}
