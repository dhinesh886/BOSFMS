import 'package:bos_app/dirver_app/repository/fuel_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/custom_error_tost.dart';
import '../../utils/helper_methods.dart';
import '../../utils/theme_data.dart';
import '../models/maintainence/get_associated_asset_model.dart';
import '../models/maintainence/request_type_response_model.dart';
import '../repository/maintenance_repo.dart';
import '../widgets/mandatory_text_widget.dart';
import 'service_raised_screen.dart';

class FuelScreen extends StatefulWidget {
  final String userId;
  final String token;
  const FuelScreen({Key? key, required this.userId, required this.token})
      : super(key: key);

  @override
  State<FuelScreen> createState() => _FuelScreenState();
}

class _FuelScreenState extends State<FuelScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController odometerReadingController = TextEditingController();
  MaintenanceRepo maintenanceRepo = MaintenanceRepo();
  FuelRepo fuelRepo = FuelRepo();
  List<GetAssociatedAsset>? getAssociatedAsset;
  bool isLoading = false;
  int latestOdometerReading = 0;
  List<RequestTypeResponseModel>? requestTypeIds = [];
  List<String> requestTypeList = [];
  String requestTypeCode = "IN";

  late Future myFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFuture = getAssociatedDetails();
  }

  @override
  void dispose() {
    super.dispose();
    odometerReadingController.dispose();
  }

  Future getAssociatedDetails() async {
    getAssociatedAsset = await maintenanceRepo.getAssetById(
        userId: widget.userId, token: widget.token);
    latestOdometerReading = getAssociatedAsset![0].lastOdometerRecorded;
    print("Get Associate Response");
    print(getAssociatedAsset);
    odometerReadingController.text =
        getAssociatedAsset![0].lastOdometerRecorded.toString();

    requestTypeIds = await maintenanceRepo.getRequestType(token: widget.token);

    for (var value in requestTypeIds!) {
      requestTypeList.add(value.value);
    }
    // if (requestTypeList.length == 1) {
    //   requestTypeCode = requestTypeIds![0].key;
    // } else {
    //   requestTypeCode = requestTypeIds![0].key;
    // }
    //! As discussed passing hard code "IN" code
    print(requestTypeList.toString());
    print("Request Type Code $requestTypeCode");
    return getAssociatedAsset;
  }

  postFuelRequest({
    required String token,
    required int odometerReading,
    required String assetNo,
    required String requestType,
  }) async {
    print("Passing Odometer $odometerReading");
    bool result = await fuelRepo.postFuelRequest(
        token: token,
        odometerReading: odometerReading,
        assetNo: assetNo,
        requestType: requestType);
    if (result == true) {
      print("True");
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ServiceRaisedScreen(
            message: "Fuel request raised\nsuccessfully",
            isTrip: false,
            driverToken: "",
          ),
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
        title: const Text('Fuel Request'),
        backgroundColor: customAppBarColor,
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as List<GetAssociatedAsset>;
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const Text(
                                    "Fuel Request Details",
                                    style: headingSmall,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  const Text(
                                    "Vehicle Id",
                                    style: body1,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    data[0].code,
                                    style: headingSmall,
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
                                ],
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
                                  } else {
                                    bool isInternetAvailable =
                                        await HelperMethods
                                            .checkInternetConnection();
                                    if (isInternetAvailable == true) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      postFuelRequest(
                                        token: widget.token,
                                        odometerReading: int.parse(
                                            odometerReadingController.text),
                                        assetNo: data[0].code,
                                        requestType: requestTypeCode,
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.5,
                    child: Image.asset('assets/images/no_data_image.png'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "No Data found",
                    style: body1,
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
