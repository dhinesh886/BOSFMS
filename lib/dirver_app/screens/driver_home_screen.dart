import 'package:bos_app/common/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/constant_values.dart';
import '../../utils/custom_error_tost.dart';
import '../../utils/helper_methods.dart';
import '../../utils/theme_data.dart';
import '../repository/qr_scan_trip_flow_repo.dart';
import '../widgets/dashboard_widget.dart';
import '../widgets/logout_dialog.dart';
import 'fuel_screen.dart';
import 'maintenance_screen.dart';
import 'qr_response_screen.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  late Box userInfoBox;
  late Box loginBox;
  late UserInfo userInfoData;
  QrScanTripFlowRepo qrScanTripFlowRepo = QrScanTripFlowRepo();

  @override
  void initState() {
    super.initState();
    userInfoBox = Hive.box(USER_INFO_BOX);
    userInfoData = userInfoBox.get('token');
    driverToken = userInfoData.userToken;
    loginBox = Hive.box(LOGIN_BOX);
    firstName = loginBox.get(FIRST_NAME);
    lastName = loginBox.get(LAST_NAME);
    userId = loginBox.get(USER_ID);
    print(firstName);
    print("Driver Token");
    print(userInfoData.userToken);
    print("User Id");
    print(userId);
  }

  XFile? qrImage;
  String base64String = "";
  String result = "Hello World...!";
  String driverToken = "";
  String firstName = "";
  String lastName = "";
  String userId = "";

  String extractLast36Chars(String str) {
    if (str.length <= 36) {
      return str;
    } else {
      return str.substring(str.length - 36);
    }
  }

  //Scanning QR Code
  Future _scanQR() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QrResponseScreen(
          // assetId: extractedAssetId,
          assetId: "70ab141b-c689-4fc4-802d-ba43e5458554",
          driverToken: driverToken,
          userId: userId,
        ),
      ),
    );

    // bool isInternetAvailable = await HelperMethods.checkInternetConnection();
    // if (isInternetAvailable == true) {
    //   try {
    //     String? qrResult = await MajaScan.startScan(
    //         title: "Scan QRcode",
    //         barColor: customAppBarColor,
    //         titleColor: Colors.white,
    //         qRCornerColor: Colors.blue,
    //         qRScannerColor: Colors.blue,
    //         flashlightEnable: true,
    //         scanAreaScale: 0.7);
    //     if (qrResult != "0" || qrResult != "-1") return;
    //     var scanLink = qrResult!.substring(0, qrResult.length - 1);
    //     var extractedLink = extractLast36Chars(scanLink);
    //     log("Extracted Link $extractedLink");
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (context) => QrResponseScreen(
    //           userId: userId,
    //           assetId: extractedLink,
    //           // assetId: "c20e2c7f-99a2-436f-b232-2b86f0ccafea",
    //           driverToken: driverToken,
    //         ),
    //       ),
    //     );
    //     // var cameraStatus = await Permission.camera.status;
    //     // if (cameraStatus.isGranted) {
    //     //   String? cameraScanResult = await scanner.scan();
    //     //   // String? cameraScanResultPhoto = await scanner.scanPhoto();
    //     //   // https://bosapps.net/arsfms/assetscan/c33389b0-7df4-48a7-9130-c1f5932457a1/
    //     //   var scanLink =
    //     //       cameraScanResult!.substring(0, cameraScanResult.length - 1);
    //     //   var extractedLink = extractLast36Chars(scanLink);
    //     //   log("Extracted Link $extractedLink");
    //     //   Navigator.of(context).push(
    //     //     MaterialPageRoute(
    //     //       builder: (context) => QrResponseScreen(
    //     //         userId: userId,
    //     //         assetId: extractedLink,
    //     //         // assetId: "c20e2c7f-99a2-436f-b232-2b86f0ccafea",
    //     //         driverToken: driverToken,
    //     //       ),
    //     //     ),
    //     //   );
    //     // } else {
    //     //   var isGrant = await Permission.camera.request();
    //     //   if (isGrant.isGranted) {
    //     //     String? cameraScanResult = await scanner.scan();
    //     //     // String? cameraScanResultPhoto = await scanner.scanPhoto();
    //     //     print(cameraScanResult!.substring(37, 1));
    //     //     // setState(() {
    //     //     //   result =
    //     //     //       cameraScanResult; // setting string result with cameraScanResult
    //     //     // });
    //     //     var scanLink =
    //     //         cameraScanResult.substring(0, cameraScanResult.length - 1);
    //     //     var extractedLink = extractLast36Chars(scanLink);
    //     //     log("Extracted Link $extractedLink");
    //     //     Navigator.of(context).push(
    //     //       MaterialPageRoute(
    //     //         builder: (context) => QrResponseScreen(
    //     //           userId: userId,
    //     //           assetId: result,
    //     //           driverToken: driverToken,
    //     //         ),
    //     //       ),
    //     //     );
    //     //   }
    //     // }
    //   } on Exception catch (e) {
    //     customErrorToast(e.toString());
    //     print(e);
    //   }
    // } else {
    //   customErrorToast("Check your Internet connection and try again!");
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
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
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              color: customBlueColor,
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "$firstName, $lastName",
                    style: headingMediumW.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text("Welcome to BOS FMS",
                      style: body1W.copyWith(fontWeight: FontWeight.w400))
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.2,
              right: 10,
              left: 10,
              child: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            DashboardWidget(
                              iconWidget: const Icon(
                                Icons.settings_outlined,
                                size: 64,
                                color: Colors.green,
                              ),
                              title: "Maintenance",
                              size: size,
                              onTap: () async {
                                bool isInternetAvailable = await HelperMethods
                                    .checkInternetConnection();
                                if (isInternetAvailable == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MaintenanceScreen(
                                            token: driverToken,
                                            userId: userId,
                                          )));
                                } else {
                                  customErrorToast(
                                      "Check your Internet connection and try again!");
                                }
                              },
                            ),
                            const Spacer(),
                            DashboardWidget(
                              iconWidget: const Icon(
                                Icons.oil_barrel_outlined,
                                size: 64,
                                color: Colors.red,
                              ),
                              title: "Fuels",
                              size: size,
                              onTap: () async {
                                bool isInternetAvailable = await HelperMethods
                                    .checkInternetConnection();
                                if (isInternetAvailable == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => FuelScreen(
                                            userId: userId,
                                            token: driverToken,
                                          )));
                                } else {
                                  customErrorToast(
                                      "Check your Internet connection and try again!");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(14),
                      //   child: Row(
                      //     children: [
                      //       DashboardWidget(
                      //         iconWidget: const Icon(
                      //           Icons.map_outlined,
                      //           size: 64,
                      //           color: Colors.orange,
                      //         ),
                      //         title: "Trips",
                      //         size: size,
                      //         onTap: () {},
                      //       ),
                      //       const Spacer(),
                      //       DashboardWidget(
                      //         iconWidget: const Icon(
                      //           Icons.person_outlined,
                      //           size: 64,
                      //           color: Colors.blue,
                      //         ),
                      //         title: "Profile",
                      //         size: size,
                      //         onTap: () {
                      //           Navigator.of(context).push(MaterialPageRoute(
                      //               builder: (context) =>
                      //                   const ProfileScreen()));
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: customBlueColor,
        onPressed: () async {
          _scanQR();
          print(result);
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
    );
  }
}
