part of 'food_cubit.dart';

@immutable
abstract class FoodState {}

class FoodInitial extends FoodState {}

class AllFoodLoadingState extends FoodState {}

class AllFoodSuccessState extends FoodState {}

class AllFoodErrorState extends FoodState {}
