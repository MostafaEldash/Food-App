import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/business_logic/search_cubit/search_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../../business_logic/food_cubit/food_cubit.dart';
import '../../../business_logic/restaurants_cubit/restaurants_cubit.dart';
import '../../styles/colors.dart';
import '../../views/food_list_item.dart';
import '../../views/restaurant_list_item.dart';
import '../../widgets/default_text.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RestaurantsCubit restaurantsCubit;
  late FoodCubit foodCubit;
  late SearchCubit searchCubit;
  @override
  void didChangeDependencies() {
    searchCubit = SearchCubit.get(context);
    restaurantsCubit = RestaurantsCubit.get(context)..getRestaurants();
    foodCubit = FoodCubit.get(context)..getAllFood();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AppCubit.get(context).background[1],
          fit: BoxFit.fill,
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, left: 5.w),
                    child: DefaultText(
                      text: 'Find Your\nFavorite Food',
                      weight: FontWeight.bold,
                      textSize: 25.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, right: 2.h),
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, screens.notificationsScreen);
                        },
                        color: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp)),
                        child:
                            SvgPicture.asset('assets/Icon Notifiaction.svg')),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: SearchBar(
                    hintText: 'What do you want to order?',
                    onTap: () {
                      Navigator.pushNamed(context, screens.searchScreen);
                    },
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                    leading: const Icon(
                      Icons.search,
                      color: backButtonArrow,
                    ),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Container(
                  width: 90.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/ice_ream_voucher.png',
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3.h),
                                  child: DefaultText(
                                    text: 'Special Deal for\njuly',
                                    weight: FontWeight.bold,
                                    textColor: Colors.white,
                                    textSize: 15.sp,
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: const DefaultText(
                                    text: 'Buy Now',
                                    textColor: lightGreen,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: DefaultText(
                      text: 'popular restaurants',
                      weight: FontWeight.bold,
                      textSize: 15.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, screens.popularRestaurantsScreen);
                      },
                      child: const DefaultText(
                        text: 'view',
                        style: TextStyle(decoration: TextDecoration.underline),
                        textColor: backButtonArrow,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: SizedBox(
                  height: 30.h,
                  child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
                    builder: (context, state) {
                      if (state is RestaurantLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: lightGreen,
                          ),
                        );
                      } else if (state is RestaurantSuccessState) {
                        return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => RestaurantListItem(
                            restaurantsData: restaurantsCubit
                                .restaurantsResponse.data[index],
                          ),
                          itemCount:
                              restaurantsCubit.restaurantsResponse.data.length,
                          separatorBuilder: (context, index) =>
                              const VerticalDivider(
                            color: Colors.transparent,
                          ),
                        );
                      } else {
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
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                    child: DefaultText(
                      text: 'Popular Menu',
                      weight: FontWeight.bold,
                      textSize: 15.sp,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, screens.popularMenuScreen);
                      },
                      child: const DefaultText(
                        text: 'view',
                        style: TextStyle(decoration: TextDecoration.underline),
                        textColor: backButtonArrow,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: BlocBuilder<FoodCubit, FoodState>(
                  builder: (context, state) {
                    if (state is AllFoodLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: lightGreen,
                        ),
                      );
                    } else if (state is AllFoodSuccessState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => FoodListItem(
                          index: index,
                          allFoodData: foodCubit.allFoodResponse.data[index],
                        ),
                        itemCount: foodCubit.allFoodResponse.data.length,
                        separatorBuilder: (context, index) => Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 1.h,
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
