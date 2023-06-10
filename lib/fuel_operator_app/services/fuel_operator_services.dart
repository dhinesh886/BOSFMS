import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../common/screens/splash_screen.dart';
import '../../utils/constant_values.dart';
import '../models/get_service_ticket_by_id_response_model.dart';

class FuelOperatorServices {
  static Future<http.Response> getAccessibleServiceTickets({
    required String token,
  }) async {
    final url =
        Uri.parse("${BASE_URL}ServiceTickets/GetAccessibleServiceTickets");
    final body = jsonEncode({
      "primaryKey": "",
      "secondaryKey": "FR",
      "additionalFilters": [
        {"key": "Status", "value": "SA"},
        {"key": "assetId", "value": ""}
      ]
    });
    print(url);
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

  static Future<http.Response> getVehicleList({
    required String token,
  }) async {
    final url = Uri.parse(
        "${BASE_URL}Trips/GetVehicleList?excludeUnderMaintenance=false");

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

  static Future<http.Response> getAssetById({
    required String token,
    required String assetId,
  }) async {
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

  static Future<http.Response> getCategory({
    required String token,
  }) async {
    final url = Uri.parse("${BASE_URL}Fuels/GetFuelProducts");

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

  static Future<http.Response> getServiceTicketById(
      {required String token, required String id}) async {
    final url = Uri.parse(
        "${BASE_URL}ServiceTickets/GetServiceTicketById?includeParts=true&id=$id");

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

  static Future<http.Response> postFuelRequest({
    required String token,
    required GetServiceTicketByIdResponseModel?
        getServiceTicketByIdResponseModel,
  }) async {
    final url = Uri.parse("${BASE_URL}ServiceTickets/PostServiceTicket");
    final body = jsonEncode(getServiceTicketByIdResponseModel);
    print(url);
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

  static Future<http.Response> getAccessibleServieTicket2(
      {required String token, required String vehicleId}) async {
    final url =
        Uri.parse("${BASE_URL}ServiceTickets/GetAccessibleServiceTickets");
    final body = jsonEncode({
      "secondaryKey": "FR",
      "additionalFilters": [
        {"key": "assetId", "value": vehicleId},
        {"key": "Status", "value": "WN"}
      ]
    });
    print(url);
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
}
