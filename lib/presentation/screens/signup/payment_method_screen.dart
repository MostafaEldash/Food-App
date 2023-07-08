import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/app_container.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;

import '../../widgets/first_background.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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
                    text: 'Payment Method',
                    weight: FontWeight.bold,
                    textSize: 22.sp,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: DefaultText(
                    text:
                        'This data will be displayed in your account\n profile for security',
                    textSize: 10.sp,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, screens.uploadPhotoScreen);
                    },
                    child: SizedBox(
                      height: 10.h,
                      width: 80.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/paypal-2 (1) 1.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                  child: SizedBox(
                    height: 10.h,
                    width: 80.w,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, screens.uploadPhotoScreen);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/visa (1) 1.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                  child: SizedBox(
                    height: 10.h,
                    width: 80.w,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, screens.uploadPhotoScreen);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/Payoneer_logo 1.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 1.h, left: 20.w),
                  child: AppContainer(
                    child: DefaultMaterialButton(
                      width: 57.w,
                      heigth: 9.h,
                      onPressed: () {
                        Navigator.pushNamed(context, screens.uploadPhotoScreen);
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
