import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../data/responses/all_food_response/all_food_response.dart';
import '../styles/colors.dart';
import '../widgets/default_text.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, required this.allFoodData, this.onPressed});

  final AllFoodData allFoodData;
  final void Function()?onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.sp),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurStyle: BlurStyle.outer,
              blurRadius: 5.sp)
        ],
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      DefaultText(
                        text: allFoodData.name,
                        textSize: 15.sp,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DefaultText(
                        text: "${allFoodData.price}\$",
                        textSize: 10.sp,
                        textColor: backButtonArrow,
                        weight: FontWeight.bold,
                      ),
                      IconButton(
                          onPressed: onPressed,
                          icon: SvgPicture.asset(
                              'assets/icons8-add-shopping-cart-96.svg'),
                          splashColor: Colors.grey),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
