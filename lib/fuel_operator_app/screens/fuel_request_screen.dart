import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../dirver_app/models/maintainence/request_type_response_model.dart';
import '../../dirver_app/repository/maintenance_repo.dart';
import '../../dirver_app/widgets/mandatory_text_widget.dart';
import '../../utils/custom_error_tost.dart';
import '../../utils/helper_methods.dart';
import '../../utils/theme_data.dart';
import '../models/category_response_model.dart';
import '../models/get_asset_by_id_response_model.dart';
import '../models/get_service_ticket_by_id_response_model.dart';
import '../repository/fuel_operator_repository.dart';
import 'fuel_history_screen.dart';

class FuelRequestScreen extends StatefulWidget {
  final String vehicleId;
  final String vehicleCode;
  final String assetId;
  final String token;
  const FuelRequestScreen({
    Key? key,
    required this.vehicleId,
    required this.vehicleCode,
    required this.assetId,
    required this.token,
  }) : super(key: key);

  @override
  State<FuelRequestScreen> createState() => _FuelRequestScreenState();
}

class _FuelRequestScreenState extends State<FuelRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValueRequestType;
  String? selectedValueCategory;
  bool isLoading = false;
  TextEditingController odometerReadingController = TextEditingController();
  TextEditingController fuelReadingController = TextEditingController();
  List<String> category = [];
  String productCode = "";
  List<RequestTypeResponseModel>? requestTypeIds = [];
  List<String> requestTypeList = [];
  String? requestTypeSelectedValue;
  String requestTypeCode = "IN";
  String requestTypeHint = "";
  bool selecteRequestType = true;

  FuelOperatorRepository fuelOperatorRepository = FuelOperatorRepository();
  late Future myFuture;
  List<CategoryResponseModel>? categoryResponseModel;
  int latestOdometerReading = 0;

  late GetServiceTicketByIdResponseModel? getServiceTicketByIdResponseModel;
  @override
  void initState() {
    super.initState();
    myFuture = getData();
    getCategoryList();
  }

  @override
  void dispose() {
    super.dispose();
    odometerReadingController.dispose();
    fuelReadingController.dispose();
  }

  getCategoryList() async {
    MaintenanceRepo maintenanceRepo = MaintenanceRepo();
    categoryResponseModel =
        await fuelOperatorRepository.getCategory(token: widget.token);
    for (var value in categoryResponseModel!) {
      category.add(value.description);
    }
    requestTypeIds = await maintenanceRepo.getRequestType(token: widget.token);

    for (var value in requestTypeIds!) {
      requestTypeList.add(value.value);
    }
    if (requestTypeList.length == 1) {
      selecteRequestType = false;
      requestTypeHint = requestTypeList[0];
      requestTypeCode = requestTypeIds![0].key;
    } else {
      requestTypeHint = "INTERNAL";
      requestTypeCode = "IN";
    }

    print(requestTypeList.toString());
    print("Request Type Hint and Code  $requestTypeHint $requestTypeCode");
    setState(() {});
  }

  getProductCode(String category) {
    String code = "";
    for (var value in categoryResponseModel!) {
      if (value.description == category) {
        code = value.productNo;
        break;
      }
    }
    return code;
  }

  // getRequestTypeCode(String requestTypeString) {
  //   String code = "";
  //   if (requestTypeString == "INTERNAL") {
  //     code = "IN";
  //   } else if (requestTypeString == "EXTERNAL") {
  //     code = "EX";
  //   } else {
  //     code = "IN";
  //   }
  //   return code;
  // }
  String getRequestTypeId(String category) {
    String code = "IN";
    for (var value in requestTypeIds!) {
      if (value.value == category) {
        code = value.key;
        break;
      }
    }
    return code;
  }

  getData() async {
    GetAssetByIdResponseModel? getAssetResponseModel =
        await fuelOperatorRepository.getAssetById(
            token: widget.token, assetId: widget.assetId);
    odometerReadingController.text =
        getAssetResponseModel!.lastOdometerRecorded.toString();
    latestOdometerReading = getAssetResponseModel.lastOdometerRecorded;
    getServiceTicketByIdResponseModel = await fuelOperatorRepository
        .getServiceTicketById(token: widget.token, id: widget.vehicleCode);
    log("Service Ticket response");
    // log(getServiceTicketByIdResponseModel!.toJson().toString());
    return getAssetResponseModel;
  }

  postFuelRequest() async {
    getServiceTicketByIdResponseModel!.id = widget.vehicleCode;
    getServiceTicketByIdResponseModel!.asset.id = widget.assetId;
    getServiceTicketByIdResponseModel!.requestTypeId = requestTypeCode;
    getServiceTicketByIdResponseModel!.statusId = "FI";
    print(widget.vehicleCode);
    getServiceTicketByIdResponseModel!.serviceTicketDetails!.add(
      ServiceTicketDetail(
        serviceTicketId: widget.vehicleCode,
        productCode: productCode,
        quantity: int.parse(fuelReadingController.text),
        odometerReading: int.parse(odometerReadingController.text),
        product: Product(
          description: "",
        ),
      ),
    );
    getServiceTicketByIdResponseModel!.odometerReading =
        int.parse(odometerReadingController.text);
    getServiceTicketByIdResponseModel!.serviceTicketDetails![0].quantity =
        int.parse(fuelReadingController.text);
    String jsonString = jsonEncode(getServiceTicketByIdResponseModel!.toJson());
    log(jsonString);

    bool result = await fuelOperatorRepository.postFuelRequest(
      token: widget.token,
      getServiceTicketByIdResponseModel: getServiceTicketByIdResponseModel,
    );
    if (result == true) {
      setState(() {
        isLoading = false;
      });
      print("Succes");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FuelHistoryScreen(
            vehicleCode: widget.vehicleCode,
            assetId: widget.assetId,
            token: widget.token,
            // vehicleNumber: "KA53C9574",
            vehicleNumber: widget.vehicleId,
          ),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      print("Failed");
    }
  }

  refreshData() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Fuel Request'),
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 1), () {
                  refreshData();
                });
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          size.height - (AppBar().preferredSize.height * 1.2),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 14),
                                      Text(
                                        "Vehicle Id: ${widget.vehicleId}",
                                        style: headingSmall,
                                      ),
                                      const SizedBox(height: 14),
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 8),
                                        height: 40,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: const Color.fromARGB(
                                                255, 215, 213, 213)),
                                        child: Text(
                                          "Fuel Request: ${widget.vehicleCode}",
                                          style: body2,
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                      const MandatoryTextWidget(
                                        title: "Odometer before fueling",
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: size.width,
                                        child: TextFormField(
                                          controller: odometerReadingController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(left: 8),
                                            hintText: "Odometer reading",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      const MandatoryTextWidget(
                                        title: "Request Type",
                                      ),
                                      IgnorePointer(
                                        ignoring: !selecteRequestType,
                                        child: Container(
                                          height: 45,
                                          width: size.width,
                                          margin: const EdgeInsets.only(top: 8),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DropdownButton<String>(
                                              underline: Container(),
                                              focusColor: Colors.white,
                                              value: requestTypeSelectedValue,
                                              isExpanded: true,
                                              elevation: 2,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              iconEnabledColor: Colors.black,
                                              items: requestTypeList.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: body1,
                                                  ),
                                                );
                                              }).toList(),
                                              hint: Text(
                                                requestTypeHint,
                                                style: selecteRequestType
                                                    ? const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400)
                                                    : const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  requestTypeSelectedValue =
                                                      value;
                                                  requestTypeCode =
                                                      getRequestTypeId(
                                                          value.toString());
                                                  print(
                                                      "Request Type $requestTypeCode");
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      const MandatoryTextWidget(
                                        title: "Category",
                                      ),
                                      Container(
                                        height: 45,
                                        width: size.width,
                                        margin: const EdgeInsets.only(top: 8),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButton<String>(
                                            underline: Container(),
                                            focusColor: Colors.white,
                                            value: selectedValueCategory,
                                            isExpanded: true,
                                            elevation: 2,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            iconEnabledColor: Colors.black,
                                            items: category
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: body1,
                                                ),
                                              );
                                            }).toList(),
                                            hint: const Text(
                                              "--Select--",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValueCategory = value;
                                                productCode =
                                                    getProductCode(value!);
                                                log(productCode);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      const MandatoryTextWidget(
                                        title: "Fuel in Ltrs",
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: size.width,
                                        child: TextFormField(
                                          controller: fuelReadingController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'),
                                            ),
                                          ],
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(left: 8),
                                            hintText: "Fuel in ltrs",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (odometerReadingController.text.isEmpty) {
                                    customErrorToast(
                                        "Please enter odometer reading");
                                  } else if (int.parse(
                                          odometerReadingController.text) <
                                      latestOdometerReading) {
                                    customErrorToast(
                                        "Current odometer reading cannot be lesser than the previously logged");
                                  } else if (selectedValueCategory == "" ||
                                      selectedValueCategory == null ||
                                      selectedValueCategory == "--Select--") {
                                    customErrorToast("Please Select Category");
                                  } else if (fuelReadingController.text == "") {
                                    customErrorToast(
                                        "Please enter fuel in liters");
                                  } else if (int.parse(
                                          fuelReadingController.text) <=
                                      0) {
                                    customErrorToast(
                                        "Fuel value can't be 0 or less than 0");
                                  } else {
                                    bool isInternetAvailable =
                                        await HelperMethods
                                            .checkInternetConnection();
                                    if (isInternetAvailable == true) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      postFuelRequest();
                                    } else {
                                      customErrorToast(
                                          "Check your Internet connection and try again!");
                                    }
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: size.width,
                                  margin:
                                      const EdgeInsets.fromLTRB(4, 0, 4, 14),
                                  decoration: BoxDecoration(
                                    color: customGreenColor,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            'Save',
                                            style: body1W.copyWith(
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.5,
                    child: Image.asset('assets/images/no_data_image.png'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "No data found",
                    style: headingSmall,
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: customBlueColor),
          );
        },
      ),
    );
  }
}
