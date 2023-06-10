import 'dart:convert';

import 'package:bos_app/utils/theme_data.dart';
import 'package:flutter/material.dart';
import '../models/trip_flow/list_of_trips_model.dart';
import '../services/qr_scan_trip_services.dart';

class TripList extends StatelessWidget {
  final String driverToken;
  const TripList({Key? key, required this.driverToken}) : super(key: key);

  Future<ListOfTrips?> getListOfTrips({required String token}) async {
    try {
      final response = await QrScanTripService.getListOfTrips(token: token);
      print("Status Code");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Response $response");
        print("True");
        return ListOfTrips.fromJson(jsonDecode(response.body));
      } else {
        print("Else Flase");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('My Profile'),
          backgroundColor: customAppBarColor,
        ),
        body: FutureBuilder(
          future: getListOfTrips(token: driverToken),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final tripList = snapshot.data as ListOfTrips;
              if (tripList.trip != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Welcome,",
                            style: headingMedium,
                          ),
                          Text(
                            tripList.driver!.name ?? "NA",
                            style: body1,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Total trips :  ${tripList.driver!.totalTrips}",
                            style: body1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: tripList.trip!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 80,
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
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14, top: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Vehicle Number",
                                            style: body1.copyWith(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            tripList.trip![index].code,
                                            style: body2.copyWith(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: customBlueColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          tripList.trip![index].noOfTrips
                                              .toString(),
                                          style: body1W,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                );
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width * 0.5,
                      child: Image.asset('assets/images/no_data_image.png'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "No trips found",
                      style: headingSmall,
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
  }
}
