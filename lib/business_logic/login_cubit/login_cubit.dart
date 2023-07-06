import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;

import '../../core/my_cache_keys.dart';
import '../../data/local/mycache.dart';
import '../../data/requests/login_request/login_request.dart';
import '../../data/responses/login_response/login_response.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  LoginResponse loginResponse = LoginResponse();

  void login({required String email, required String password
  ,required BuildContext context
  }){
    emit(LoginLoadingState());
    LoginRequest().loginRequest(email: email, password: password).then((value)  {
      loginResponse = value;
      MyCache.putString(key: MyCacheKeys.token, value: loginResponse.token);
      MyCache.putString(key: MyCacheKeys.name, value: loginResponse.user.name);
      MyCache.putString(key: MyCacheKeys.email, value: loginResponse.user.email);
      MyCache.putString(key: MyCacheKeys.profileId, value: loginResponse.user.id.toString());
      Navigator.pushNamedAndRemoveUntil(context, screens.homeLayoutScreen, (route) => false);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    }
    );
  }
}
