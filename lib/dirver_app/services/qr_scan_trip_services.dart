import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../common/screens/splash_screen.dart';
import '../../utils/constant_values.dart';
import '../models/trip_flow/latest_trip_data_lite.dart';

class QrScanTripService {
  //API Call to Scan QR Data
  static Future<http.Response> getQrData(
      {required String assetId, required String token}) async {
    final url = Uri.parse(
        "${BASE_URL}Trips/PostAssetDrivertAssociation?assetId=$assetId");
    print(url);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      print("Response  $response");
      return response;
    } catch (e) {
      print("Service Exception $e");
      rethrow;
    }
  }

  //Api Call to Get Latest Trip Data
  static Future<http.Response> getLatestTripData(
      {required String driverId,
      required String assetId,
      required String token}) async {
    final url = Uri.parse(
        "${BASE_URL}Trips/GetLatestTripLite?driverId=$driverId&assetId=$assetId");
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      print("Response  $response");
      return response;
    } catch (e) {
      print("Service Exception $e");
      rethrow;
    }
  }

  //API Call to get Latest Odometer Reading
  static Future<http.Response> getAssetById(
      {required String assetId, required String token}) async {
    final url = Uri.parse(
        "${BASE_URL}Trips/GetAssetById?assetId=$assetId&includeDocuments=false&isCode=true");
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      print("Response  $response");
      return response;
    } catch (e) {
      print("Service Exception $e");
      rethrow;
    }
  }

  //API Call for getting Drivers List
  static Future<http.Response> getUserListByRole(
      {required String token}) async {
    final url = Uri.parse("${BASE_URL}Common/GetUsersListByRole?role=SA04");
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      print("Response  $response");
      return response;
    } catch (e) {
      print("Service Exception $e");
      rethrow;
    }
  }

  static Future<http.Response> postOdometerReading(
      {required GetLatestTripDataLite? objectOfLatesTripData,
      required String token}) async {
    final url = Uri.parse("${BASE_URL}Trips/PostOdoMeterReadingLite");
    final body = json.encode(objectOfLatesTripData!.toJson());
    log(body);
    print(url);
    try {
      log("In PostOdoMeterReading Try");
      final response = await http.post(
        url,
        headers: {
          'Content-type': 'application/json',
          // 'Accept': 'text/plain',
          "Authorization": "Bearer $token"
        },
        body: json.encode(objectOfLatesTripData.toJson()),
      );

      print("Response  ${response.body}");
      return response;
    } catch (e) {
      print("IN Post Odometer Catch");
      print("Service Exception $e");
      rethrow;
    }
  }

  //To get list of trips after Starting/Ending the trip
  static Future<http.Response> getListOfTrips({required String token}) async {
    final url = Uri.parse("${BASE_URL}Trips/GetTripsSummaryAggByDriverId");
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      print("Response  $response");
      return response;
    } catch (e) {
      print("Service Exception $e");
      rethrow;
    }
  }
}
