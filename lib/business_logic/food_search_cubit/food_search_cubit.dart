import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/data/requests/food_with_name_request/food_with_name_request.dart';
import 'package:food_ninja/data/responses/all_food_response/all_food_response.dart';
import 'package:meta/meta.dart';

part 'food_search_state.dart';

class FoodSearchCubit extends Cubit<FoodSearchState> {
  FoodSearchCubit() : super(SearchInitial());

  static FoodSearchCubit get(context) => BlocProvider.of<FoodSearchCubit>(context);

  AllFoodResponse allFoodResponse = AllFoodResponse();

  void getFoodWithName({required String foodName}) {
    emit(FoodWithNameLoadingState());
    FoodWithNameRequest().foodWithNameRequest(foodName: foodName).then(
      (value) {
        allFoodResponse = value;
        emit(FoodWithNameSuccessState());
      },
    ).catchError(
      (error) {
        emit(FoodWithNameErrorState());
      },
    );
  }


}
