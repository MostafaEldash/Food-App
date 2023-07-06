import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../../business_logic/food_cubit/food_cubit.dart';
import '../../../business_logic/restaurants_cubit/restaurants_cubit.dart';
import '../../styles/colors.dart';
import '../../widgets/default_text.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  late AppCubit cubit;
  late RestaurantsCubit restaurantsCubit;
  late FoodCubit foodCubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    restaurantsCubit = RestaurantsCubit.get(context)..getRestaurants();
    foodCubit = FoodCubit.get(context)..getAllFood();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: BlocBuilder<RestaurantsCubit, RestaurantsState>(
            builder: (BuildContext context, state) {
              if (state is RestaurantLoadingState ||state is AllFoodLoadingState){
                return const Center(
                  child: CircularProgressIndicator(
                    color: lightGreen,
                  ),
                );
              } else if (state is RestaurantSuccessState || state is AllFoodSuccessState) {
                return cubit.bottomNavBarScreens[cubit.currentIndex];
              } else{
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 75.sp,
                      ),
                      DefaultText(
                        text: 'Error Occurred!',
                        textColor: Colors.white,
                        textSize: 25.sp,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp),boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),blurStyle: BlurStyle.outer,blurRadius: 5.sp)]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.sp),
                child: BottomAppBar(
                  elevation: 20,
                  shadowColor: Colors.grey,
                  child: BottomNavigationBar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    currentIndex: cubit.currentIndex,
                    onTap: (index) => cubit.changeScreenIndex(index),
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('assets/Home.svg'),
                          label: cubit.appBarTitles[0]),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('assets/Profile.svg'),
                          label: cubit.appBarTitles[1]),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('assets/Buy.svg'),
                          label: cubit.appBarTitles[2]),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('assets/Chat.svg'),
                          label: cubit.appBarTitles[3],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

        );
      },
    );
  }
}
