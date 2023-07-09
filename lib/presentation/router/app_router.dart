import 'package:flutter/material.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import 'package:food_ninja/presentation/screens/cart_screen/confirm_order.dart';
import 'package:food_ninja/presentation/screens/cart_screen/order_map_screen.dart';
import 'package:food_ninja/presentation/screens/cart_screen/rate_driver.dart';
import 'package:food_ninja/presentation/screens/cart_screen/rate_food_screen.dart';
import 'package:food_ninja/presentation/screens/cart_screen/rate_restaurant.dart';
import 'package:food_ninja/presentation/screens/food_preview_screen/food_preview_screen.dart';
import 'package:food_ninja/presentation/screens/notifications_screen/notification_screen.dart';
import 'package:food_ninja/presentation/screens/popular_restaurants_screen/popular_restaurants_screen.dart';
import 'package:food_ninja/presentation/screens/restaurant_preview_screen/restaurant_preview_screen.dart';
import 'package:food_ninja/presentation/screens/set_location/map_screen.dart';
import 'package:food_ninja/presentation/screens/set_location/set_location_screen.dart';
import 'package:food_ninja/presentation/screens/shipping_screen/shipping_screen.dart';
import '../../data/responses/all_food_response/all_food_response.dart';
import '../../data/responses/restaurant_response/restaurant_response.dart';
import '../screens/cart_screen/cart_screen.dart';
import '../screens/chat_screen/chat_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home_layout/home_layout.dart';
import '../screens/login/login_screen.dart';
import '../screens/onboarding/on_boarding_screen_first.dart';
import '../screens/onboarding/on_boarding_screen_second.dart';
import '../screens/popular_menu_screen/popular_menu_screen.dart';
import '../screens/profile_screen/profile_screen.dart';
import '../screens/search_screen/search_screen.dart';
import '../screens/signup/payment_method_screen.dart';
import '../screens/signup/sign_process.dart';
import '../screens/signup/sign_up.dart';
import '../screens/signup/signup_success.dart';
import '../screens/signup/upload_photo.dart';
import '../screens/signup/upload_photo_preview.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/vouchers_screen/vouchers_screen.dart';

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
      case screens.setLocationScreen:
        return MaterialPageRoute(builder: (_) => const SetLocationScreen());
      case screens.mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case screens.signUpSuccessScreen:
        return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
      case screens.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case screens.signUpProcessScreen:
        final Map data = settings.arguments as Map;
        final String password = data['password'];
        final String email = data['email'];
        final bool keepMeSigned = data['keepMeSigned'];
        return MaterialPageRoute(
            builder: (_) => SignUpProcess(
                  email: email,
                  password: password,
                  keepMeSigned: keepMeSigned,
                ));
      case screens.signUpPaymentMethodScreen:
        return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
      case screens.confirmOrderScreen:
        return MaterialPageRoute(builder: (_) => const ConfirmOrder());
      case screens.restaurantPreviewScreen:
        final RestaurantsData restaurantsData =
            settings.arguments as RestaurantsData;
        return MaterialPageRoute(
            builder: (_) => RestaurantPreviewScreen(
                  restaurantsData: restaurantsData,
                ));
      case screens.foodPreviewScreen:
        final Map data = settings.arguments as Map;
        final AllFoodData allFoodData = data['allFoodData'];
        final int index = data['index'];
        return MaterialPageRoute(
            builder: (_) => FoodPreviewScreen(
                  allFoodData: allFoodData,
                  index: index,
                ));
      case screens.uploadPhotoScreen:
        return MaterialPageRoute(builder: (_) => const UploadPhotoScreen());
      case screens.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
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
      // case screens.chatScreen:
      //   return MaterialPageRoute(builder: (_) => const ChatScreen());
      case screens.rateDriverScreen:
        return MaterialPageRoute(builder: (_) => const RateDriverScreen());
      case screens.rateFoodScreen:
        return MaterialPageRoute(builder: (_) => const RateFoodScreen());
      case screens.rateRestaurantScreen:
        return MaterialPageRoute(builder: (_) => const RateRestaurantScreen());
      case screens.vouchersScreen:
        return MaterialPageRoute(builder: (_) => const VouchersScreen());
      case screens.shippingScreen:
        return MaterialPageRoute(builder: (_) => const ShippingScreen());
      case screens.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case screens.popularRestaurantsScreen:
        return MaterialPageRoute(
            builder: (_) => const PopularRestaurantsScreen());
      case screens.popularMenuScreen:
        return MaterialPageRoute(builder: (_) => const PopularMenuScreen());
      case screens.orderMapScreen:
        return MaterialPageRoute(builder: (_) => const OrderMapScreen());
      default:
        return null;
    }
  }
}
