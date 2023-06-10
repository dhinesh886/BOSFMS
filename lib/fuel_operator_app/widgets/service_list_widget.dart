import 'package:flutter/material.dart';

import '../../utils/theme_data.dart';

class ServiceListWidget extends StatelessWidget {
  final String dateTime;
  // final String fuel;
  final String id;
  final String fuelEconomy;
  const ServiceListWidget({
    super.key,
    required this.dateTime,
    required this.id,
    // required this.fuel,
    required this.fuelEconomy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 30,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: customAppBarColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "ID :",
                    style: body1W,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Text(
                    id,
                    style: body2W.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text(
                        "Requested Date:",
                        style: body1,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        dateTime,
                        style: body2.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text(
                        "Fuel Economy:",
                        style: body1,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        fuelEconomy,
                        style: body2.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
