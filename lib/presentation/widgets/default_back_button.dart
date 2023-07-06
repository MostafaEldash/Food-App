import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({super.key, this.onPressed, required this.icon});
final void Function()? onPressed;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 5.w,top: 6.h),
      decoration: BoxDecoration(
          color: backGroundColorBackButton.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.sp)),
      child:IconButton(
        icon: Icon(icon,color: backButtonArrow),
        onPressed: onPressed
      ),
    );
  }
}
