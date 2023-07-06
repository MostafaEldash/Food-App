import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../../business_logic/app_cubit.dart';
import '../../views/on_boarding_item.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';

class OnBoardingScreenFirst extends StatefulWidget {
  const OnBoardingScreenFirst({super.key});

  @override
  State<OnBoardingScreenFirst> createState() => _OnBoardingScreenFirstState();
}

class _OnBoardingScreenFirstState extends State<OnBoardingScreenFirst> {
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
            child: OnBoardingItem(model: cubit.onBoardingList[0]),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: AppContainer(
              child: DefaultMaterialButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      screens.onBoardingScreenSecond, (route) => false);
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
