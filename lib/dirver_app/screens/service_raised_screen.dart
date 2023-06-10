import 'package:bos_app/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'driver_home_screen.dart';
import 'list_of_trips.dart';

class ServiceRaisedScreen extends StatefulWidget {
  final String message;
  final bool isTrip;
  final String driverToken;
  const ServiceRaisedScreen(
      {Key? key,
      required this.message,
      required this.isTrip,
      required this.driverToken})
      : super(key: key);

  @override
  State<ServiceRaisedScreen> createState() => _ServiceRaisedScreenState();
}

class _ServiceRaisedScreenState extends State<ServiceRaisedScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
  }

  navigateToHomeScreen() async {
    Future.delayed(const Duration(seconds: 3), () {
      widget.isTrip
          ? {
              Navigator.of(context).pop(),
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TripList(
                        driverToken: widget.driverToken,
                      )))
            }
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const DriverHomeScreen(),
              ),
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.3,
              width: size.width * 0.5,
              child: widget.isTrip
                  ? Lottie.asset(
                      'assets/animation/truck_animation.json',
                      repeat: false,
                    )
                  : Lottie.asset(
                      'assets/animation/success_lottie.json',
                      repeat: false,
                    ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: body1,
            )
          ],
        ),
      ),
    );
  }
}
