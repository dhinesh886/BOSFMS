// To parse this JSON data, do
//
//     final getLatestTripData = getLatestTripDataFromJson(jsonString);

import 'dart:convert';

GetLatestTripData getLatestTripDataFromJson(String str) =>
    GetLatestTripData.fromJson(json.decode(str));

String getLatestTripDataToJson(GetLatestTripData data) =>
    json.encode(data.toJson());



class GetLatestTripData {
  GetLatestTripData({
    required this.id,
     this.code,
    required this.accountId,
    required this.accountAddressId,
    required this.account,
    required this.accountAddress,
    required this.tripPlanId,
    required this.routeName,
    required this.routeId,
    required this.originLocation,
    required this.destinationLocation,
    required this.startTime,
    required this.endTime,
    required this.userLoginTime,
    required this.tarrifId,
    required this.tarrifType,
    required this.tarrifMode,
    required this.tarrifRate,
    required this.vehicleId,
    required this.vehicle,
    required this.humanResources,
    required this.actualStartTime,
    required this.actualEndTime,
    required this.startOdoMeterReading,
    required this.endOdoMeterReading,
    required this.tripStatus,
    required this.tripStatusText,
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
  late final String id;
  late final Null code;
  late final String accountId;
  late final String accountAddressId;
  late final Account account;
  late final AccountAddress accountAddress;
  late final int tripPlanId;
  late final String routeName;
  late final String routeId;
  late final String originLocation;
  late final String destinationLocation;
  late final String startTime;
  late final String endTime;
  late final String userLoginTime;
  late final String tarrifId;
  late final String tarrifType;
  late final String tarrifMode;
  late final int tarrifRate;
  late final String vehicleId;
  late final Vehicle vehicle;
  late final List<HumanResources> humanResources;
  late final String actualStartTime;
  late final String actualEndTime;
  late  int startOdoMeterReading;
  late  int endOdoMeterReading;
  late  int tripStatus;
  late final String tripStatusText;
  late final int fuelEconomy;
  late final bool isAssetUndermaintenance;
  late final int createdByEntityId;
  late final Null createdBy;
  late final Null createdDate;
  late final Null modifiedBy;
  late final Null modifiedDate;
  late final Null createdByEntity;
  late final Null dbOperation;
  
  GetLatestTripData.fromJson(Map<String, dynamic> json){
    id = json['id']??"";
    code = null;
    accountId = json['accountId']??"";
    accountAddressId = json['accountAddressId']??"";
    account = Account.fromJson(json['account']);
    accountAddress = AccountAddress.fromJson(json['accountAddress']);
    tripPlanId = json['tripPlanId']??0;
    routeName = json['routeName']??"";
    routeId = json['routeId']??"";
    originLocation = json['originLocation']??"";
    destinationLocation = json['destinationLocation']??"";
    startTime = json['startTime']??"";
    endTime = json['endTime']??"";
    userLoginTime = json['userLoginTime']??"";
    tarrifId = json['tarrifId']??"";
    tarrifType = json['tarrifType']??"";
    tarrifMode = json['tarrifMode']??"";
    tarrifRate = json['tarrifRate']??0;
    vehicleId = json['vehicleId']??"";
    vehicle = Vehicle.fromJson(json['vehicle']);
    humanResources = List.from(json['humanResources']).map((e)=>HumanResources.fromJson(e)).toList();
    actualStartTime = json['actualStartTime']??"";
    actualEndTime = json['actualEndTime']??"";
    startOdoMeterReading = json['startOdoMeterReading']??0;
    endOdoMeterReading = json['endOdoMeterReading']??0;
    tripStatus = json['tripStatus']??0;
    tripStatusText = json['tripStatusText']??"";
    fuelEconomy = json['fuelEconomy']??0;
    isAssetUndermaintenance = json['isAssetUndermaintenance']??false;
    createdByEntityId = json['createdByEntityId']??0;
    createdBy = null;
    createdDate = null;
    modifiedBy = null;
    modifiedDate = null;
    createdByEntity = null;
    dbOperation = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['accountId'] = accountId;
    _data['accountAddressId'] = accountAddressId;
    _data['account'] = account.toJson();
    _data['accountAddress'] = accountAddress.toJson();
    _data['tripPlanId'] = tripPlanId;
    _data['routeName'] = routeName;
    _data['routeId'] = routeId;
    _data['originLocation'] = originLocation;
    _data['destinationLocation'] = destinationLocation;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['userLoginTime'] = userLoginTime;
    _data['tarrifId'] = tarrifId;
    _data['tarrifType'] = tarrifType;
    _data['tarrifMode'] = tarrifMode;
    _data['tarrifRate'] = tarrifRate;
    _data['vehicleId'] = vehicleId;
    _data['vehicle'] = vehicle.toJson();
    _data['humanResources'] = humanResources.map((e)=>e.toJson()).toList();
    _data['actualStartTime'] = actualStartTime;
    _data['actualEndTime'] = actualEndTime;
    _data['startOdoMeterReading'] = startOdoMeterReading;
    _data['endOdoMeterReading'] = endOdoMeterReading;
    _data['tripStatus'] = tripStatus;
    _data['tripStatusText'] = tripStatusText;
    _data['fuelEconomy'] = fuelEconomy;
    _data['isAssetUndermaintenance'] = isAssetUndermaintenance;
    _data['createdByEntityId'] = createdByEntityId;
    _data['createdBy'] = createdBy;
    _data['createdDate'] = createdDate;
    _data['modifiedBy'] = modifiedBy;
    _data['modifiedDate'] = modifiedDate;
    _data['createdByEntity'] = createdByEntity;
    _data['dbOperation'] = dbOperation;
    return _data;
  }
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
    required this.id,
    required this.name,
     this.business,
     this.logo,
    required this.activeTill,
     this.additionalDetails,
     this.dbOperation,
  });
  late final String createdDate;
  late final int totalTrips;
  late final int totalTripsfortheMonth;
  late final int trafficIncident;
  late final int delayedTrips;
  late final int totalComplaints;
  late final int action;
  late final Null addresses;
  late final Null users;
  late final String id;
  late final String name;
  late final Null business;
  late final Null logo;
  late final String activeTill;
  late final Null additionalDetails;
  late final Null dbOperation;
  
  Account.fromJson(Map<String, dynamic> json){
    createdDate = json['createdDate']??"";
    totalTrips = json['totalTrips']??0;
    totalTripsfortheMonth = json['totalTripsfortheMonth']??0;
    trafficIncident = json['trafficIncident']??0;
    delayedTrips = json['delayedTrips']??0;
    totalComplaints = json['totalComplaints']??0;
    action = json['action']??0;
    addresses = null;
    users = null;
    id = json['id']??"";
    name = json['name']??"";
    business = null;
    logo = null;
    activeTill = json['activeTill']??"";
    additionalDetails = null;
    dbOperation = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdDate'] = createdDate;
    _data['totalTrips'] = totalTrips;
    _data['totalTripsfortheMonth'] = totalTripsfortheMonth;
    _data['trafficIncident'] = trafficIncident;
    _data['delayedTrips'] = delayedTrips;
    _data['totalComplaints'] = totalComplaints;
    _data['action'] = action;
    _data['addresses'] = addresses;
    _data['users'] = users;
    _data['id'] = id;
    _data['name'] = name;
    _data['business'] = business;
    _data['logo'] = logo;
    _data['activeTill'] = activeTill;
    _data['additionalDetails'] = additionalDetails;
    _data['dbOperation'] = dbOperation;
    return _data;
  }
}

class AccountAddress {
  AccountAddress({
     this.clientId,
     this.id,
     this.email,
     this.phoneNumber,
    required this.address,
    required this.addressType,
     this.registrationNo1,
     this.registrationNo2,
     this.registrationNo3,
     this.registrationNo4,
     this.registrationNo5,
    required this.registrationDate1,
    required this.registrationDate2,
    required this.registrationDate3,
    required this.registrationDate4,
    required this.registrationDate5,
     this.dbOperation,
  });
  late final Null clientId;
  late final Null id;
  late final Null email;
  late final Null phoneNumber;
  late final Address address;
  late final int addressType;
  late final Null registrationNo1;
  late final Null registrationNo2;
  late final Null registrationNo3;
  late final Null registrationNo4;
  late final Null registrationNo5;
  late final String registrationDate1;
  late final String registrationDate2;
  late final String registrationDate3;
  late final String registrationDate4;
  late final String registrationDate5;
  late final Null dbOperation;
  
  AccountAddress.fromJson(Map<String, dynamic> json){
    clientId = null;
    id = null;
    email = null;
    phoneNumber = null;
    address = Address.fromJson(json['address']);
    addressType = json['addressType']??0;
    registrationNo1 = null;
    registrationNo2 = null;
    registrationNo3 = null;
    registrationNo4 = null;
    registrationNo5 = null;
    registrationDate1 = json['registrationDate1']??"";
    registrationDate2 = json['registrationDate2']??"";
    registrationDate3 = json['registrationDate3']??"";
    registrationDate4 = json['registrationDate4']??"";
    registrationDate5 = json['registrationDate5']??"";
    dbOperation = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['clientId'] = clientId;
    _data['id'] = id;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['address'] = address.toJson();
    _data['addressType'] = addressType;
    _data['registrationNo1'] = registrationNo1;
    _data['registrationNo2'] = registrationNo2;
    _data['registrationNo3'] = registrationNo3;
    _data['registrationNo4'] = registrationNo4;
    _data['registrationNo5'] = registrationNo5;
    _data['registrationDate1'] = registrationDate1;
    _data['registrationDate2'] = registrationDate2;
    _data['registrationDate3'] = registrationDate3;
    _data['registrationDate4'] = registrationDate4;
    _data['registrationDate5'] = registrationDate5;
    _data['dbOperation'] = dbOperation;
    return _data;
  }
}

class Address {
  Address({
     this.id,
    required this.line1,
     this.line2,
    required this.city,
    required this.stateId,
    required this.countryId,
    required this.stateName,
    required this.countryName,
    required this.zip,
    required this.fullAddress,
    required this.shortAddress,
     this.dbOperation,
  });
  late final Null id;
  late final String line1;
  late final Null line2;
  late final String city;
  late final String stateId;
  late final String countryId;
  late final String stateName;
  late final String countryName;
  late final String zip;
  late final String fullAddress;
  late final String shortAddress;
  late final Null dbOperation;
  
  Address.fromJson(Map<String, dynamic> json){
    id = null;
    line1 = json['line1']??"";
    line2 = null;
    city = json['city']??"";
    stateId = json['stateId']??"";
    countryId = json['countryId']??"";
    stateName = json['stateName']??"";
    countryName = json['countryName']??"";
    zip = json['zip']??"";
    fullAddress = json['fullAddress']??"";
    shortAddress = json['shortAddress']??"";
    dbOperation = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['line1'] = line1;
    _data['line2'] = line2;
    _data['city'] = city;
    _data['stateId'] = stateId;
    _data['countryId'] = countryId;
    _data['stateName'] = stateName;
    _data['countryName'] = countryName;
    _data['zip'] = zip;
    _data['fullAddress'] = fullAddress;
    _data['shortAddress'] = shortAddress;
    _data['dbOperation'] = dbOperation;
    return _data;
  }
}

class Vehicle {
  Vehicle({
    required this.code,
    required this.id,
    required this.assetNo,
     this.invoiceNo,
     this.invoiceSlno,
     this.assetSerial,
     this.description,
     this.referenceNo,
    required this.manufacturer,
     this.yearofMake,
    required this.capacity,
    required this.accountName,
     this.accunntBranch,
     this.driverName,
     this.driver,
     this.depot,
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
     this.modelasperRC,
     this.acNonAC,
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
  late final String code;
  late final String id;
  late final String assetNo;
  late final Null invoiceNo;
  late final Null invoiceSlno;
  late final Null assetSerial;
  late final Null description;
  late final Null referenceNo;
  late final String manufacturer;
  late final Null yearofMake;
  late final String capacity;
  late final String accountName;
  late final Null accunntBranch;
  late final Null driverName;
  late  Null driver;
  late final Null depot;
  late final String lastTripCompletedDate;
  late  int lastOdometerRecorded;
  late final String nextServiceDue;
  late final Null warranties;
  late final Null documents;
  late final int noOfTrips;
  late final int fuelEconomy;
  late final Null assetType;
  late final Null vehicleType;
  late final Null vehicleTypeDesp;
  late final Null category;
  late final Null categoryDesp;
  late final Null engineNo;
  late final Null chassisNo;
  late final Null modelasperRC;
  late final Null acNonAC;
  late final Null bodyCapacity;
  late final Null wheelBase;
  late final Null dateofReg;
  late final Null humanResources;
  late final Null make;
  late final Null madeBy;
  late final Null insuranceDue;
  late final Null permitRenewal;
  late final Null emissioncheckDate;
  late final int createdByEntityId;
  late final Null createdBy;
  late final Null createdDate;
  late final Null modifiedBy;
  late final Null modifiedDate;
  late final Null createdByEntity;
  late final Null dbOperation;
  
  Vehicle.fromJson(Map<String, dynamic> json){
    code = json['code']??"";
    id = json['id']??"";
    assetNo = json['assetNo']??"";
    invoiceNo = null;
    invoiceSlno = null;
    assetSerial = null;
    description = null;
    referenceNo = null;
    manufacturer = json['manufacturer']??"";
    yearofMake = null;
    capacity = json['capacity']??"";
    accountName = json['accountName']??"";
    accunntBranch = null;
    driverName = null;
    driver =null;
    depot = null;
    lastTripCompletedDate = json['lastTripCompletedDate']??"";
    lastOdometerRecorded = json['lastOdometerRecorded']??0;
    nextServiceDue = json['nextServiceDue']??"";
    warranties = null;
    documents = null;
    noOfTrips = json['noOfTrips']??0;
    fuelEconomy = json['fuelEconomy']??0;
    assetType = null;
    vehicleType = null;
    vehicleTypeDesp = null;
    category = null;
    categoryDesp = null;
    engineNo = null;
    chassisNo = null;
    modelasperRC = null;
    acNonAC = null;
    bodyCapacity = null;
    wheelBase = null;
    dateofReg = null;
    humanResources = null;
    make = null;
    madeBy = null;
    insuranceDue = null;
    permitRenewal = null;
    emissioncheckDate = null;
    createdByEntityId = json['createdByEntityId']??0;
    createdBy = null;
    createdDate = null;
    modifiedBy = null;
    modifiedDate = null;
    createdByEntity = null;
    dbOperation = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['id'] = id;
    _data['assetNo'] = assetNo;
    _data['invoiceNo'] = invoiceNo;
    _data['invoiceSlno'] = invoiceSlno;
    _data['assetSerial'] = assetSerial;
    _data['description'] = description;
    _data['referenceNo'] = referenceNo;
    _data['manufacturer'] = manufacturer;
    _data['yearofMake'] = yearofMake;
    _data['capacity'] = capacity;
    _data['accountName'] = accountName;
    _data['accunntBranch'] = accunntBranch;
    _data['driverName'] = driverName;
    _data['driver'] = driver;
    _data['depot'] = depot;
    _data['lastTripCompletedDate'] = lastTripCompletedDate;
    _data['lastOdometerRecorded'] = lastOdometerRecorded;
    _data['nextServiceDue'] = nextServiceDue;
    _data['warranties'] = warranties;
    _data['documents'] = documents;
    _data['noOfTrips'] = noOfTrips;
    _data['fuelEconomy'] = fuelEconomy;
    _data['assetType'] = assetType;
    _data['vehicleType'] = vehicleType;
    _data['vehicleTypeDesp'] = vehicleTypeDesp;
    _data['category'] = category;
    _data['categoryDesp'] = categoryDesp;
    _data['engineNo'] = engineNo;
    _data['chassisNo'] = chassisNo;
    _data['modelasperRC'] = modelasperRC;
    _data['acNonAC'] = acNonAC;
    _data['bodyCapacity'] = bodyCapacity;
    _data['wheelBase'] = wheelBase;
    _data['dateofReg'] = dateofReg;
    _data['humanResources'] = humanResources;
    _data['make'] = make;
    _data['madeBy'] = madeBy;
    _data['insuranceDue'] = insuranceDue;
    _data['permitRenewal'] = permitRenewal;
    _data['emissioncheckDate'] = emissioncheckDate;
    _data['createdByEntityId'] = createdByEntityId;
    _data['createdBy'] = createdBy;
    _data['createdDate'] = createdDate;
    _data['modifiedBy'] = modifiedBy;
    _data['modifiedDate'] = modifiedDate;
    _data['createdByEntity'] = createdByEntity;
    _data['dbOperation'] = dbOperation;
    return _data;
  }
}

class HumanResources {
  HumanResources({
    required this.slno,
    required this.sourceId,
     this.personId,
    required this.resource,
  });
  late final int slno;
  late final int sourceId;
  late final Null personId;
  late final Resource resource;
  
  HumanResources.fromJson(Map<String, dynamic> json){
    slno = json['slno']??0;
    sourceId = json['sourceId']??0;
    personId = null;
    resource = Resource.fromJson(json['resource']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slno'] = slno;
    _data['sourceId'] = sourceId;
    _data['personId'] = personId;
    _data['resource'] = resource.toJson();
    return _data;
  }
}

class Resource {
  Resource({
    required this.id,
    required this.firstName,
    required this.lastName,
     this.email,
     this.phoneNumber,
     this.address,
     this.userId,
     this.user,
    required this.code,
    required this.designationCode,
     this.designation,
     this.resourceId,
    required this.fullName,
     this.defaultLink,
     this.avator,
     this.documents,
     this.dbOperation,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final Null email;
  late final Null phoneNumber;
  late final Null address;
  late final Null userId;
  late final Null user;
  late final String code;
  late final String designationCode;
  late final Null designation;
  late final Null resourceId;
  late final String fullName;
  late final Null defaultLink;
  late final Null avator;
  late final Null documents;
  late final Null dbOperation;
  
  Resource.fromJson(Map<String, dynamic> json){
    id = json['id']??"";
    firstName = json['firstName']??"";
    lastName = json['lastName']??"";
    email = null;
    phoneNumber = null;
    address = null;
    userId = null;
    user = null;
    code = json['code']??"";
    designationCode = json['designationCode']??"";
    designation = null;
    resourceId = null;
    fullName = json['fullName']??"";
    defaultLink = null;
    avator = null;
    documents = null;
    dbOperation = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['address'] = address;
    _data['userId'] = userId;
    _data['user'] = user;
    _data['code'] = code;
    _data['designationCode'] = designationCode;
    _data['designation'] = designation;
    _data['resourceId'] = resourceId;
    _data['fullName'] = fullName;
    _data['defaultLink'] = defaultLink;
    _data['avator'] = avator;
    _data['documents'] = documents;
    _data['dbOperation'] = dbOperation;
    return _data;
  }
}