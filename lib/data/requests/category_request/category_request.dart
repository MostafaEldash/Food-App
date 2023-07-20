import 'package:dio/dio.dart';

import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../../data_providers/my_dio.dart';
import '../../responses/category_response/category_response.dart';

class CategoryRequest {
  Future categoryRequest() async {
    try {
      Response response = await MyDio.getCategoryData(
        endPoint: categoryEndPoint,);
      printTest('categoryRequestStatusCode ${response.statusCode}');
      printResponse('categoryResponse ${response.data}');
      return CategoryResponse.fromJson(response.data);
    } catch (error) {
      printError('categoryError $error');
    }
  }
}
