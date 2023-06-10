import 'dart:developer';
import 'package:bos_app/fuel_operator_app/services/fuel_operator_services.dart';
import '../models/category_response_model.dart';
import '../models/get_accessible_service_ticket_respose_model.dart';
import '../models/get_accessible_service_ticktes_response_model.dart';
import '../models/get_asset_by_id_response_model.dart';
import '../models/get_service_ticket_by_id_response_model.dart';
import '../models/get_vehicle_list_response.dart';

class FuelOperatorRepository {
  Future<List<GetAccessibleServiceRequestResponseModel>>
      getAccessibleServiceTickets({required String token}) async {
    try {
      log("IN Try");
      final response =
          await FuelOperatorServices.getAccessibleServiceTickets(token: token);
      if (response.statusCode == 200) {
        final result =
            getAccessibleServiceRequestResponseModelFromJson(response.body);
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

  Future<List<GetVehicleList>> getVehicleList({required String token}) async {
    try {
      log("IN Try");
      final response = await FuelOperatorServices.getVehicleList(token: token);
      if (response.statusCode == 200) {
        final result = getVehicleListFromJson(response.body);
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

  Future<GetAssetByIdResponseModel?> getAssetById(
      {required String token, required String assetId}) async {
    try {
      log("IN Try");
      final response = await FuelOperatorServices.getAssetById(
          token: token, assetId: assetId);
      if (response.statusCode == 200) {
        final result = getAssetByIdResponseModelFromJson(response.body);
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

  Future<List<CategoryResponseModel>?> getCategory({
    required String token,
  }) async {
    try {
      log("IN Try");
      final response = await FuelOperatorServices.getCategory(
        token: token,
      );
      if (response.statusCode == 200) {
        final result = categoryResponseModelFromJson(response.body);
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

  Future<GetServiceTicketByIdResponseModel?> getServiceTicketById(
      {required String token, required String id}) async {
    try {
      log("IN Try");
      final response = await FuelOperatorServices.getServiceTicketById(
        token: token,
        id: id,
      );
      if (response.statusCode == 200) {
        final result = getServiceTicketByIdResponseModelFromJson(response.body);
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

  Future<bool> postFuelRequest({
    required String token,
    required GetServiceTicketByIdResponseModel?
        getServiceTicketByIdResponseModel,
  }) async {
    try {
      log("IN Try");
      final response = await FuelOperatorServices.postFuelRequest(
        getServiceTicketByIdResponseModel: getServiceTicketByIdResponseModel,
        token: token,
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

  Future<List<GetAccessibleServiceTicketsResponseModel2>>
      getAccessibleServiceTicket2({
    required String token,
    required String vehicleId,
  }) async {
    try {
      log("IN Try");
      final response = await FuelOperatorServices.getAccessibleServieTicket2(
        vehicleId: vehicleId,
        token: token,
      );
      if (response.statusCode == 200) {
        final result =
            getAccessibleServiceTicketsResponseModel2FromJson(response.body);
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
}
