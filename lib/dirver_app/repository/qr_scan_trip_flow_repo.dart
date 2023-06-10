import 'dart:developer';
import '../models/trip_flow/latest_odometer_response.dart';
import '../models/trip_flow/latest_trip_data_lite.dart';
import '../models/trip_flow/post_odometerlite_response_model.dart';
import '../models/trip_flow/qr_scan_response_model.dart';
import '../models/trip_flow/user_list_by_role_response.dart';
import '../services/qr_scan_trip_services.dart';

class QrScanTripFlowRepo {
  Future<QrScanResponseModel?> getQrRepoData(
      {required String assetId, required String token}) async {
    try {
      log("IN Try");
      final response =
          await QrScanTripService.getQrData(assetId: assetId, token: token);
      if (response.statusCode == 200) {
        final result = qrScanResponseModelFromJson(response.body);
        print("Result $result");
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log("IN Catch");
      log(e.toString());
      return null;
    }
  }

  Future<GetLatestTripDataLite?> getLatestTripData(
      {required String driverId,
      required String assetId,
      required String token}) async {
    try {
      log("IN Get Latest Try");
      final response = await QrScanTripService.getLatestTripData(
          driverId: driverId, assetId: assetId, token: token);
      if (response.statusCode == 200) {
        final result = getLatestTripDataLiteFromJson(response.body);
        // log(result.toJson().toString());
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log("IN Get Latest Catch");
      log(e.toString());
      return null;
    }
  }

  Future<LatestOdometerResponse?> getAssetById(
      {required String assetId, required String token}) async {
    try {
      log("IN Try");
      final response =
          await QrScanTripService.getAssetById(assetId: assetId, token: token);
      if (response.statusCode == 200) {
        final result = latestOdometerResponseFromJson(response.body);
        print("Result $result");
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log("IN Catch");
      log(e.toString());
      return null;
    }
  }

  Future<List<UserListByRoleResponse>> getUserListByRole(
      {required String token}) async {
    try {
      log("IN Try");
      final response = await QrScanTripService.getUserListByRole(token: token);
      if (response.statusCode == 200) {
        final result = userListByRoleResponseFromJson(response.body);
        print("Result $result");
        return result;
      } else {
        return [];
      }
    } catch (e) {
      log("IN Catch");
      log(e.toString());
      return [];
    }
  }

  Future<PostOdometerLiteResponseModel> postOdometerReading(
      {required GetLatestTripDataLite? objectOfLatesTripData,
      required String token}) async {
    try {
      final response = await QrScanTripService.postOdometerReading(
          objectOfLatesTripData: objectOfLatesTripData, token: token);
      print("Status Code");
      print(response.statusCode);
      PostOdometerLiteResponseModel postOdometerLiteResponseModel;
      postOdometerLiteResponseModel =
          postOdometerLiteResponseModelFromJson(response.body);
      return postOdometerLiteResponseModel;
      // if (response.statusCode == 200) {
      //   print("Response $response");
      //   print("True");
      //   return true;
      // } else {
      //   print("Else Flase");
      //   return false;
      // }
    } catch (e) {
      print(e);
      return PostOdometerLiteResponseModel(
          status: false, message: "Something went wrong");
    }
  }
}
