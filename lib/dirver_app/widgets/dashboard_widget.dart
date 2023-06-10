import 'package:flutter/material.dart';

import '../../utils/theme_data.dart';

class DashboardWidget extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final void Function()? onTap;
  const DashboardWidget({
    super.key,
    required this.size,
    required this.iconWidget,
    required this.title,
    required this.onTap,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: size.height * 0.24,
          width: size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget,
                Text(
                  title,
                  style: body1,
                ),
              ],
            ),
          )),
    );
  }
}
