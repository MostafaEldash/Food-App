import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../screens/cart_screen/cart_screen.dart';
import '../screens/chat_screen/chat_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home_layout/home_layout.dart';
import '../screens/login/login_screen.dart';
import '../screens/onboarding/on_boarding_screen_first.dart';
import '../screens/onboarding/on_boarding_screen_second.dart';
import '../screens/profile_screen/profile_screen.dart';
import '../screens/signup/payment_method_screen.dart';
import '../screens/signup/sign_process.dart';
import '../screens/signup/sign_up.dart';
import '../screens/signup/signup_success.dart';
import '../screens/signup/upload_photo.dart';
import '../screens/signup/upload_photo_preview.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case screens.onBoardingScreenFirst:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreenFirst());
      case screens.onBoardingScreenSecond:
        return MaterialPageRoute(
            builder: (_) => const OnBoardingScreenSecond());
      case screens.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case screens.signUpSuccessScreen:
        return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
      case screens.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case screens.signUpProcessScreen:
        final Map data = settings.arguments as Map;
        final String password = data['password'];
        final String email = data['email'];
        final bool keepMeSigned= data['keepMeSigned'];
        if (kDebugMode) {
          print(data);
        }
        return MaterialPageRoute(
            builder: (_) => SignUpProcess(
                  email: email,
                  password: password,
              keepMeSigned: keepMeSigned,
                ));
      case screens.signUpPaymentMethodScreen:
        return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
      case screens.uploadPhotoScreen:
        return MaterialPageRoute(builder: (_) => const UploadPhotoScreen());
      case screens.uploadPhotoPreviewScreen:
        return MaterialPageRoute(
            builder: (_) => const UploadPhotoPreviewScreen());
      case screens.homeLayoutScreen:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
        case screens.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case screens.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
        case screens.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
        case screens.chatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      default:
        return null;
    }
  }
}
