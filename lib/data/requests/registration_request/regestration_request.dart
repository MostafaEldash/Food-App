import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/login_response/login_response.dart';

class RegistrationRequest {
  Future registrationRequest(
      {required String email,
      required String password,
      required String name,
      required String mobile}) async {
    try {
      Response response = await MyDio.postData(
          endPoint: registrationEndPoint,
          data: {"name":name,"email": email, "password": password,"mobile":mobile});
      printTest('registrationRequestStatusCode ${response.statusCode}');
      printResponse('registrationResponse ${response.data}');
      return LoginResponse.fromJson(response.data);
    } catch (error) {
      printError('registrationError $error');
    }
  }
}
