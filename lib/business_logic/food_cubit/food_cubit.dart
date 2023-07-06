import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/requests/all_food_request/all_food_request.dart';
import '../../data/responses/all_food_response/all_food_response.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  static FoodCubit get(context) => BlocProvider.of<FoodCubit>(context);

  AllFoodResponse  allFoodResponse = AllFoodResponse();

  void getAllFood(){
    emit(AllFoodLoadingState());
    AllFoodRequest().allFoodRequest().then((value)  {
      allFoodResponse = value;
      emit(AllFoodSuccessState());
    }).catchError((error) {
      emit(AllFoodErrorState());
    }
    );
  }
  
}
