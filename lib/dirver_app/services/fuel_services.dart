import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../common/screens/splash_screen.dart';
import '../../utils/constant_values.dart';

class FuelServices {
  static Future<http.Response> postFuelRequest(
      {required String token,
      required int odometerReading,
      required String assetNo,
      required String requestType}) async {
    final url = Uri.parse("${BASE_URL}ServiceTickets/PostServiceTicket");
    final body = jsonEncode({
      "odometerReading": odometerReading,
      "assetNo": assetNo,
      "requestTypeId": requestType,
      "statusId": "SI",
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
}
