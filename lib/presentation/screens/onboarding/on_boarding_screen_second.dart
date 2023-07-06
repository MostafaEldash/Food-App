import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../views/on_boarding_item.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';

class OnBoardingScreenSecond extends StatefulWidget {
  const OnBoardingScreenSecond({super.key});

  @override
  State<OnBoardingScreenSecond> createState() => _OnBoardingScreenSecondState();
}

class _OnBoardingScreenSecondState extends State<OnBoardingScreenSecond> {
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: OnBoardingItem(model: cubit.onBoardingList[1]),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: AppContainer(
              child: DefaultMaterialButton(
                onPressed: () {
                  cubit.finishOnBoarding(context);
                },
                width: 57.w,
                heigth: 9.h,
                child: DefaultText(
                    text: 'Next',
                    textColor: Colors.white,
                    textSize: 15.sp,
                    weight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
