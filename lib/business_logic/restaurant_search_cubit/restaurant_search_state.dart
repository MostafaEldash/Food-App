part of 'restaurant_search_cubit.dart';

@immutable
abstract class RestaurantSearchState {}

class RestaurantSearchInitial extends RestaurantSearchState {}

class RestaurantWithNameLoadingState extends RestaurantSearchState {}

class RestaurantWithNameSuccessState extends RestaurantSearchState {}

class RestaurantWithNameErrorState extends RestaurantSearchState {}
