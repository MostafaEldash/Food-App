import 'package:dio/dio.dart';
import 'package:food_ninja/business_logic/registration_cubit/registration_cubit.dart';
import 'package:food_ninja/core/my_cache_keys.dart';
import 'package:food_ninja/data/local/mycache.dart';
import 'package:food_ninja/data/responses/profile_image_response/profile_image_response.dart';
import '../../../core/constants_methods.dart';
import '../../../core/end_points.dart';
import '../data_providers/my_dio.dart';


class ProfileImageRequest {
  Future profileImageRequest(
      ) async {
    try {
      Response response = await MyDio.postImage(
          endPoint: "${profileImageEndPoint}${MyCache.getString(key: MyCacheKeys.profileId)}",
          data: {"avatar":RegistrationCubit.image});
      printTest('profileImageRequestStatusCode ${response.statusCode}');
      printResponse('profileImageResponse ${response.data}');
      return ProfileImageResponse.fromJson(response.data);
    } catch (error) {
      printError('profileImageError $error');
    }
  }
}
