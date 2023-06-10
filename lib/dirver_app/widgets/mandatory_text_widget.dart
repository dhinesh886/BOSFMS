import 'package:flutter/material.dart';

import '../../utils/theme_data.dart';
class MandatoryTextWidget extends StatelessWidget {
  final String title;
  const MandatoryTextWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: body1,
        ),
        const SizedBox(
          width: 4,
        ),
        const Text(
          "*",
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}