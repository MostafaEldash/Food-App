import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../data/responses/restaurant_response/restaurant_response.dart';
import '../widgets/default_text.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({super.key, required this.restaurantsData});

  final RestaurantsData restaurantsData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screens.restaurantPreviewScreen,arguments: restaurantsData);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        margin: EdgeInsets.all(5.sp),
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
            // Flexible(
            //   child: DefaultNetworkImage(width: 10.h,height: 10.h,fit: BoxFit.contain,imageURL: 'http://206.189.103.8/restaurent/1688088074.face.png'),
            // ),
            Flexible(
                child: DefaultText(
              text: restaurantsData.name,
              textSize: 15.sp,
              weight: FontWeight.bold,
            )),
            Flexible(
                child: DefaultText(
              text: restaurantsData.deliveryTime,
              textSize: 10.sp,
            ))
          ],
        ),
      ),
    );
  }
}
