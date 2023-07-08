import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import 'package:sizer/sizer.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
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
                    text: 'Set Your Location ',
                    weight: FontWeight.bold,
                    textSize: 22.sp,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: DefaultText(
                    text:
                        'This data will be displayed in your account\nprofile for security',
                    textSize: 10.sp,
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
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: SvgPicture.asset('assets/Pin Logo.svg'),
                            ),
                            DefaultText(
                              text: 'Your Location',
                              textSize: 12.sp,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: SizedBox(
                            width: 80.w,
                            height: 6.h,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context,screens.mapScreen, (route) => false);
                              },
                              color: Theme.of(context).colorScheme.secondary,
                              child: DefaultText(
                                text: 'Set Location',
                                weight: FontWeight.bold,
                                textSize: 12.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.h,  left: 22.w),
                  child: AppContainer(
                    child: DefaultMaterialButton(
                      width: 57.w,
                      heigth: 9.h,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,screens.mapScreen, (route) => false);
                      },
                      child: DefaultText(
                        text: 'Next',
                        textColor: Colors.white,
                        textSize: 15.sp,
                      ),
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
