import 'package:bos_app/dirver_app/repository/maintenance_repo.dart';
import 'package:bos_app/fuel_operator_app/repository/fuel_operator_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../dirver_app/models/maintainence/key_value_by_header_id_model.dart';
import '../../dirver_app/models/maintainence/request_type_response_model.dart';
import '../../dirver_app/widgets/mandatory_text_widget.dart';
import '../../utils/custom_error_tost.dart';
import '../../utils/helper_methods.dart';
import '../../utils/theme_data.dart';
import '../models/get_asset_by_id_response_model.dart';
import 'approved_fuel_request.dart';

class ServiceRequestScreen extends StatefulWidget {
  final String vehicleId;
  final String vehicleCode;
  final String assetId;
  final String token;
  const ServiceRequestScreen({
    Key? key,
    required this.vehicleId,
    required this.vehicleCode,
    required this.assetId,
    required this.token,
  }) : super(key: key);

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  final formKey = GlobalKey<FormState>();
  String? selectedValue;
  TextEditingController odometerReadingController = TextEditingController();
  TextEditingController additionalDetailController = TextEditingController();
  GetAssetByIdResponseModel? getAssociatedAsset;
  List<KeyValueByHeaderIdModel>? keyValueByHeaderId = [];
  List<RequestTypeResponseModel>? requestTypeIds = [];
  List<String> categoryList = [];
  List<String> requestTypeList = [];
  String? requestTypeSelectedValue;
  String requestTypeCode = "IN";
  String requestTypeHint = "";
  bool isLoading = false;
  int latestOdometerReading = 0;
  String categoryCode = "";
  bool selecteRequestType = true;

  late Future myFuture;

  MaintenanceRepo maintenanceRepo = MaintenanceRepo();
  FuelOperatorRepository fuelOperatorRepository = FuelOperatorRepository();

  @override
  void initState() {
    super.initState();
    getCategoryList();
    myFuture = getAssociatedDetails();
  }

  @override
  void dispose() {
    super.dispose();
    odometerReadingController.dispose();
    additionalDetailController.dispose();
  }

  getCategoryList() async {
    keyValueByHeaderId =
        await maintenanceRepo.getKeyValueByHeaderId(token: widget.token);

    for (var value in keyValueByHeaderId!) {
      categoryList.add(value.value);
    }
    print(categoryList.toString());
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
    print("Request Type Hing $requestTypeHint");
    setState(() {});
  }

  Future getAssociatedDetails() async {
    getAssociatedAsset = await fuelOperatorRepository.getAssetById(
        assetId: widget.assetId, token: widget.token);
    latestOdometerReading = getAssociatedAsset!.lastOdometerRecorded;
    print("Get Associate Response");
    print(getAssociatedAsset);
    odometerReadingController.text =
        getAssociatedAsset!.lastOdometerRecorded.toString();
    return getAssociatedAsset;
  }

  String getCategoryId(String category) {
    String code = "";
    for (var value in keyValueByHeaderId!) {
      if (value.value == category) {
        code = value.key;
        break;
      }
    }
    return code;
  }

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

  postServiceRequest({
    required String token,
    required String subCategoryId,
    required int odometerReading,
    required String requestTypeId,
    required String assetNo,
    required String description,
    required String categoryId,
    required String statusId,
  }) async {
    bool isInternetAvailable = await HelperMethods.checkInternetConnection();
    if (isInternetAvailable == true) {
      bool result = await maintenanceRepo.postServiceRequest(
          token: token,
          subCategoryId: subCategoryId,
          odometerReading: odometerReading,
          requestTypeId: requestTypeId,
          assetNo: assetNo,
          description: description,
          categoryId: categoryId,
          statusId: statusId);
      if (result == true) {
        print("True");
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ApprovedFuelRequestScreen(),
          ),
        );
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
          msg:
              "Unable to process your request right now. Please try after sometime",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          fontSize: 16,
          textColor: Colors.white,
        );
        print("False");
      }
    } else {
      setState(() {
        isLoading = false;
      });
      customErrorToast("Check your Internet connection and try again!");
    }
  }

  refreshData() {
    getAssociatedDetails();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Service Request'),
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as GetAssetByIdResponseModel;
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
                        key: formKey,
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
                                      const Text(
                                        "Service Request Details",
                                        style: headingSmall,
                                      ),
                                      const SizedBox(height: 14),
                                      const MandatoryTextWidget(
                                        title: "Vehicle",
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 40,
                                        width: double.infinity,
                                        // margin: const EdgeInsets.all(),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black87),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8),
                                          child: Text(
                                            data.assetNo,
                                            style: body1,
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
                                            value: selectedValue,
                                            isExpanded: true,
                                            elevation: 2,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            iconEnabledColor: Colors.black,
                                            items: categoryList
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
                                                selectedValue = value;
                                                categoryCode = getCategoryId(
                                                    value.toString());
                                                print(
                                                    "Category Code $categoryCode");
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      const MandatoryTextWidget(
                                        title: "Odometer Reading",
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
                                        title: "Additional details",
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        width: size.width,
                                        child: TextFormField(
                                          controller:
                                              additionalDetailController,
                                          maxLines: 3,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
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
                                  } else if (categoryCode == "") {
                                    customErrorToast("Please Select Category");
                                  } else if (additionalDetailController.text ==
                                      "") {
                                    customErrorToast(
                                        "Please provide some additional details");
                                  } else {
                                    bool isInternetAvailable =
                                        await HelperMethods
                                            .checkInternetConnection();
                                    if (isInternetAvailable == true) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      postServiceRequest(
                                        subCategoryId: categoryCode,
                                        assetNo: data.assetNo,
                                        odometerReading: int.parse(
                                            odometerReadingController.text),
                                        requestTypeId: requestTypeCode,
                                        categoryId: "MR",
                                        description:
                                            additionalDetailController.text,
                                        statusId: "SI",
                                        token: widget.token,
                                      );
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
                    "No Associated vehicle found",
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
