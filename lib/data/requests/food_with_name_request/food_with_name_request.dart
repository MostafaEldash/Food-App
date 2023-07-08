import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/all_food_response/all_food_response.dart';

class FoodWithNameRequest {
  Future foodWithNameRequest(
  {required String foodName}
      ) async {
    try {
      Response response = await MyDio.getData(
          endPoint: "$foodFilterEndPoint$foodName");
      printTest('allFoodRequestStatusCode ${response.statusCode}');
      printResponse('allFoodResponse ${response.data}');
      return AllFoodResponse.fromJson(response.data);
    } catch (error) {
      printError('allFoodError $error');
    }
  }
}
