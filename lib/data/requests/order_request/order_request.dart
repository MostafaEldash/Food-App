import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/order_response/order_response.dart';

class OrderRequest {
  Future orderRequest({required num id, required num quantity}) async {
    try {
      Response response = await MyDio.postData(
          endPoint: createOrderEndPoint,
          data: {"food_id": id,
            "quantity": quantity});
      printTest('createOrderRequestStatusCode ${response.statusCode}');
      printResponse('createOrderResponse ${response.data}');
      return OrderResponse.fromJson(response.data);
    } catch (error) {
      printError('createOrderError $error');
    }
  }
}
