import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../../business_logic/app_cubit.dart';
import '../../../business_logic/food_search_cubit/food_search_cubit.dart';
import '../../../business_logic/restaurants_cubit/restaurants_cubit.dart';
import '../../styles/colors.dart';
import '../../views/restaurant_list_item.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_text.dart';

class PopularRestaurantsScreen extends StatefulWidget {
  const PopularRestaurantsScreen({super.key});

  @override
  State<PopularRestaurantsScreen> createState() =>
      _PopularRestaurantsScreenState();
}

class _PopularRestaurantsScreenState extends State<PopularRestaurantsScreen> {
  late RestaurantsCubit restaurantsCubit;
  late FoodSearchCubit searchCubit;
  @override
  void didChangeDependencies() {
    searchCubit = FoodSearchCubit.get(context);
    restaurantsCubit = RestaurantsCubit.get(context)..getRestaurants();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                DefaultBackButton(
                  icon: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                              SvgPicture.asset('assets/icon_notification.svg')),
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
                      )),
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
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
                    builder: (context, state) {
                      if (state is RestaurantLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: lightGreen,
                          ),
                        );
                      } else if (state is RestaurantSuccessState) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => RestaurantListItem(
                            restaurantsData: restaurantsCubit
                                .restaurantsResponse.data[index],
                          ),
                          itemCount: restaurantsCubit
                              .restaurantsResponse.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
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
      ),
    );
  }
}
