import 'package:flutter/material.dart';

import '../../common/screens/login_screen.dart';
import '../../main.dart';
import '../../utils/constant_values.dart';
import '../../utils/theme_data.dart';

Future<dynamic> logoutAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () async {
                await loginBox.put(OPERATOR_TYPE, "");
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (Route<dynamic> route) => false);
              },
              child: Text(
                "YES",
                style: body2.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "NO",
                style: body2.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        );
      });
}
