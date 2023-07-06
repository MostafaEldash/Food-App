import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../core/my_cache_keys.dart';
import '../data/local/mycache.dart';
import '../data/models/onboardingmodel.dart';
import '../presentation/screens/cart_screen/cart_screen.dart';
import '../presentation/screens/chat_screen/chat_screen.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/profile_screen/profile_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  // onBoarding
  bool isShown = false;

  // password
  IconData suffixIcon = Icons.visibility;
  bool isHidden = true;

  // app background picture
  List<String> background = [
    'assets/Pattern (1).svg',
    'assets/Pattern (3).svg',
  ];

  // keep user signed check button value
  bool keepMeSignedIn = false;

  bool offersEmail = false;

  final List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        image: 'assets/Illustartion(1).png',
        body:
            'Here You Can find a chef or dish for every\n taste and color. Enjoy!',
        title: 'Find your  Comfort \n Food here'),
    OnBoardingModel(
        image: 'assets/Illustration(2).png',
        body: 'Enjoy a fast and smooth food delivery at\n your doorstep',
        title: 'Food Ninja is Where Your Comfort Food Lives')
  ];

  int currentIndex = 0;

  List<Widget> bottomNavBarScreens = [
    const HomeScreen(),
    const ProfileScreen(),
    const CartScreen(),
    const ChatScreen()
  ];

  List<String> appBarTitles = ['Home', 'Profile', 'Cart', 'Chat'];

  void changeScreenIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void finishOnBoarding(BuildContext context) {
    isShown = true;
    MyCache.putBool(key: MyCacheKeys.isOnBoardingViewed, value: isShown);
    Navigator.pushNamedAndRemoveUntil(
        context, screens.signUpScreen, (route) => false);
  }

  bool checkIsShawn() {
    return MyCache.getBool(key: MyCacheKeys.isOnBoardingViewed);
  }

  void showAndHidePassword() {
    if (isHidden) {
      suffixIcon = Icons.visibility_off;
    } else {
      suffixIcon = Icons.visibility;
    }
    isHidden = !isHidden;
    if (isHidden) {
      emit(AppPasswordHidden());
    } else {
      emit(AppPasswordShawn());
    }
  }

  bool changeKeepMeSigned() {
    keepMeSignedIn = !keepMeSignedIn;
    emit(KeepMeSignedINState());
    return keepMeSignedIn;
  }

  bool changeOffersEmail() {
    offersEmail = !offersEmail;
    emit(OffersEmailState());
    return offersEmail;
  }
}
