import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/login_response/login_response.dart';

class LoginRequest {
  Future loginRequest({required String email, required String password}) async {
    try {
      Response response = await MyDio.postData(
          endPoint: loginEndPoint,
          data: {"email": email, "password": password});
      printTest('loginRequestStatusCode ${response.statusCode}');
      printResponse('loginResponse ${response.data}');
      return LoginResponse.fromJson(response.data);
    } catch (error) {
      printError('loginError $error');
    }
  }
}
