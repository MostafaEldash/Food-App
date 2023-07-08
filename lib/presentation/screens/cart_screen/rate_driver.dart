import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/presentation/widgets/app_container.dart';
import 'package:food_ninja/presentation/widgets/default_text.dart';
import 'package:food_ninja/presentation/widgets/first_background.dart';
import 'package:food_ninja/presentation/widgets/text_form_filed.dart';
import 'package:sizer/sizer.dart';
import '../../styles/colors.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../widgets/default_material_button.dart';

class RateDriverScreen extends StatefulWidget {
  const RateDriverScreen({super.key});

  @override
  State<RateDriverScreen> createState() => _RateDriverScreenState();
}

TextEditingController feedback = TextEditingController();

class _RateDriverScreenState extends State<RateDriverScreen> {
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
                      text: 'Thank You!\nOrder Completed',
                      textSize: 20.sp,
                      weight: FontWeight.bold,
                    ),
                  ),
                  DefaultText(
                    text: 'Please rate your last Driver',
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
                              Navigator.pushNamedAndRemoveUntil(context, screens.rateFoodScreen, (route) => false);
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
                                  Navigator.pushNamedAndRemoveUntil(context, screens.rateFoodScreen, (route) => false);
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
