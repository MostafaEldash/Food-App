import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/my_cache_keys.dart';
import 'package:food_ninja/data/local/mycache.dart';
import 'package:food_ninja/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BackGround(
        index: 1,
        children: [
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: DefaultText(
                    text: 'Shipping',
                    weight: FontWeight.bold,
                    textSize: 22.sp,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5.sp)
                      ],
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.h),
                              child: DefaultText(
                                text: 'Order Location',
                                textColor: Colors.grey,
                                textSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: SvgPicture.asset('assets/Pin Logo.svg'),
                            ),
                            DefaultText(
                              text: 'Restaurant Location',
                              textSize: 12.sp,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5.sp)
                      ],
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.h),
                              child: DefaultText(
                                text: 'Deliver to',
                                textColor: Colors.grey,
                                textSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: SvgPicture.asset('assets/Pin Logo.svg'),
                            ),
                            DefaultText(
                              maxLines: 2,
                              text:
                                  "latitude ${MyCache.getDouble(key: MyCacheKeys.lat)},\nlongitude ${MyCache.getDouble(key: MyCacheKeys.long)}",
                              textSize: 12.sp,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, screens.orderMapScreen);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: DefaultText(
                                  text: 'Set Location',
                                  textColor: lightGreen,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
