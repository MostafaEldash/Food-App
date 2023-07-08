part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class FoodWithNameLoadingState extends SearchState {}
class FoodWithNameSuccessState extends SearchState {}
class FoodWithNameErrorState extends SearchState {}
