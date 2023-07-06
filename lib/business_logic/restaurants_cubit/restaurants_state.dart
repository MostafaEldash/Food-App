part of 'restaurants_cubit.dart';

@immutable
abstract class RestaurantsState {}

class RestaurantsInitial extends RestaurantsState {}

class RestaurantLoadingState extends RestaurantsState {}

class RestaurantSuccessState extends RestaurantsState {}

class RestaurantErrorState extends RestaurantsState {}

class OneRestaurantLoadingState extends RestaurantsState {}

class OneRestaurantSuccessState extends RestaurantsState {}

class OneRestaurantErrorState extends RestaurantsState {}
