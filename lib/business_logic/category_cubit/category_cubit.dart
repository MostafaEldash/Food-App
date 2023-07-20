import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/data/responses/category_response/category_response.dart';
import 'package:meta/meta.dart';

import '../../data/requests/category_request/category_request.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of<CategoryCubit>(context);

  CategoryResponse categoryResponse = CategoryResponse();

  void getCategoriesFood(){
    emit(CategoryLoadingState());
    CategoryRequest().categoryRequest().then((value)  {
      categoryResponse = value;
      emit(CategorySuccessState());
    }).catchError((error) {
      emit(CategoryErrorState());
    }
    );
  }


}
