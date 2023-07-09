import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/constants_methods.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../core/my_cache_keys.dart';
import '../../../data/local/mycache.dart';
import '../../../data/responses/restaurant_response/restaurant_response.dart';
import '../../styles/colors.dart';
import '../../widgets/default_text.dart';

class RestaurantPreviewScreen extends StatefulWidget {
  const RestaurantPreviewScreen({super.key, required this.restaurantsData});
  final RestaurantsData restaurantsData;

  @override
  State<RestaurantPreviewScreen> createState() =>
      _RestaurantPreviewScreenState();
}

class _RestaurantPreviewScreenState extends State<RestaurantPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: 100.w,
              height: 60.h,
              child: Image.asset('assets/photo_restaurant.png',
                  fit: BoxFit.cover)),
          SlidingUpPanel(
            borderRadius: BorderRadius.circular(20.sp),
            maxHeight: 95.h,
            minHeight: 50.h,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2))],
            color: Theme.of(context).colorScheme.primary,
            panel: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 5.h,
                        child: Divider(
                            color: backButtonArrow,
                            height: 15.sp,
                            thickness: 5.sp)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.5),
                      color: backButtonArrow.withOpacity(0.1),
                    ),
                    child: const DefaultText(
                      text: 'Popular',
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                  child: DefaultText(
                      text: widget.restaurantsData.name,
                      textSize: 20.sp,
                      weight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: lightGreen,
                      ),
                      DefaultText(
                        textColor: Colors.grey,
                        text:
                            "${distanceInKm(MyCache.getDouble(key: MyCacheKeys.lat), MyCache.getDouble(key: MyCacheKeys.long), double.parse(widget.restaurantsData.lat), double.parse(widget.restaurantsData.long)).toString()} Km",
                        textSize: 10.sp,
                      ),
                      const Icon(
                        Icons.star_half,
                        color: lightGreen,
                      ),
                      DefaultText(
                        text: "4.5 rating",
                        textColor: Colors.grey,
                        textSize: 10.sp,
                      )
                    ],
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
