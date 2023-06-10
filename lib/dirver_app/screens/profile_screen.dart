import 'package:flutter/material.dart';
import '../../utils/theme_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: customAppBarColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.3,
              width: size.width * 0.8,
              child: Image.asset('assets/images/no_data_image.png',
                  fit: BoxFit.contain),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "No data found",
              style: body1,
            ),
          ],
        ),
      ),
    );
  }
}
