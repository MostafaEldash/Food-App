import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/requests/one_restaurant_request/one_restaurant_request.dart';
import '../../data/requests/restaurant_request/restaurant_request.dart';
import '../../data/responses/one_restaurant_respone/one_restaurant_response.dart';
import '../../data/responses/restaurant_response/restaurant_response.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit() : super(RestaurantsInitial());

  static RestaurantsCubit get(context) => BlocProvider.of<RestaurantsCubit>(context);

  RestaurantResponse  restaurantsResponse = RestaurantResponse();
  OneRestaurantResponse  oneRestaurantResponse = OneRestaurantResponse();

  void getRestaurants(){
    emit(RestaurantLoadingState());
    RestaurantsRequest().restaurantsRequest().then((value)  {
      restaurantsResponse = value;
      emit(RestaurantSuccessState());
    }).catchError((error) {
      emit(RestaurantErrorState());
    }
    );
  }
  void getOneRestaurant({required String id}){
    emit(OneRestaurantLoadingState());
    OneRestaurantRequest().oneRestaurantRequest(id: id).then((value)  {
      oneRestaurantResponse = value;
      emit(OneRestaurantSuccessState());
    }).catchError((error) {
      emit(OneRestaurantErrorState());
    }
    );
  }

}
