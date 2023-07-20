import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/requests/restaurant_with_name_request/restaurant_with_name_request.dart';
import '../../data/responses/restaurant_response/restaurant_response.dart';

part 'restaurant_search_state.dart';

class RestaurantSearchCubit extends Cubit<RestaurantSearchState> {
  RestaurantSearchCubit() : super(RestaurantSearchInitial());

  static RestaurantSearchCubit get(context) => BlocProvider.of<RestaurantSearchCubit>(context);


  RestaurantResponse restaurantResponse = RestaurantResponse();


  void getRestaurantWithName({required String restaurantName}) {
    emit(RestaurantWithNameLoadingState());
    RestaurantWithNameRequest()
        .restaurantWithNameRequest(restaurantName: restaurantName)
        .then(
          (value) {
        restaurantResponse = value;
        emit(RestaurantWithNameSuccessState());
      },
    ).catchError(
          (error) {
        emit(RestaurantWithNameErrorState());
      },
    );
  }


}
