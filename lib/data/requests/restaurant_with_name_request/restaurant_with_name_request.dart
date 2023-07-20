import 'package:dio/dio.dart';
import 'package:food_ninja/data/responses/restaurant_response/restaurant_response.dart';
import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';

class RestaurantWithNameRequest {
  Future restaurantWithNameRequest(
      {required String restaurantName}
      ) async {
    try {
      Response response = await MyDio.getData(
          endPoint: "$restaurantFilterEndPoint$restaurantName");
      printTest('restaurantWithNameRequestStatusCode ${response.statusCode}');
      printResponse('restaurantWithNameResponse ${response.data}');
      return RestaurantResponse.fromJson(response.data);
    } catch (error) {
      printError('restaurantWithNameError $error');
    }
  }
}
