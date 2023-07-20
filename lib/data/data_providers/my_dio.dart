import 'package:dio/dio.dart';

import '../../core/constants.dart';

class MyDio{

  static Dio? dio;

  static dioInit(){
    dio = Dio(
        BaseOptions(
          baseUrl: baseURL,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async{
    dio!.options.headers['Authorization'] = 'Bearer $bearerToken';
    return await dio!.get(endPoint, queryParameters: query);
  }

  static Future<Response> getCategoryData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async{
    dio!.options.headers['Authorization'] = 'Bearer $bearerToken';
    dio!.options.headers['Accept'] = 'application/json';
    return await dio!.get(endPoint, queryParameters: query);
  }




  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async{
    dio!.options.headers = {
      'Content-Type': 'application/json'
    };
    dio!.options.headers['Authorization'] = 'Bearer $bearerToken';
    return await dio!.post(endPoint, queryParameters: query, data: data,);
  }

  static Future<Response> postImage({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async{
    dio!.options.headers = {
      'Content-Type': 'multipart/form-data'
    };
    dio!.options.headers['Authorization'] = 'Bearer $bearerToken';
    return await dio!.post(endPoint, queryParameters: query, data: data,);
  }
}