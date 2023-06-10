// To parse this JSON data, do
//
//     final getAssociatedAsset = getAssociatedAssetFromJson(jsonString);

import 'dart:convert';

List<GetAssociatedAsset> getAssociatedAssetFromJson(String str) =>
    List<GetAssociatedAsset>.from(
        json.decode(str).map((x) => GetAssociatedAsset.fromJson(x)));

String getAssociatedAssetToJson(List<GetAssociatedAsset> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAssociatedAsset {
  GetAssociatedAsset({
    required this.code,
    required this.id,
    required this.assetNo,
    // this.invoiceNo,
    // this.invoiceSlno,
    // this.assetSerial,
    // required this.description,
    // this.referenceNo,
    // this.manufacturer,
    // this.yearofMake,
    // required this.capacity,
    // this.accountName,
    // this.accunntBranch,
    // required this.driverName,
    // this.driver,
    // this.depot,
    // required this.lastTripCompletedDate,
    required this.lastOdometerRecorded,
    // required this.nextServiceDue,
    // this.warranties,
    // this.documents,
    // required this.noOfTrips,
    // required this.fuelEconomy,
    // this.assetType,
    // this.vehicleType,
    // this.vehicleTypeDesp,
    // this.category,
    // this.categoryDesp,
    // this.engineNo,
    // this.chassisNo,
    // this.modelasperRc,
    // this.acNonAc,
    // this.bodyCapacity,
    // this.wheelBase,
    // this.dateofReg,
    // this.humanResources,
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
  // dynamic invoiceNo;
  // dynamic invoiceSlno;
  // dynamic assetSerial;
  // String description;
  // dynamic referenceNo;
  // dynamic manufacturer;
  // dynamic yearofMake;
  // String capacity;
  // dynamic accountName;
  // dynamic accunntBranch;
  // String driverName;
  // dynamic driver;
  // dynamic depot;
  // DateTime lastTripCompletedDate;
  int lastOdometerRecorded;
  // DateTime nextServiceDue;
  // dynamic warranties;
  // dynamic documents;
  // int noOfTrips;
  // int fuelEconomy;
  // dynamic assetType;
  // dynamic vehicleType;
  // dynamic vehicleTypeDesp;
  // dynamic category;
  // dynamic categoryDesp;
  // dynamic engineNo;
  // dynamic chassisNo;
  // dynamic modelasperRc;
  // dynamic acNonAc;
  // dynamic bodyCapacity;
  // dynamic wheelBase;
  // dynamic dateofReg;
  // dynamic humanResources;
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

  factory GetAssociatedAsset.fromJson(Map<String, dynamic> json) =>
      GetAssociatedAsset(
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
        // dateofReg: json["dateofReg"],
        // humanResources: json["humanResources"],
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
        // "dateofReg": dateofReg,
        // "humanResources": humanResources,
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
