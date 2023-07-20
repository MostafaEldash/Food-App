part of 'food_search_cubit.dart';

@immutable
abstract class FoodSearchState {}

class SearchInitial extends FoodSearchState {}

class FoodWithNameLoadingState extends FoodSearchState {}

class FoodWithNameSuccessState extends FoodSearchState {}

class FoodWithNameErrorState extends FoodSearchState {}


