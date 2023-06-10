// To parse this JSON data, do
//
//     final getServiceTicketByIdResponseModel = getServiceTicketByIdResponseModelFromJson(jsonString);

import 'dart:convert';

GetServiceTicketByIdResponseModel getServiceTicketByIdResponseModelFromJson(
        String str) =>
    GetServiceTicketByIdResponseModel.fromJson(json.decode(str));

String getServiceTicketByIdResponseModelToJson(
        GetServiceTicketByIdResponseModel data) =>
    json.encode(data.toJson());

class GetServiceTicketByIdResponseModel {
  GetServiceTicketByIdResponseModel({
    required this.id,
    required this.accountId,
    required this.accountAddressId,
    required this.account,
    this.accountAddress,
    required this.assetNo,
    required this.asset,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.requestTypeId,
    required this.subCategoryId,
    this.seviorityId,
    required this.priorityId,
    required this.statusId,
    required this.remarks,
    required this.costApprovalRequired,
    required this.odometerReading,
    required this.serviceExecutiveId,
    required this.serviceExecutive,
    required this.category,
    required this.subCategory,
    required this.requestType,
    this.seviority,
    this.priority,
    required this.status,
    this.serviceTicketDocuments,
    this.serviceTicketComments,
    required this.serviceTicketDetails,
    required this.nextTrip,
    required this.previousOdometerReading,
    required this.fuelEconomy,
    required this.createdByEntityId,
    required this.createdBy,
    required this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    required this.createdByEntity,
    this.dbOperation,
  });

  String id;
  String accountId;
  String accountAddressId;
  Account account;
  dynamic accountAddress;
  String assetNo;
  Asset asset;
  String title;
  String description;
  String categoryId;
  String requestTypeId;
  String subCategoryId;
  dynamic seviorityId;
  String priorityId;
  String statusId;
  String remarks;
  bool costApprovalRequired;
  int odometerReading;
  String serviceExecutiveId;
  Map<String, String?> serviceExecutive;
  Category category;
  Category subCategory;
  Category requestType;
  dynamic seviority;
  dynamic priority;
  Category status;
  dynamic serviceTicketDocuments;
  dynamic serviceTicketComments;
  List<ServiceTicketDetail>? serviceTicketDetails;
  NextTrip nextTrip;
  int previousOdometerReading;
  double fuelEconomy;
  int createdByEntityId;
  String createdBy;
  DateTime createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  Map<String, String?> createdByEntity;
  dynamic dbOperation;

  factory GetServiceTicketByIdResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetServiceTicketByIdResponseModel(
        id: json["id"],
        accountId: json["accountId"],
        accountAddressId: json["accountAddressId"],
        account: Account.fromJson(json["account"]),
        accountAddress: json["accountAddress"],
        assetNo: json["assetNo"],
        asset: Asset.fromJson(json["asset"]),
        title: json["title"],
        description: json["description"],
        categoryId: json["categoryId"],
        requestTypeId: json["requestTypeId"],
        subCategoryId: json["subCategoryId"],
        seviorityId: json["seviorityId"],
        priorityId: json["priorityId"],
        statusId: json["statusId"],
        remarks: json["remarks"],
        costApprovalRequired: json["costApprovalRequired"],
        odometerReading: json["odometerReading"],
        serviceExecutiveId: json["serviceExecutiveId"],
        serviceExecutive: Map.from(json["serviceExecutive"])
            .map((k, v) => MapEntry<String, String?>(k, v)),
        category: Category.fromJson(json["category"]),
        subCategory: Category.fromJson(json["subCategory"]),
        requestType: Category.fromJson(json["requestType"]),
        seviority: json["seviority"],
        priority: json["priority"],
        status: Category.fromJson(json["status"]),
        serviceTicketDocuments: json["serviceTicketDocuments"],
        serviceTicketComments: json["serviceTicketComments"],
        serviceTicketDetails: json["serviceTicketDetails"] == null
            ? []
            : List<ServiceTicketDetail>.from(json["serviceTicketDetails"]
                .map((x) => ServiceTicketDetail.fromJson(x))),
        nextTrip: NextTrip.fromJson(json["nextTrip"]),
        previousOdometerReading: json["previousOdometerReading"],
        fuelEconomy: json["fuelEconomy"]?.toDouble(),
        createdByEntityId: json["createdByEntityId"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        createdByEntity: Map.from(json["createdByEntity"])
            .map((k, v) => MapEntry<String, String?>(k, v)),
        dbOperation: json["dbOperation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountId": accountId,
        "accountAddressId": accountAddressId,
        "account": account.toJson(),
        "accountAddress": accountAddress,
        "assetNo": assetNo,
        "asset": asset.toJson(),
        "title": title,
        "description": description,
        "categoryId": categoryId,
        "requestTypeId": requestTypeId,
        "subCategoryId": subCategoryId,
        "seviorityId": seviorityId,
        "priorityId": priorityId,
        "statusId": statusId,
        "remarks": remarks,
        "costApprovalRequired": costApprovalRequired,
        "odometerReading": odometerReading,
        "serviceExecutiveId": serviceExecutiveId,
        "serviceExecutive": Map.from(serviceExecutive)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "category": category.toJson(),
        "subCategory": subCategory.toJson(),
        "requestType": requestType.toJson(),
        "seviority": seviority,
        "priority": priority,
        "status": status.toJson(),
        "serviceTicketDocuments": serviceTicketDocuments,
        "serviceTicketComments": serviceTicketComments,
        "serviceTicketDetails":
            List<dynamic>.from(serviceTicketDetails!.map((x) => x.toJson())),
        "nextTrip": nextTrip.toJson(),
        "previousOdometerReading": previousOdometerReading,
        "fuelEconomy": fuelEconomy,
        "createdByEntityId": createdByEntityId,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "createdByEntity": Map.from(createdByEntity)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dbOperation": dbOperation,
      };
}

class Account {
  Account({
    required this.createdDate,
    required this.totalTrips,
    required this.totalTripsfortheMonth,
    required this.trafficIncident,
    required this.delayedTrips,
    required this.totalComplaints,
    required this.action,
    this.addresses,
    this.users,
    this.id,
    this.name,
    this.business,
    this.logo,
    required this.activeTill,
    this.additionalDetails,
    this.dbOperation,
  });

  DateTime createdDate;
  int totalTrips;
  int totalTripsfortheMonth;
  int trafficIncident;
  int delayedTrips;
  int totalComplaints;
  int action;
  dynamic addresses;
  dynamic users;
  String? id;
  String? name;
  dynamic business;
  dynamic logo;
  DateTime activeTill;
  dynamic additionalDetails;
  dynamic dbOperation;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        createdDate: DateTime.parse(json["createdDate"]),
        totalTrips: json["totalTrips"],
        totalTripsfortheMonth: json["totalTripsfortheMonth"],
        trafficIncident: json["trafficIncident"],
        delayedTrips: json["delayedTrips"],
        totalComplaints: json["totalComplaints"],
        action: json["action"],
        addresses: json["addresses"],
        users: json["users"],
        id: json["id"],
        name: json["name"],
        business: json["business"],
        logo: json["logo"],
        activeTill: DateTime.parse(json["activeTill"]),
        additionalDetails: json["additionalDetails"],
        dbOperation: json["dbOperation"],
      );

  Map<String, dynamic> toJson() => {
        "createdDate": createdDate.toIso8601String(),
        "totalTrips": totalTrips,
        "totalTripsfortheMonth": totalTripsfortheMonth,
        "trafficIncident": trafficIncident,
        "delayedTrips": delayedTrips,
        "totalComplaints": totalComplaints,
        "action": action,
        "addresses": addresses,
        "users": users,
        "id": id,
        "name": name,
        "business": business,
        "logo": logo,
        "activeTill": activeTill.toIso8601String(),
        "additionalDetails": additionalDetails,
        "dbOperation": dbOperation,
      };
}

class Asset {
  Asset({
    required this.code,
    required this.id,
    required this.assetNo,
    this.invoiceNo,
    this.invoiceSlno,
    this.assetSerial,
    this.description,
    this.referenceNo,
    this.manufacturer,
    this.yearofMake,
    this.capacity,
    this.accountName,
    this.accunntBranch,
    this.driverName,
    this.driver,
    required this.depot,
    required this.lastTripCompletedDate,
    required this.lastOdometerRecorded,
    required this.nextServiceDue,
    this.warranties,
    this.documents,
    required this.noOfTrips,
    required this.fuelEconomy,
    this.assetType,
    this.vehicleType,
    this.vehicleTypeDesp,
    this.category,
    this.categoryDesp,
    this.engineNo,
    this.chassisNo,
    this.modelasperRc,
    this.acNonAc,
    this.bodyCapacity,
    this.wheelBase,
    this.dateofReg,
    this.humanResources,
    this.make,
    this.madeBy,
    this.insuranceDue,
    this.permitRenewal,
    this.emissioncheckDate,
    required this.createdByEntityId,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.createdByEntity,
    this.dbOperation,
  });

  String code;
  String id;
  String assetNo;
  dynamic invoiceNo;
  dynamic invoiceSlno;
  dynamic assetSerial;
  dynamic description;
  dynamic referenceNo;
  dynamic manufacturer;
  dynamic yearofMake;
  dynamic capacity;
  dynamic accountName;
  dynamic accunntBranch;
  dynamic driverName;
  dynamic driver;
  Account depot;
  DateTime lastTripCompletedDate;
  int lastOdometerRecorded;
  DateTime nextServiceDue;
  dynamic warranties;
  dynamic documents;
  int noOfTrips;
  int fuelEconomy;
  dynamic assetType;
  dynamic vehicleType;
  dynamic vehicleTypeDesp;
  dynamic category;
  dynamic categoryDesp;
  dynamic engineNo;
  dynamic chassisNo;
  dynamic modelasperRc;
  dynamic acNonAc;
  dynamic bodyCapacity;
  dynamic wheelBase;
  dynamic dateofReg;
  dynamic humanResources;
  dynamic make;
  dynamic madeBy;
  dynamic insuranceDue;
  dynamic permitRenewal;
  dynamic emissioncheckDate;
  int createdByEntityId;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic createdByEntity;
  dynamic dbOperation;

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        code: json["code"],
        id: json["id"],
        assetNo: json["assetNo"],
        invoiceNo: json["invoiceNo"],
        invoiceSlno: json["invoiceSlno"],
        assetSerial: json["assetSerial"],
        description: json["description"],
        referenceNo: json["referenceNo"],
        manufacturer: json["manufacturer"],
        yearofMake: json["yearofMake"],
        capacity: json["capacity"],
        accountName: json["accountName"],
        accunntBranch: json["accunntBranch"],
        driverName: json["driverName"],
        driver: json["driver"],
        depot: Account.fromJson(json["depot"]),
        lastTripCompletedDate: DateTime.parse(json["lastTripCompletedDate"]),
        lastOdometerRecorded: json["lastOdometerRecorded"],
        nextServiceDue: DateTime.parse(json["nextServiceDue"]),
        warranties: json["warranties"],
        documents: json["documents"],
        noOfTrips: json["noOfTrips"],
        fuelEconomy: json["fuelEconomy"],
        assetType: json["assetType"],
        vehicleType: json["vehicleType"],
        vehicleTypeDesp: json["vehicleTypeDesp"],
        category: json["category"],
        categoryDesp: json["categoryDesp"],
        engineNo: json["engineNo"],
        chassisNo: json["chassisNo"],
        modelasperRc: json["modelasperRC"],
        acNonAc: json["acNonAC"],
        bodyCapacity: json["bodyCapacity"],
        wheelBase: json["wheelBase"],
        dateofReg: json["dateofReg"],
        humanResources: json["humanResources"],
        make: json["make"],
        madeBy: json["madeBy"],
        insuranceDue: json["insuranceDue"],
        permitRenewal: json["permitRenewal"],
        emissioncheckDate: json["emissioncheckDate"],
        createdByEntityId: json["createdByEntityId"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        createdByEntity: json["createdByEntity"],
        dbOperation: json["dbOperation"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "id": id,
        "assetNo": assetNo,
        "invoiceNo": invoiceNo,
        "invoiceSlno": invoiceSlno,
        "assetSerial": assetSerial,
        "description": description,
        "referenceNo": referenceNo,
        "manufacturer": manufacturer,
        "yearofMake": yearofMake,
        "capacity": capacity,
        "accountName": accountName,
        "accunntBranch": accunntBranch,
        "driverName": driverName,
        "driver": driver,
        "depot": depot.toJson(),
        "lastTripCompletedDate": lastTripCompletedDate.toIso8601String(),
        "lastOdometerRecorded": lastOdometerRecorded,
        "nextServiceDue": nextServiceDue.toIso8601String(),
        "warranties": warranties,
        "documents": documents,
        "noOfTrips": noOfTrips,
        "fuelEconomy": fuelEconomy,
        "assetType": assetType,
        "vehicleType": vehicleType,
        "vehicleTypeDesp": vehicleTypeDesp,
        "category": category,
        "categoryDesp": categoryDesp,
        "engineNo": engineNo,
        "chassisNo": chassisNo,
        "modelasperRC": modelasperRc,
        "acNonAC": acNonAc,
        "bodyCapacity": bodyCapacity,
        "wheelBase": wheelBase,
        "dateofReg": dateofReg,
        "humanResources": humanResources,
        "make": make,
        "madeBy": madeBy,
        "insuranceDue": insuranceDue,
        "permitRenewal": permitRenewal,
        "emissioncheckDate": emissioncheckDate,
        "createdByEntityId": createdByEntityId,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "createdByEntity": createdByEntity,
        "dbOperation": dbOperation,
      };
}

class Category {
  Category({
    this.type,
    this.code,
    this.sCode,
    this.slno,
    this.subScode,
    this.description,
    this.charTag1,
    this.charTag2,
    this.charTag3,
    this.charTag4,
    this.charTag5,
    this.remarks,
    this.remarks1,
    this.stkcatg,
    this.budAcc,
    required this.isDefault,
    required this.createdDate,
    required this.modifiedDate,
    required this.isSuspended,
    this.off,
    this.commonMasterHeader,
    this.dbOperation,
  });

  dynamic type;
  dynamic code;
  String? sCode;
  dynamic slno;
  dynamic subScode;
  String? description;
  dynamic charTag1;
  dynamic charTag2;
  dynamic charTag3;
  dynamic charTag4;
  dynamic charTag5;
  dynamic remarks;
  dynamic remarks1;
  dynamic stkcatg;
  dynamic budAcc;
  bool isDefault;
  DateTime createdDate;
  DateTime modifiedDate;
  bool isSuspended;
  dynamic off;
  dynamic commonMasterHeader;
  dynamic dbOperation;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        type: json["type"],
        code: json["code"],
        sCode: json["sCode"],
        slno: json["slno"],
        subScode: json["subScode"],
        description: json["description"],
        charTag1: json["charTag1"],
        charTag2: json["charTag2"],
        charTag3: json["charTag3"],
        charTag4: json["charTag4"],
        charTag5: json["charTag5"],
        remarks: json["remarks"],
        remarks1: json["remarks1"],
        stkcatg: json["stkcatg"],
        budAcc: json["bud_acc"],
        isDefault: json["isDefault"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        isSuspended: json["isSuspended"],
        off: json["off"],
        commonMasterHeader: json["commonMasterHeader"],
        dbOperation: json["dbOperation"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "code": code,
        "sCode": sCode,
        "slno": slno,
        "subScode": subScode,
        "description": description,
        "charTag1": charTag1,
        "charTag2": charTag2,
        "charTag3": charTag3,
        "charTag4": charTag4,
        "charTag5": charTag5,
        "remarks": remarks,
        "remarks1": remarks1,
        "stkcatg": stkcatg,
        "bud_acc": budAcc,
        "isDefault": isDefault,
        "createdDate": createdDate.toIso8601String(),
        "modifiedDate": modifiedDate.toIso8601String(),
        "isSuspended": isSuspended,
        "off": off,
        "commonMasterHeader": commonMasterHeader,
        "dbOperation": dbOperation,
      };
}

class NextTrip {
  NextTrip({
    this.id,
    this.code,
    this.accountId,
    this.accountAddressId,
    this.account,
    this.accountAddress,
    required this.tripPlanId,
    this.routeName,
    this.routeId,
    this.originLocation,
    this.destinationLocation,
    required this.startTime,
    required this.endTime,
    required this.userLoginTime,
    this.tarrifId,
    this.tarrifType,
    this.tarrifMode,
    required this.tarrifRate,
    this.vehicleId,
    this.vehicle,
    this.humanResources,
    this.actualStartTime,
    this.actualEndTime,
    required this.startOdoMeterReading,
    required this.endOdoMeterReading,
    required this.tripStatus,
    this.tripStatusText,
    required this.fuelEconomy,
    required this.isAssetUndermaintenance,
    required this.createdByEntityId,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.createdByEntity,
    this.dbOperation,
  });

  dynamic id;
  dynamic code;
  dynamic accountId;
  dynamic accountAddressId;
  dynamic account;
  dynamic accountAddress;
  int tripPlanId;
  dynamic routeName;
  dynamic routeId;
  dynamic originLocation;
  dynamic destinationLocation;
  DateTime startTime;
  DateTime endTime;
  DateTime userLoginTime;
  dynamic tarrifId;
  dynamic tarrifType;
  dynamic tarrifMode;
  int tarrifRate;
  dynamic vehicleId;
  dynamic vehicle;
  dynamic humanResources;
  dynamic actualStartTime;
  dynamic actualEndTime;
  int startOdoMeterReading;
  int endOdoMeterReading;
  int tripStatus;
  dynamic tripStatusText;
  int fuelEconomy;
  bool isAssetUndermaintenance;
  int createdByEntityId;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic createdByEntity;
  dynamic dbOperation;

  factory NextTrip.fromJson(Map<String, dynamic> json) => NextTrip(
        id: json["id"],
        code: json["code"],
        accountId: json["accountId"],
        accountAddressId: json["accountAddressId"],
        account: json["account"],
        accountAddress: json["accountAddress"],
        tripPlanId: json["tripPlanId"],
        routeName: json["routeName"],
        routeId: json["routeId"],
        originLocation: json["originLocation"],
        destinationLocation: json["destinationLocation"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        userLoginTime: DateTime.parse(json["userLoginTime"]),
        tarrifId: json["tarrifId"],
        tarrifType: json["tarrifType"],
        tarrifMode: json["tarrifMode"],
        tarrifRate: json["tarrifRate"],
        vehicleId: json["vehicleId"],
        vehicle: json["vehicle"],
        humanResources: json["humanResources"],
        actualStartTime: json["actualStartTime"],
        actualEndTime: json["actualEndTime"],
        startOdoMeterReading: json["startOdoMeterReading"],
        endOdoMeterReading: json["endOdoMeterReading"],
        tripStatus: json["tripStatus"],
        tripStatusText: json["tripStatusText"],
        fuelEconomy: json["fuelEconomy"],
        isAssetUndermaintenance: json["isAssetUndermaintenance"],
        createdByEntityId: json["createdByEntityId"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        createdByEntity: json["createdByEntity"],
        dbOperation: json["dbOperation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "accountId": accountId,
        "accountAddressId": accountAddressId,
        "account": account,
        "accountAddress": accountAddress,
        "tripPlanId": tripPlanId,
        "routeName": routeName,
        "routeId": routeId,
        "originLocation": originLocation,
        "destinationLocation": destinationLocation,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "userLoginTime": userLoginTime.toIso8601String(),
        "tarrifId": tarrifId,
        "tarrifType": tarrifType,
        "tarrifMode": tarrifMode,
        "tarrifRate": tarrifRate,
        "vehicleId": vehicleId,
        "vehicle": vehicle,
        "humanResources": humanResources,
        "actualStartTime": actualStartTime,
        "actualEndTime": actualEndTime,
        "startOdoMeterReading": startOdoMeterReading,
        "endOdoMeterReading": endOdoMeterReading,
        "tripStatus": tripStatus,
        "tripStatusText": tripStatusText,
        "fuelEconomy": fuelEconomy,
        "isAssetUndermaintenance": isAssetUndermaintenance,
        "createdByEntityId": createdByEntityId,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "createdByEntity": createdByEntity,
        "dbOperation": dbOperation,
      };
}

class ServiceTicketDetail {
  ServiceTicketDetail({
    required this.serviceTicketId,
    required this.productCode,
    required this.quantity,
    required this.product,
    required this.odometerReading,
    // required this.createdByEntityId,
    // this.createdBy,
    // this.createdDate,
    // this.modifiedBy,
    // this.modifiedDate,
    // this.createdByEntity,
    // this.dbOperation,
  });

  String serviceTicketId;
  String productCode;
  int quantity;
  Product product;
  int odometerReading;
  // int createdByEntityId;
  // dynamic createdBy;
  // dynamic createdDate;
  // dynamic modifiedBy;
  // dynamic modifiedDate;
  // dynamic createdByEntity;
  // dynamic dbOperation;

  factory ServiceTicketDetail.fromJson(Map<String, dynamic> json) =>
      ServiceTicketDetail(
        serviceTicketId: json["serviceTicketId"],
        productCode: json["productCode"],
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
        odometerReading: json["odometerReading"],
        // createdByEntityId: json["createdByEntityId"],
        // createdBy: json["createdBy"],
        // createdDate: json["createdDate"],
        // modifiedBy: json["modifiedBy"],
        // modifiedDate: json["modifiedDate"],
        // createdByEntity: json["createdByEntity"],
        // dbOperation: json["dbOperation"],
      );

  Map<String, dynamic> toJson() => {
        "serviceTicketId": serviceTicketId,
        "productCode": productCode,
        "quantity": quantity,
        "product": product.toJson(),
        "odometerReading": odometerReading,
        // "createdByEntityId": createdByEntityId,
        // "createdBy": createdBy,
        // "createdDate": createdDate,
        // "modifiedBy": modifiedBy,
        // "modifiedDate": modifiedDate,
        // "createdByEntity": createdByEntity,
        // "dbOperation": dbOperation,
      };
}

class Product {
  Product({
    // required this.productNo,
    required this.description,
    // this.unit1,
    // this.unit2,
    // required this.costPrice,
    // required this.salePrice,
  });

  // String productNo;
  String description;
  // dynamic unit1;
  // dynamic unit2;
  // int costPrice;
  // int salePrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        // productNo: json["productNo"],
        description: json["description"],
        // unit1: json["unit1"],
        // unit2: json["unit2"],
        // costPrice: json["costPrice"],
        // salePrice: json["salePrice"],
      );

  Map<String, dynamic> toJson() => {
        // "productNo": productNo,
        "description": description,
        // "unit1": unit1,
        // "unit2": unit2,
        // "costPrice": costPrice,
        // "salePrice": salePrice,
      };
}
