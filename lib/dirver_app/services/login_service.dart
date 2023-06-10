import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../components/error_toast.dart';
import '../../utils/custom_error_tost.dart';
import '../models/login_response_model.dart';

class LoginService {
  final httpClient = http.Client();
  LoginResponseModel _loginResponseModel = LoginResponseModel(
      id: 0,
      userName: "",
      email: "",
      firstName: "",
      lastName: "",
      token: "",
      rolesAsString: [],
      userCode: "",
      apiBaseUrl: "");

  Map<String, String>? customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=utf-8",
  };

  Future<LoginResponseModel> getLoginResponse(
      String userName, String password, String url) async {
    final body = jsonEncode({"userName": userName, "password": password});
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: body,
      );
      print("Response Body  ${response.body}");
      print(response.statusCode);
      if (response.statusCode == 200) {
        _loginResponseModel = loginResponseModelFromJson(response.body);
      } else {
        customErrorToast('Invalid username or password!');
      }
    } on SocketException catch (e) {
      ErrorToast.showErrorToast(e.message);
      print(e);
    }

    return _loginResponseModel;
  }
}
