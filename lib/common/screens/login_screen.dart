import 'package:bos_app/common/model/user_info.dart';
import 'package:bos_app/common/screens/splash_screen.dart';
import 'package:bos_app/dirver_app/services/login_service.dart';
import 'package:bos_app/utils/constant_values.dart';
import 'package:bos_app/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../dirver_app/screens/driver_home_screen.dart';
import '../../dirver_app/models/login_response_model.dart';
import '../../fuel_operator_app/screens/approved_fuel_request.dart';
import '../../utils/custom_error_tost.dart';
import '../../utils/helper_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Box userInfoBox;
  late Box loginBox;
  bool isLoading = false;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    userInfoBox = Hive.box(USER_INFO_BOX);
    loginBox = Hive.box(LOGIN_BOX);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  LoginResponseModel loginResponseModel = LoginResponseModel(
    id: 0,
    userName: "",
    email: "",
    firstName: "",
    lastName: "",
    token: "",
    rolesAsString: [],
    userCode: "",
    apiBaseUrl: "",
  );
  LoginService loginService = LoginService();

  signIn(String userName, String password) async {
    String url = "https://auth.bosapps.net/api/v1/Auth/login";
    print(url);
    bool isInternetAvailable = await HelperMethods.checkInternetConnection();
    if (isInternetAvailable == true) {
      try {
        loginResponseModel =
            await loginService.getLoginResponse(userName, password, url);
        final operatorType = loginResponseModel.rolesAsString[0];
        print("Operator Type $operatorType");
        if (operatorType == "Driver") {
          userInfoBox.put(
              'token', UserInfo(userToken: loginResponseModel.token));
          loginBox.put(API_BASE_URL, loginResponseModel.apiBaseUrl);
          loginBox.put(OPERATOR_TYPE, operatorType);
          loginBox.put(FIRST_NAME, loginResponseModel.firstName);
          loginBox.put(LAST_NAME, loginResponseModel.lastName);
          loginBox.put(USER_ID, loginResponseModel.userCode);
          BASE_URL = await loginBox.get(API_BASE_URL) ?? "";
          print("Base URL $BASE_URL");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const DriverHomeScreen(),
              ),
              (Route<dynamic> route) => false);
          setState(() {
            isLoading = false;
          });
        } else if (operatorType == "Fuel Operator") {
          setState(() {
            isLoading = false;
          });
          // customErrorToast('Invalid username or password!');
          userInfoBox.put(
              'token', UserInfo(userToken: loginResponseModel.token));
          loginBox.put(API_BASE_URL, loginResponseModel.apiBaseUrl);
          loginBox.put(OPERATOR_TYPE, operatorType);
          loginBox.put(FIRST_NAME, loginResponseModel.firstName);
          loginBox.put(LAST_NAME, loginResponseModel.lastName);
          loginBox.put(USER_ID, loginResponseModel.userCode);
          BASE_URL = await loginBox.get(API_BASE_URL) ?? "";
          print("Base URL $BASE_URL");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ApprovedFuelRequestScreen(),
              ),
              (Route<dynamic> route) => false);
        } else {
          customErrorToast('Invalid username or password!');
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        // customErrorToast('Invalid username or password!');
        setState(() {
          isLoading = false;
        });
        print(e);
      }
    } else {
      setState(() {
        isLoading = false;
      });
      customErrorToast("Check your Internet connection and try again!");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height * 0.35,
                  color: customBlueColor,
                  padding: const EdgeInsets.all(24),
                  child: FractionallySizedBox(
                    heightFactor: 0.4,
                    widthFactor: 0.4,
                    child: Image.asset(
                      'assets/images/app_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 14, right: 14, bottom: 8),
                  child: TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      suffixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter user name";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 14, right: 14, bottom: 8),
                  child: TextFormField(
                    focusNode: passwordFocusNode,
                    controller: _passwordController,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: hidePassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // const Text(
                      //   'Forget password?',
                      //   style: TextStyle(fontSize: 12.0, color: Colors.blue),
                      // ),
                      const SizedBox(
                        height: 14,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(width, 50),
                            backgroundColor: customBlueColor),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            signIn(_userNameController.text,
                                _passwordController.text);
                          }
                        },
                        child: isLoading
                            ? const FittedBox(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Sign In',
                                style: body1W,
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                // GestureDetector(
                //   onTap: () {},
                //   child: const Text.rich(
                //     TextSpan(text: 'Don\'t have an account  ', children: [
                //       TextSpan(
                //         text: 'Signup',
                //         style: TextStyle(color: customBlueColor),
                //       ),
                //     ]),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
