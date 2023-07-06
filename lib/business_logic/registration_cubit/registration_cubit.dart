import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/my_cache_keys.dart';
import '../../data/local/mycache.dart';
import '../../data/requests/registration_request/regestration_request.dart';
import '../../data/responses/registration_response/resgistration_response.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(context) =>
      BlocProvider.of<RegistrationCubit>(context);

  RegistrationResponse registrationResponse = RegistrationResponse();

  void register(
      {required String email,
      required String password,
      required String mobile,
      required String name,
      required bool keepMeSigned}) {
    emit(RegistrationLoadingState());
    RegistrationRequest()
        .registrationRequest(
            mobile: mobile, email: email, password: password, name: name)
        .then((value) {
      registrationResponse = value;
      if (keepMeSigned) {
        MyCache.putString(
            key: MyCacheKeys.token, value: registrationResponse.token);
        MyCache.putString(
            key: MyCacheKeys.profileId,
            value: registrationResponse.data.id.toString());
      }
      emit(RegistrationSuccessState());
    }).catchError((error) {
      emit(RegistrationFailedState());
    });
  }
}
