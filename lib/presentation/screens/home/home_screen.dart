import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../../business_logic/food_cubit/food_cubit.dart';
import '../../../business_logic/order_cubit/order_cubit.dart';
import '../../../business_logic/restaurants_cubit/restaurants_cubit.dart';
import '../../styles/colors.dart';
import '../../views/food_list_item.dart';
import '../../views/restaurant_list_item.dart';
import '../../widgets/default_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RestaurantsCubit restaurantsCubit;
  late FoodCubit foodCubit;

  @override
  void didChangeDependencies() {
    restaurantsCubit = RestaurantsCubit.get(context);
    foodCubit = FoodCubit.get(context);
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
        Column(
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
                        onPressed: () {
                          // TO DO:
                        },
                        color: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp)),
                        child:
                            SvgPicture.asset('assets/Icon Notifiaction.svg')),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: const SearchBar(
                  hintText: 'What do you want to order?',
                  leading: Icon(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: const DefaultText(
                    text: 'view',
                    style: TextStyle(decoration: TextDecoration.underline),
                    textColor: backButtonArrow,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => RestaurantListItem(
                    restaurantsData:
                        restaurantsCubit.restaurantsResponse.data[index],
                  ),
                  itemCount: restaurantsCubit.restaurantsResponse.data.length,
                  separatorBuilder: (context, index) => const VerticalDivider(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                  child: DefaultText(
                    text: 'Popular Menu',
                    weight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                  child: const DefaultText(
                    text: 'view',
                    style: TextStyle(decoration: TextDecoration.underline),
                    textColor: backButtonArrow,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ListView.separated(
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
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
