import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../styles/colors.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';
import '../../widgets/text_form_filed.dart';

class RateRestaurantScreen extends StatefulWidget {
  const RateRestaurantScreen({super.key});

  @override
  State<RateRestaurantScreen> createState() => _RateRestaurantScreenState();
}
TextEditingController feedback = TextEditingController();

class _RateRestaurantScreenState extends State<RateRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BackGround(
          index: 0,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: SvgPicture.asset('assets/driver.svg'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: DefaultText(
                      textAlign: TextAlign.center,
                      text: 'Thank You!\nEnjoy Your Meal',
                      textSize: 20.sp,
                      weight: FontWeight.bold,
                    ),
                  ),
                  DefaultText(
                    text: 'Please rate your restaurant',
                    textSize: 12.sp,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.sp),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {},
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: DefaultTextFormField(
                      controller: feedback,
                      hintText: 'Leave feedback',
                      prefixIcon: const Icon(
                        Icons.rate_review_rounded,
                        color: lightGreen,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Row(
                      children: [
                        AppContainer(
                          child: DefaultMaterialButton(
                            width: 70.w,
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, screens.homeLayoutScreen, (route) => false);
                            },
                            child: const DefaultText(
                              text: 'Submit',
                              weight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(15.sp)),
                            width: 20.w,
                            child: DefaultMaterialButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context, screens.homeLayoutScreen, (route) => false);
                                },
                                child: const DefaultText(
                                  text: 'Skip',
                                  weight: FontWeight.bold,
                                  textColor: lightGreen,
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

