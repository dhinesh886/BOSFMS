import 'dart:developer';
import 'package:bos_app/dirver_app/services/fuel_services.dart';

class FuelRepo {
  Future<bool> postFuelRequest(
      {required String token,
      required int odometerReading,
      required String assetNo,
      required String requestType}) async {
    try {
      log("IN Try");
      final response = await FuelServices.postFuelRequest(
          token: token,
          odometerReading: odometerReading,
          assetNo: assetNo,
          requestType: requestType);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("IN Catch");
      log(e.toString());
      return false;
    }
  }
}
