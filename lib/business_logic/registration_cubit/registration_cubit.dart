import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/data/responses/profile_image_response/profile_image_response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../core/my_cache_keys.dart';
import '../../data/local/mycache.dart';
import '../../data/requests/profile_image_request.dart';
import '../../data/requests/registration_request/regestration_request.dart';
import '../../data/responses/registration_response/resgistration_response.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(context) =>
      BlocProvider.of<RegistrationCubit>(context);

  RegistrationResponse registrationResponse = RegistrationResponse();
  ProfileImageResponse profileImageResponse = ProfileImageResponse();

  static File image=File('');

  final imagePicker = ImagePicker();

  uploadCameraImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

  uploadFromGalleryImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

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
        MyCache.putString(key: MyCacheKeys.name, value: name);
        MyCache.putString(key: MyCacheKeys.email, value: email);
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

  void uploadPhoto() {
    emit(ImageLoadingState());
    ProfileImageRequest().profileImageRequest()
        .then((value) {
      profileImageResponse = value;
      MyCache.putString(key: MyCacheKeys.profileImage, value: image.path);
      emit(ImageSuccessState());
    }).catchError((error) {
      emit(ImageFailedState());
    });
  }
}
