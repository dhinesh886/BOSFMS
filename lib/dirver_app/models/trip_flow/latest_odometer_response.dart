import 'dart:convert';

LatestOdometerResponse latestOdometerResponseFromJson(String str) =>
    LatestOdometerResponse.fromJson(json.decode(str));

String latestOdometerResponseToJson(LatestOdometerResponse data) =>
    json.encode(data.toJson());

class LatestOdometerResponse {
  LatestOdometerResponse();

  // String code = "";
  // String id = "";
  // String assetNo = "";
  // String invoiceNo = "";
  // String invoiceSlno = "";
  // String assetSerial = "";
  // String description = "";
  // String referenceNo = "";
  // String manufacturer = "";
  // String yearofMake = "";
  // String capacity = "";
  // String accountName = "";
  // String accunntBranch = "";
  // String driverName = "";
  // String driver = "";
  // String depot = "";
  // DateTime lastTripCompletedDate = DateTime.now();
  int lastOdometerRecorded = 0;
  // DateTime nextServiceDue = DateTime.now();
  // String warranties = "";
  // String documents = "";
  // int noOfTrips = 0;
  // double fuelEconomy = 0.0;
  // String assetType = "";
  // String vehicleType = "";
  // String vehicleTypeDesp = "";
  // String category = "";
  // String categoryDesp = "";
  // String engineNo = "";
  // String chassisNo = "";
  // String modelasperRc = "";
  // String acNonAc = "";
  // String bodyCapacity = "";
  // String wheelBase = "";
  // DateTime dateofReg = DateTime.now();
  // List<HumanResource> humanResources = [];
  // String make = "";
  // String madeBy = "";
  // String insuranceDue = "";
  // String permitRenewal = "";
  // String emissioncheckDate = "";
  // int createdByEntityId = 0;
  // String createdBy = "";
  // String createdDate = "";
  // String modifiedBy = "";
  // String modifiedDate = "";
  // String createdByEntity = "";
  // String dbOperation = "";

  LatestOdometerResponse.fromJson(Map<String, dynamic> json) {
    // code = json["code"] ?? "";
    // id = json["id"] ?? "";
    // assetNo = json["assetNo"] ?? "";
    // invoiceNo = json["invoiceNo"] ?? "";
    // invoiceSlno = json["invoiceSlno"] ?? "";
    // assetSerial = json["assetSerial"] ?? "";
    // description = json["description"] ?? "";
    // referenceNo = json["referenceNo"] ?? "";
    // manufacturer = json["manufacturer"] ?? "";
    // yearofMake = json["yearofMake"] ?? "";
    // capacity = json["capacity"] ?? "";
    // accountName = json["accountName"] ?? "";
    // accunntBranch = json["accunntBranch"] ?? "";
    // driverName = json["driverName"] ?? "";
    // driver = json["driver"] ?? "";
    // depot = json["depot"] ?? "";
    // lastTripCompletedDate = DateTime.parse(json["lastTripCompletedDate"]);
    lastOdometerRecorded = json["lastOdometerRecorded"] ?? 0;
    // nextServiceDue = DateTime.parse(json["nextServiceDue"]);
    // warranties = json["warranties"] ?? "";
    // documents = json["documents"] ?? "";
    // noOfTrips = json["noOfTrips"] ?? 0;
    // fuelEconomy = json["fuelEconomy"] ?? 0;
    // assetType = json["assetType"] ?? "";
    // vehicleType = json["vehicleType"] ?? "";
    // vehicleTypeDesp = json["vehicleTypeDesp"] ?? "";
    // category = json["category"] ?? "";
    // categoryDesp = json["categoryDesp"] ?? "";
    // engineNo = json["engineNo"] ?? "";
    // chassisNo = json["chassisNo"] ?? "";
    // modelasperRc = json["modelasperRC"] ?? "";
    // acNonAc = json["acNonAC"] ?? "";
    // bodyCapacity = json["bodyCapacity"] ?? "";
    // wheelBase = json["wheelBase"] ?? "";
    // dateofReg = DateTime.parse(json["dateofReg"]);
    // humanResources = List<HumanResource>.from(
    //     json["humanResources"].map((x) => HumanResource.fromJson(x)));
    // make = json["make"] ?? "";
    // madeBy = json["madeBy"] ?? "";
    // insuranceDue = json["insuranceDue"] ?? "";
    // permitRenewal = json["permitRenewal"] ?? "";
    // emissioncheckDate = json["emissioncheckDate"] ?? "";
    // createdByEntityId = json["createdByEntityId"] ?? 0;
    // createdBy = json["createdBy"] ?? "";
    // createdDate = json["createdDate"] ?? "";
    // modifiedBy = json["modifiedBy"] ?? "";
    // modifiedDate = json["modifiedDate"] ?? "";
    // createdByEntity = json["createdByEntity"] ?? "";
    // dbOperation = json["dbOperation"] ?? "";
  }

  Map<String, dynamic> toJson() => {
        // "code": code,
        // "id": id,
        // "assetNo": assetNo,
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
    required this.personId,
    required this.resource,
  });

  int slno;
  int sourceId;
  String personId;
  Resource resource;

  factory HumanResource.fromJson(Map<String, dynamic> json) => HumanResource(
        slno: json["slno"] ?? 0,
        sourceId: json["sourceId"] ?? 0,
        personId: json["personId"] ?? "",
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
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.userId,
    required this.user,
    required this.code,
    required this.designationCode,
    required this.designation,
    required this.resourceId,
    required this.fullName,
    required this.defaultLink,
    required this.avator,
    required this.documents,
    required this.dbOperation,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String address;
  String userId;
  String user;
  String code;
  String designationCode;
  String designation;
  String resourceId;
  String fullName;
  String defaultLink;
  String avator;
  String documents;
  String dbOperation;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        id: json["id"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        email: json["email"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        address: json["address"] ?? "",
        userId: json["userId"] ?? "",
        user: json["user"] ?? "",
        code: json["code"] ?? "",
        designationCode: json["designationCode"] ?? "",
        designation: json["designation"] ?? "",
        resourceId: json["resourceId"] ?? "",
        fullName: json["fullName"] ?? "",
        defaultLink: json["defaultLink"] ?? "",
        avator: json["avator"] ?? "",
        documents: json["documents"] ?? "",
        dbOperation: json["dbOperation"] ?? "",
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
