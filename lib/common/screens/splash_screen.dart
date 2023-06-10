// ignore_for_file: use_build_context_synchronously
import 'package:bos_app/common/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../dirver_app/screens/driver_home_screen.dart';
import '../../fuel_operator_app/screens/approved_fuel_request.dart';
import '../../utils/constant_values.dart';
import '../../utils/theme_data.dart';

String BASE_URL = "";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Box loginBox;

  @override
  void initState() {
    super.initState();
    loginBox = Hive.box(LOGIN_BOX);
    persistanceLogin();
  }

  persistanceLogin() async {
    Future.delayed(const Duration(seconds: 2), () async {
      String operatorType = await loginBox.get(OPERATOR_TYPE) ?? "";
      BASE_URL = await loginBox.get(API_BASE_URL) ?? "";
      print("Operator Type $operatorType");
      print("Base URL $BASE_URL");
      if (operatorType == 'Driver') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const DriverHomeScreen(),
            ),
            (Route<dynamic> route) => false);
      } else if (operatorType == 'Fuel Operator') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ApprovedFuelRequestScreen(),
            ),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: customBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.3,
              width: size.width * 0.7,
              child: Image.asset('assets/images/app_logo.png',
                  fit: BoxFit.contain),
            ),
            // const SizedBox(
            //   height: 14,
            // ),
            // const Center(
            //   child: CircularProgressIndicator(
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
