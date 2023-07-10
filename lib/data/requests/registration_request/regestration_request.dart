import 'package:dio/dio.dart';
import 'package:food_ninja/core/my_cache_keys.dart';
import 'package:food_ninja/data/local/mycache.dart';
import 'package:food_ninja/data/responses/registration_response/resgistration_response.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/login_response/login_response.dart';

class RegistrationRequest {

  RegistrationResponse registrationResponse = RegistrationResponse();

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
      return RegistrationResponse.fromJson(response.data);
    } catch (error) {
      printError('registrationError $error');
    }
  }
}
