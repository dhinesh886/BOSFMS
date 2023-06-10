import 'dart:developer';

import 'package:bos_app/dirver_app/services/maintenance_services.dart';

import '../models/maintainence/get_associated_asset_model.dart';
import '../models/maintainence/key_value_by_header_id_model.dart';
import '../models/maintainence/request_type_response_model.dart';

class MaintenanceRepo {
  Future<List<GetAssociatedAsset>?> getAssetById(
      {required String userId, required String token}) async {
    try {
      log("IN Try");
      final response = await MaintenanceServices.getAssociatedAssets(
          userId: userId, token: token);
      if (response.statusCode == 200) {
        final result = getAssociatedAssetFromJson(response.body);
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

  Future<List<KeyValueByHeaderIdModel>?> getKeyValueByHeaderId(
      {required String token}) async {
    try {
      log("IN Try");
      final response =
          await MaintenanceServices.getKeyValueByHeaderId(token: token);
      if (response.statusCode == 200) {
        final result = keyValueByHeaderIdModelFromJson(response.body);
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

  Future<bool> postServiceRequest({
    required String token,
    required String subCategoryId,
    required int odometerReading,
    required String requestTypeId,
    required String assetNo,
    required String description,
    required String categoryId,
    required String statusId,
  }) async {
    try {
      log("IN Try");
      final response = await MaintenanceServices.postServiceRequest(
        token: token,
        subCategoryId: subCategoryId,
        odometerReading: odometerReading,
        requestTypeId: requestTypeId,
        assetNo: assetNo,
        description: description,
        categoryId: categoryId,
        statusId: statusId,
      );
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

  Future<List<RequestTypeResponseModel>?> getRequestType(
      {required String token}) async {
    try {
      log("IN Try");
      final response = await MaintenanceServices.getRequestType(token: token);
      if (response.statusCode == 200) {
        final result = requestTypeResponseModelFromJson(response.body);
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
}
