import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../common/screens/splash_screen.dart';
import '../../utils/constant_values.dart';

class MaintenanceServices {
  static Future<http.Response> getAssociatedAssets(
      {required String userId, required String token}) async {
    final url = Uri.parse("${BASE_URL}Trips/GetAssociatedAsset?userId=$userId");
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

  static Future<http.Response> getKeyValueByHeaderId(
      {required String token}) async {
    final url = Uri.parse("${BASE_URL}Common/keyvaluebyheaderid/STSG");
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

  static Future<http.Response> postServiceRequest({
    required String token,
    required String subCategoryId,
    required int odometerReading,
    required String requestTypeId,
    required String assetNo,
    required String description,
    required String categoryId,
    required String statusId,
  }) async {
    final url = Uri.parse("${BASE_URL}ServiceTickets/PostServiceTicket");
    final body = jsonEncode({
      "subCategoryId": subCategoryId,
      "odometerReading": odometerReading,
      "requestTypeId": requestTypeId,
      "assetNo": assetNo,
      "description": description,
      "categoryId": categoryId,
      "statusId": statusId,
    });
    print(url);
    print(body.toString());
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: body,
      );
      print("Response  $response");
      return response;
    } catch (e) {
      print("Service Exception $e");
      rethrow;
    }
  }

  static Future<http.Response> getRequestType({required String token}) async {
    final url = Uri.parse("${BASE_URL}common/keyvaluebyheaderid/STT");
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
