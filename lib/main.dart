import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/business_logic/restaurant_search_cubit/restaurant_search_cubit.dart';
import 'package:food_ninja/presentation/router/app_router.dart';
import 'package:food_ninja/presentation/styles/themes.dart';
import 'package:sizer/sizer.dart';
import 'business_logic/app_cubit.dart';
import 'business_logic/category_cubit/category_cubit.dart';
import 'business_logic/chat_cubit/chat_cubit.dart';
import 'business_logic/food_cubit/food_cubit.dart';
import 'business_logic/food_search_cubit/food_search_cubit.dart';
import 'business_logic/login_cubit/login_cubit.dart';
import 'business_logic/order_cubit/order_cubit.dart';
import 'business_logic/registration_cubit/registration_cubit.dart';
import 'business_logic/restaurants_cubit/restaurants_cubit.dart';
import 'data/data_providers/my_dio.dart';
import 'data/local/mycache.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyDio.dioInit();
  await MyCache.initCache();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AppCubit(),
              ),
              BlocProvider(
                create: (context) => LoginCubit(),
              ),
              BlocProvider(
                create: (context) => RegistrationCubit(),
              ),
              BlocProvider(
                create: (context) => RestaurantsCubit(),
              ),
              BlocProvider(
                create: (context) => FoodCubit(),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
              ),
              BlocProvider(
                create: (context) => ChatCubit(),
              ),
              BlocProvider(
                create: (context) => FoodSearchCubit(),
              ),
              BlocProvider(
                create: (context) => CategoryCubit(),
              ),
              BlocProvider(
                create: (context) => RestaurantSearchCubit(),
              ),

            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Food Ninja',
              theme: Themes.lightTheme,
              darkTheme: Themes.darkTheme,
              onGenerateRoute: appRouter.onGenerateRoute,
            ));
      },
    );
  }
}
