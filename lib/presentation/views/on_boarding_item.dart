import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/onboardingmodel.dart';
import '../widgets/default_text.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.only(top: 6.h,),
              child: Image.asset(
                model.image,
                fit: BoxFit.fitWidth,
              ),
            )),
        Flexible(
          flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: DefaultText(
                text: model.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                textSize: 20.sp,
                weight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        Flexible(
          flex: 2,
            child: Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: DefaultText(
                  text: model.body,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  textSize: 10.sp,
                  overflow: TextOverflow.ellipsis,
                )
            )
        ),
      ],
    );
  }
}
