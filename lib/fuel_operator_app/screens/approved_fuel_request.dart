import 'dart:developer';
import 'package:bos_app/fuel_operator_app/repository/fuel_operator_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majascan/majascan.dart';
import '../../common/model/user_info.dart';
import '../../dirver_app/widgets/logout_dialog.dart';
import '../../utils/constant_values.dart';
import '../../utils/theme_data.dart';
import '../models/get_accessible_service_ticktes_response_model.dart';
import '../models/get_asset_by_id_response_model.dart';
import '../models/get_vehicle_list_response.dart';
import '../widgets/fuel_request_list_widget.dart';
import 'fuel_request_screen.dart';

class ApprovedFuelRequestScreen extends StatefulWidget {
  const ApprovedFuelRequestScreen({Key? key}) : super(key: key);

  @override
  State<ApprovedFuelRequestScreen> createState() =>
      _ApprovedFuelRequestScreenState();
}

class _ApprovedFuelRequestScreenState extends State<ApprovedFuelRequestScreen> {
  late Box userInfoBox;
  late Box loginBox;
  late UserInfo userInfoData;
  String fuelOperatorToken = "";
  late Future myFuture;
  FuelOperatorRepository fuelOperatorRepository = FuelOperatorRepository();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userInfoBox = Hive.box(USER_INFO_BOX);
    userInfoData = userInfoBox.get('token');
    loginBox = Hive.box(LOGIN_BOX);
    fuelOperatorToken = userInfoData.userToken;

    // myFuture =
    getAccessibleServieTickets();
    print("Fuel Operator Token");
    print(userInfoData.userToken);
  }

  getAccessibleServieTickets() async {
    try {
      await getVehicleList();
      List<GetAccessibleServiceRequestResponseModel>
          getAccessibleServiceRequestResponseModel =
          await fuelOperatorRepository.getAccessibleServiceTickets(
              token: fuelOperatorToken);
      apiList = getAccessibleServiceRequestResponseModel;
      filteredList = apiList;
      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      print(e);
    }
    // return getAccessibleServiceRequestResponseModel;
  }

  getVehicleList() async {
    log("In Get vehicle list");
    List<GetVehicleList> getVehicleList =
        await fuelOperatorRepository.getVehicleList(token: fuelOperatorToken);
    for (var value in getVehicleList) {
      vehicleList.add(value.value);
    }
    // setState(() {});
  }

  String? selectedValue;
  String fuelBase64String = "";
  String? result = "Hello World...!";
  List<String> vehicleList = ["--Select--"];
  List<GetAccessibleServiceRequestResponseModel> apiList = [];
  List<GetAccessibleServiceRequestResponseModel> filteredList = [];
  bool isLoading = true;

  String extractLast36Chars(String str) {
    if (str.length <= 36) {
      return str;
    } else {
      return str.substring(str.length - 36);
    }
  }

  //Scanning QR Code
  Future _scanQR() async {
    // String? qrResult = await MajaScan.startScan(
    //     title: "Scan QRcode",
    //     barColor: customBlueColor,
    //     titleColor: Colors.white,
    //     qRCornerColor: Colors.blue,
    //     qRScannerColor: Colors.blue,
    //     flashlightEnable: true,
    //     scanAreaScale: 0.7

    //     /// value 0.0 to 1.0
    //     );
    // log(qrResult.toString());
    try {
      String? qrResult = await MajaScan.startScan(
          title: "Scan QRcode",
          barColor: customAppBarColor,
          titleColor: Colors.white,
          qRCornerColor: Colors.blue,
          qRScannerColor: Colors.blue,
          flashlightEnable: true,
          scanAreaScale: 0.7);
      if (qrResult != "0" || qrResult != "-1") return;
      var scanLink = qrResult!.substring(0, qrResult.length - 1);
      var extractedLink = extractLast36Chars(scanLink);
      log("Extracted Link $extractedLink");
      GetAssetByIdResponseModel? getAssetResponseModel =
          await fuelOperatorRepository.getAssetById(
              token: fuelOperatorToken, assetId: extractedLink);
      searchController.text = getAssetResponseModel!.assetNo;
      setState(() {
        filteredList = apiList
            .where((item) => item.asset.code
                .toUpperCase()
                .contains(searchController.text.toUpperCase()))
            .toList();
      });
      // var cameraStatus = await Permission.camera.status;
      // if (cameraStatus.isGranted) {
      // String? cameraScanResult = await scanner.scan();
      // String? cameraScanResultPhoto = await scanner.scanPhoto();
      // }
      // else {
      //   var isGrant = await Permission.camera.request();
      //   if (isGrant.isGranted) {
      //     String? cameraScanResult = await scanner.scan();
      //     // String? cameraScanResultPhoto = await scanner.scanPhoto();
      //     var scanLink =
      //         cameraScanResult!.substring(0, cameraScanResult.length - 1);
      //     var extractedLink = extractLast36Chars(scanLink);
      //     log("Extracted Link $extractedLink");
      //     GetAssetByIdResponseModel? getAssetResponseModel =
      //         await fuelOperatorRepository.getAssetById(
      //             token: fuelOperatorToken, assetId: extractedLink);
      //     searchController.text = getAssetResponseModel!.assetNo;

      //     // setState(() {
      //     //   result =
      //     //       cameraScanResult; // setting string result with cameraScanResult
      //     // });
      //   }
      // }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("Filterd List $filteredList");
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Approved Fuel Requests'),
          backgroundColor: customAppBarColor,
          actions: [
            GestureDetector(
              onTap: () async {
                logoutAlertDialog(context);
              },
              child: Container(
                height: 36,
                margin: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                    // color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    // Text(
                    //   "Logout",
                    //   style: body3W,
                    // ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.logout_outlined,
                      size: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, bottom: 8),
              child: Text(
                "Vehicle Id",
                style: body1.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 45,
              width: size.width,
              margin: const EdgeInsets.only(
                  left: 14, top: 8, right: 14, bottom: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Icon(Icons.search),
                ),
                title: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 14)),
                  onChanged: (value) {
                    setState(() {
                      filteredList = apiList
                          .where((item) => item.asset.code
                              .toUpperCase()
                              .contains(value.toUpperCase()))
                          .toList();
                    });
                  },
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        filteredList = apiList;
                        searchController.text = "";
                        setState(() {});
                      }),
                ),
              ),
            ),
            isLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : filteredList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.3,
                              width: size.width * 0.5,
                              child: Image.asset(
                                  'assets/images/no_data_image.png'),
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
                      )
                    : Expanded(
                        child: RefreshIndicator(
                          onRefresh: () {
                            setState(() {
                              isLoading = true;
                            });
                            return Future.delayed(
                                const Duration(milliseconds: 200), () {
                              getAccessibleServieTickets();
                            });
                          },
                          child: ListView.builder(
                            itemCount: filteredList.length,
                            itemBuilder: ((context, index) {
                              return FuelRequestListWidget(
                                id: filteredList[index].id,
                                vehicleId: filteredList[index].asset.code,
                                assetId: filteredList[index].asset.id,
                                vehicleCode: filteredList[index].id,
                                token: fuelOperatorToken,
                                size: size,
                                onTap: () {
                                  Navigator.of(context)
                                      .push(
                                    MaterialPageRoute(
                                      builder: (context) => FuelRequestScreen(
                                        vehicleId:
                                            filteredList[index].asset.code,
                                        vehicleCode: filteredList[index].id,
                                        assetId: filteredList[index].asset.id,
                                        token: fuelOperatorToken,
                                      ),
                                    ),
                                  )
                                      .then((value) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    getAccessibleServieTickets();
                                  });
                                },
                              );
                            }),
                          ),
                        ),
                      ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: customBlueColor,
          onPressed: () {
            _scanQR();
          },
          label: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Icon(Icons.qr_code),
              ),
              Text(
                "Scan QR",
                style: body1W.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
