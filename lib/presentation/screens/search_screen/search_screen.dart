import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/business_logic/restaurant_search_cubit/restaurant_search_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../../business_logic/food_search_cubit/food_search_cubit.dart';
import '../../styles/colors.dart';
import '../../views/food_list_item.dart';
import '../../views/restaurant_list_item.dart';
import '../../widgets/default_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController searchController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  late FoodSearchCubit searchCubit;
  late RestaurantSearchCubit restaurantSearchCubit;
  @override
  void didChangeDependencies() {
    restaurantSearchCubit =RestaurantSearchCubit.get(context);
    searchCubit = FoodSearchCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              AppCubit.get(context).background[1],
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
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
                      child: SizedBox(
                        width: 7.h,
                        height: 7.h,
                        child: MaterialButton(
                          onPressed: () {},
                          color: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          child:
                              SvgPicture.asset('assets/icon_notification.svg'),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: WillPopScope(
                    onWillPop: () async {
                      searchController.clear();
                      return true;
                    },
                    child: SearchBar(
                      textStyle: const MaterialStatePropertyAll(
                        TextStyle(color: backButtonArrow),
                      ),
                      controller: searchController,
                      hintText: 'What do you want to order?',
                      onChanged: (value) {
                        restaurantSearchCubit.getRestaurantWithName(restaurantName: value);
                        searchCubit.getFoodWithName(foodName: value);
                      },
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                      leading: const Icon(
                        Icons.search,
                        color: backButtonArrow,
                      ),
                    ),
                  ),
                ),
                WillPopScope(
                  onWillPop: () async {
                    searchCubit.allFoodResponse.data.clear();
                    return true;
                  },
                  child: SizedBox(
                    height: 10.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: BlocBuilder<FoodSearchCubit, FoodSearchState>(
                        builder: (context, state) {
                          if (state is FoodWithNameLoadingState)
                            return Center(
                              child:
                                  CircularProgressIndicator(color: lightGreen),
                            );
                          else if (state is FoodWithNameSuccessState)
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  FoodListItem(
                                index: index,
                                allFoodData: searchCubit
                                    .allFoodResponse.data[index],
                              ),
                              itemCount:
                                  searchCubit.allFoodResponse.data.length,
                              separatorBuilder: (context, index) =>
                                  const VerticalDivider(
                                color: Colors.transparent,
                              ),
                            );
                          else {
                            return DefaultText(
                              text: 'find what you want',
                              textColor: Colors.grey,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),WillPopScope(
                  onWillPop: () async {
                    restaurantSearchCubit.restaurantResponse.data.clear();
                    return true;
                  },
                  child: SizedBox(
                    height: 30.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: BlocBuilder<RestaurantSearchCubit, RestaurantSearchState>(
                        builder: (context, state) {
                          if (state is FoodWithNameLoadingState)
                            return Center(
                              child:
                                  CircularProgressIndicator(color: lightGreen),
                            );
                          else if (state is RestaurantWithNameSuccessState)
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  RestaurantListItem(
                                restaurantsData: restaurantSearchCubit
                                    .restaurantResponse.data[index],
                              ),
                              itemCount:
                                  restaurantSearchCubit.restaurantResponse.data.length,
                              separatorBuilder: (context, index) =>
                                  const VerticalDivider(
                                color: Colors.transparent,
                              ),
                            );
                          else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
