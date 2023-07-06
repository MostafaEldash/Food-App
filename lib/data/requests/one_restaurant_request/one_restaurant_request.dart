import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/login_response/login_response.dart';

class OneRestaurantRequest {
  Future oneRestaurantRequest(
  {required String id} ) async {
    try {
      Response response = await MyDio.getData(
          endPoint: '$restaurantEndPoint/$id');
      printTest('oneRestaurantRequestStatusCode ${response.statusCode}');
      printResponse('oneRestaurantResponse ${response.data}');
      return LoginResponse.fromJson(response.data);
    } catch (error) {
      printError('oneRestaurantError $error');
    }
  }
}
