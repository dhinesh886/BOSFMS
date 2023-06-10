import 'package:bos_app/fuel_operator_app/screens/fuel_request_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/theme_data.dart';

class FuelRequestListWidget extends StatelessWidget {
  final String vehicleId;
  final String vehicleCode;
  final String assetId;
  final String token;
  final String id;
  final Function() onTap;
  const FuelRequestListWidget(
      {super.key,
      required this.size,
      required this.vehicleId,
      required this.vehicleCode,
      required this.assetId,
      required this.token,
      required this.id,
      required this.onTap});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      width: size.width,

      margin: const EdgeInsets.all(14),
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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: customAppBarColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "ID:",
                      style: body1W.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      id,
                      style: body2W,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vehicle Id",
                          style: body1.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          vehicleId,
                          style: body2,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: customAppBarColor.withOpacity(0.2),
                        border: Border.all(color: customBlueColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Select",
                          style: body2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
