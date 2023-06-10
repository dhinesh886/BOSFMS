import 'dart:developer';

import 'package:bos_app/dirver_app/screens/service_raised_screen.dart';
import 'package:bos_app/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/custom_error_tost.dart';
import '../../utils/helper_methods.dart';
import '../models/trip_flow/latest_odometer_response.dart';
import '../models/trip_flow/latest_trip_data_lite.dart';
import '../models/trip_flow/qr_scan_response_model.dart';
import '../models/trip_flow/user_list_by_role_response.dart';
import '../repository/qr_scan_trip_flow_repo.dart';
import 'error_screen.dart';

class QrResponseScreen extends StatefulWidget {
  final String assetId;
  final String driverToken;
  final String userId;
  const QrResponseScreen(
      {Key? key,
      required this.assetId,
      required this.driverToken,
      required this.userId})
      : super(key: key);

  @override
  State<QrResponseScreen> createState() => _QrResponseScreenState();
}

class _QrResponseScreenState extends State<QrResponseScreen> {
  String assetId = "";
  String driverToken = "";
  String? selectedValue;
  String driverHelperCode = "";
  List<String> driversList = ["--Select--"];
  bool isLoading = true;
  bool hasData = false;
  int tripStatus = 0;
  bool startReadOnly = false;
  bool startFilled = false;
  bool endReadOnly = true;
  bool endFilled = true;
  String route = "";
  String customer = "";
  String pickup = "";
  String drop = "";
  DateTime scheduleStart = DateTime.now();
  DateTime actualStart = DateTime.now();
  String driverHelper = "--Select--";
  String vehicleId = "";
  String buttonText = "Save";
  bool notStarted = true;
  bool isDifferentDriver = false;
  bool isAssetUndermaintenance = false;
  bool isButtonLoading = false;
  int latestOdometerReading = 0;

  QrScanResponseModel? qrScanResponseModel;
  LatestOdometerResponse? latestOdometerResponse;
  GetLatestTripDataLite? getLatestTripData;
  List<UserListByRoleResponse> driverHelpers = [];
  TextEditingController startOdometerController = TextEditingController();
  TextEditingController endOdometerController = TextEditingController();
  QrScanTripFlowRepo qrScanTripFlowRepo = QrScanTripFlowRepo();

  @override
  void initState() {
    assetId = widget.assetId;
    driverToken = widget.driverToken;
    print("Asset Id  $assetId");
    print("Driver Token  $driverToken");
    getQRData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    startOdometerController.dispose();
    endOdometerController.dispose();
  }

  Future getQRData() async {
    try {
      //Getting QR Data
      // qrScanResponseModel = await qrScanTripFlowRepo.getQrRepoData(
      //     assetId: assetId, token: driverToken);
      //Getting Latest Trip Status
      getLatestTripData = await qrScanTripFlowRepo.getLatestTripData(
          driverId: "", assetId: assetId, token: driverToken);
      //Getting Drivers List
      driverHelpers =
          await qrScanTripFlowRepo.getUserListByRole(token: driverToken);
      //Getting Latest Odometer Reading
      latestOdometerResponse = await qrScanTripFlowRepo.getAssetById(
          assetId: assetId, token: driverToken);

      //Checking Trip Status and populating the fields
      tripStatus = getLatestTripData!.tripStatus;
      latestOdometerReading = latestOdometerResponse!.lastOdometerRecorded;
      print("Latest Odometer Reading  $latestOdometerReading");
      print("Trip Status $tripStatus");
      if (tripStatus == 0 || tripStatus == 1) {
        startReadOnly = false;
        startFilled = false;
        endReadOnly = true;
        endFilled = true;
        notStarted = true;
        startOdometerController.text =
            latestOdometerResponse!.lastOdometerRecorded.toString();
        // endOdometerController.text =
        //     getLatestTripData!.endOdoMeterReading.toString();
        buttonText = "Start Trip";
      } else if (tripStatus == 2 || tripStatus == 3) {
        startReadOnly = true;
        startFilled = true;
        endReadOnly = false;
        endFilled = false;
        notStarted = false;
        startOdometerController.text =
            latestOdometerResponse!.lastOdometerRecorded.toString();
        // endOdometerController.text = "Enter End Odometer reading";
        // startOdometerController.text =
        //     getLatestTripData!.startOdoMeterReading.toString();
        buttonText = "End Trip";
      } else {
        startReadOnly = true;
        startFilled = true;
        endReadOnly = true;
        endFilled = true;
      }

      //Populating Driver list
      for (UserListByRoleResponse value in driverHelpers) {
        driversList.add(value.value);
      }
      print("Driver Helpers");
      print(driversList);

      vehicleId = getLatestTripData!.vehicleCode;
      route = getLatestTripData!.routeName == ""
          ? "NA"
          : getLatestTripData!.routeName;
      customer = getLatestTripData!.accountId;
      pickup = getLatestTripData!.originLocation;
      drop = getLatestTripData!.tripType;
      scheduleStart = getLatestTripData!.startTime;
      actualStart = getLatestTripData!.actualStartTime;

      if (getLatestTripData!.driverHelper!.fullName == "" ||
          getLatestTripData!.driverHelper == null) {
        driverHelper = '--Select--';
      } else {
        driverHelper = getLatestTripData!.driverHelper!.fullName.toString();
        driverHelperCode = getLatestTripData!.driverHelper!.code.toString();
      }
      print("Driver Helper API $driverHelper");
      print("Driver Helper Code API$driverHelperCode");

      setState(() {
        isLoading = false;
        hasData = true;
        isAssetUndermaintenance = getLatestTripData!.isAssetUndermaintenance;
        // isAssetUndermaintenance = true;
        if (getLatestTripData!.driver.code != widget.userId) {
          isDifferentDriver = true;
        }
      });
      // return qrScanResponseModel;
    } catch (e) {
      setState(() {
        isLoading = false;
        hasData = false;
      });
      print(e);
    }
    // return null;
  }

  Future startEndTrip({
    required dynamic driverHelper,
    required int latestOdometerReading,
    required int tripStatus,
    required String driverHelperCode,
    required bool isStartTrip,
  }) async {
    // if (driverHelper == "-Select-") {
    //   print("passing driverhelper code $driverHelper");
    //   getLatestTripData!.driverHelper = null;
    // } else {
    //   print("passing driverhelper code $driverHelperCode");
    //   getLatestTripData!.driverHelper!.code = driverHelperCode;
    // }
    print("passing driverhelper code $driverHelper");
    print("passing driverhelper code $driverHelperCode");
    if (driverHelper == "--Select--") {
      log("Doesn't have driver helper");
      getLatestTripData!.driverHelper = null;
    } else {
      log("Have driver helper");

      getLatestTripData!.driverHelper!.code = driverHelperCode;
    }
    if (isStartTrip == true) {
      getLatestTripData!.startOdoMeterReading =
          latestOdometerReading; // pass according to status
    } else if (isStartTrip == false) {
      getLatestTripData!.endOdoMeterReading =
          latestOdometerReading; // pass according to status
    }
    getLatestTripData!.tripStatus = tripStatus;
    print("Last Odometer reading");
    // print(getLatestTripData!.vehicle.lastOdometerRecorded);
    print(getLatestTripData!.toJson());

    bool isInternetAvailable = await HelperMethods.checkInternetConnection();
    if (isInternetAvailable == true) {
      try {
        final tripStatus = await qrScanTripFlowRepo.postOdometerReading(
            objectOfLatesTripData: getLatestTripData, token: driverToken);
        if (tripStatus.status == true) {
          setState(() {
            isButtonLoading = false;
          });
          String message = "Request submitted successfully";
          if (buttonText == "Start Trip") {
            message = "Trip started successfully";
          } else {
            message = "Trip Ended  successfully";
          }
          // Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ServiceRaisedScreen(
                message: message,
                isTrip: true,
                driverToken: driverToken,
              ),
            ),
          );

          print("Success");
        } else if (tripStatus.status == false) {
          setState(() {
            isButtonLoading = false;
          });
          getQRData();
          customErrorToast(tripStatus.message);
        } else {
          setState(() {
            isButtonLoading = false;
          });
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ErrorScreen(),
            ),
          );
          print("Failed");
        }
      } catch (e) {
        setState(() {
          isButtonLoading = false;
        });
        print(e);
      }
    } else {
      setState(() {
        isButtonLoading = false;
      });
      customErrorToast("Check your Internet connection and try again!");
    }
  }

  String returnDriverHelperCode(String drivername) {
    String code = "";
    for (UserListByRoleResponse value in driverHelpers) {
      if (value.value == drivername) {
        code = value.key;
        break;
      } else {
        code = "";
      }
    }
    print("Driver Helper code is $code");
    return code;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Trip'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: customBlueColor,
              ),
            )
          : hasData
              ? isAssetUndermaintenance
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.5,
                            child: Image.asset(
                                'assets/images/under_maintenance.png'),
                          ),
                          const Text(
                            "Vehicle Under maintenance",
                            style: body1,
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14, left: 14),
                            child: Text(
                              "Vehicle Id: $vehicleId",
                              style: headingSmall,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(14),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                EntityWidget(
                                  title: "Route :",
                                  value: route,
                                ),
                                EntityWidget(
                                  title: "Customer :",
                                  value: customer,
                                ),
                                EntityWidget(
                                  title: "Location :",
                                  value: pickup,
                                ),
                                EntityWidget(
                                  title: "Pickup/Drop :",
                                  value: drop,
                                ),
                                EntityWidget(
                                  title: "Schedule Start :",
                                  value: DateFormat('dd/MM/yyyy HH:mm:ss')
                                      .format(scheduleStart),
                                ),
                                EntityWidget(
                                  title: "Actual Start :",
                                  value: DateFormat('dd/MM/yyyy HH:mm:ss')
                                      .format(actualStart),
                                ),
                              ],
                            ),
                          ),
                          isDifferentDriver
                              ? Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(14),
                                    padding: const EdgeInsets.all(8),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      "Another driver has an ongoing trip\non this vehicle",
                                      textAlign: TextAlign.center,
                                      style: body1W,
                                    ),
                                  ),
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 14),
                                      child: Text(
                                        "Driver Helper",
                                        style: body1,
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: size.width,
                                      margin: const EdgeInsets.only(
                                          top: 8, left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IgnorePointer(
                                          ignoring: startFilled,
                                          child: DropdownButton<String>(
                                            underline: Container(),
                                            focusColor: Colors.white,
                                            value: selectedValue,
                                            isExpanded: true,
                                            elevation: 2,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            iconEnabledColor: Colors.black,
                                            items: driversList
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
                                            hint: Text(
                                              driverHelper,
                                              style: startFilled
                                                  ? const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400)
                                                  : const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value;
                                                driverHelper = selectedValue ??
                                                    "--Select--";
                                                print(value);
                                                driverHelperCode =
                                                    returnDriverHelperCode(
                                                        value.toString());
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 14),
                                      child: Text(
                                        "Trip Start Odometer",
                                        style: body1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: TextFormField(
                                          readOnly: startReadOnly,
                                          controller: startOdometerController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade300,
                                            filled: startFilled,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            hintText: "Start Odometer reading",
                                            contentPadding:
                                                const EdgeInsets.only(left: 8),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onFieldSubmitted: (value) {
                                            // getLatestTripData!.startOdoMeterReading =
                                            //     int.parse(value);
                                            // print(getLatestTripData!.startOdoMeterReading);
                                          },
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 14),
                                      child: Text(
                                        "Trip End Odometer",
                                        style: body1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: endOdometerController,
                                          keyboardType: TextInputType.number,
                                          readOnly: endReadOnly,
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade300,
                                            filled: endFilled,
                                            hintText: "End Odometer reading",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(left: 8),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        print(notStarted);
                                        print(
                                            "Button Latest Odometer $latestOdometerReading");
                                        print(startOdometerController.text);
                                        print(endOdometerController.text);
                                        if (notStarted == true) {
                                          if (startOdometerController.text ==
                                              "") {
                                            customErrorToast(
                                                "Enter Start Odometer Reading value");
                                          } else if (int.parse(
                                                  startOdometerController
                                                      .text) <
                                              latestOdometerReading) {
                                            customErrorToast(
                                                "Current odometer reading cannot be lesser than the previously logged");
                                          } else {
                                            latestOdometerReading = int.parse(
                                                startOdometerController.text);
                                            print(
                                                "Passing Odometer Reading $latestOdometerReading");
                                            if (tripStatus == 0 ||
                                                tripStatus == 1) {
                                              setState(() {
                                                isButtonLoading = true;
                                              });
                                              startEndTrip(
                                                driverHelper: driverHelper,
                                                latestOdometerReading:
                                                    latestOdometerReading,
                                                tripStatus: 2,
                                                driverHelperCode:
                                                    driverHelperCode,
                                                isStartTrip: true,
                                              );
                                            }
                                          }
                                        } else if (notStarted == false) {
                                          if (endOdometerController.text ==
                                              "") {
                                            customErrorToast(
                                                "Enter End Odometer Reading value");
                                          } else if (int.parse(
                                                  endOdometerController.text) ==
                                              latestOdometerReading) {
                                            customErrorToast(
                                                "Start and end odometer reading cannot be same.");
                                          } else if (int.parse(
                                                  endOdometerController.text) <=
                                              latestOdometerReading) {
                                            customErrorToast(
                                                "Current odometer reading cannot be lesser than the previously logged");
                                          } else {
                                            latestOdometerReading = int.parse(
                                                endOdometerController.text);
                                            if (tripStatus == 2) {
                                              setState(() {
                                                isButtonLoading = true;
                                              });
                                              //!Change to 3
                                              startEndTrip(
                                                driverHelper: driverHelper,
                                                latestOdometerReading:
                                                    latestOdometerReading,
                                                tripStatus: 3,
                                                driverHelperCode:
                                                    driverHelperCode,
                                                isStartTrip: false,
                                              );
                                            }
                                          }
                                        }

                                        // if (notStarted == false &&
                                        //     endOdometerController.text == "") {
                                        //   customErrorToast(
                                        //       "Enter End Odometer Reading value");
                                        // } else if (notStarted == false &&
                                        //     int.parse(endOdometerController
                                        //             .text) <=
                                        //         latestOdometerReading) {
                                        //   customErrorToast(
                                        //       "Current odometer reading cannot be lesser than the previously logged");
                                        // } else {
                                        //   int latestOdometerReading = 0;
                                        //   if (notStarted == true) {
                                        //     latestOdometerReading = int.parse(
                                        //         startOdometerController.text);
                                        //   } else if (notStarted == true &&
                                        //       int.parse(startOdometerController
                                        //               .text) <=
                                        //           latestOdometerReading &&
                                        //       int.parse(startOdometerController
                                        //               .text) <=
                                        //           0) {
                                        //     customErrorToast(
                                        //         "Current odometer reading cannot be lesser than the previously logged or Zero");
                                        //   } else if (notStarted == false) {
                                        //     latestOdometerReading = int.parse(
                                        //         endOdometerController.text);
                                        //   }

                                        // }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: size.width,
                                        margin: const EdgeInsets.fromLTRB(
                                            14, 0, 14, 14),
                                        decoration: BoxDecoration(
                                          color: customGreenColor,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Center(
                                          child: isButtonLoading
                                              ? const CircularProgressIndicator(
                                                  color: Colors.white,
                                                )
                                              : Text(
                                                  buttonText,
                                                  style: body1W.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: size.height * 0.3,
                          width: size.width * 0.8,
                          child:
                              Image.asset('assets/images/no_data_image.png')),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "No Associated trip found",
                        style: headingSmall,
                      ),
                    ],
                  ),
                ),
    );
  }
}

class EntityWidget extends StatelessWidget {
  final String title;
  final String value;
  const EntityWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Text(
              title,
              style: body1,
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              value,
              style: body2,
            ),
          ),
        ],
      ),
    );
  }
}
