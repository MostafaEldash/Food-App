import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/restaurant_response/restaurant_response.dart';

class RestaurantsRequest {
  Future restaurantsRequest() async {
    try {
      Response response = await MyDio.getData(
          endPoint: restaurantEndPoint,);
      printTest('restaurantRequestStatusCode ${response.statusCode}');
      printResponse('restaurantResponse ${response.data}');
      return RestaurantResponse.fromJson(response.data);
    } catch (error) {
      printError('restaurantError $error');
    }
  }
}
