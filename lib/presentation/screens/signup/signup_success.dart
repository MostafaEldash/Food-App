import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/app_container.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';


class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        index: 0,
        children: [
          Image.asset('assets/signupSuccess.png'),
          Padding(
            padding: EdgeInsets.only(top: 5.h,bottom: 2.h),
            child: Image.asset('assets/signupCompleted.png'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: DefaultText(
              text: 'Your Profile Is Ready To Use',
              weight: FontWeight.bold,
              textSize: 20.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.h,bottom: 10.h),
            child: AppContainer(
                child: DefaultMaterialButton(
                  width: 57.w,
                  heigth: 9.h,
              onPressed: () {},
              child: DefaultText(
                text: 'Try Order',
                textColor: Colors.white,
                textSize: 15.sp,
              ),
            )),
          )
        ],
      ),
    );
  }
}
