import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/all_food_response/all_food_response.dart';

class AllFoodRequest {
  Future allFoodRequest(
      ) async {
    try {
      Response response = await MyDio.getData(
          endPoint: allFoodEndPoint);
      printTest('allFoodRequestStatusCode ${response.statusCode}');
      printResponse('allFoodResponse ${response.data}');
      return AllFoodResponse.fromJson(response.data);
    } catch (error) {
      printError('allFoodError $error');
    }
  }
}
