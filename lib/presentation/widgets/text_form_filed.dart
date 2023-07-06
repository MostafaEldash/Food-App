import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';
import 'default_text.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {super.key,
      required this.controller,
      this.prefixIcon,
      required this.hintText,
      this.suffixIcon,
      this.isHidden,
      this.validator});
  final TextEditingController controller;
  final Widget? prefixIcon;
  final String hintText;
  final IconButton? suffixIcon;
  final bool? isHidden;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHidden ?? false,
      obscuringCharacter: '*',
      cursorColor: deepGreen,
      controller: controller,
      keyboardType: TextInputType.name,
      scrollPhysics: const ScrollPhysics(),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: labelGrey.withOpacity(0.1),
        label: DefaultText(
          text: hintText,
          textColor: Colors.grey,
          textSize: 12.sp,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 1.h),
        prefixIcon: Padding(
          padding: EdgeInsets.all(11.sp),
          child: prefixIcon
        ),
        labelStyle: const TextStyle(color: labelGrey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.sp),
          borderSide:
              BorderSide(color: labelGrey.withOpacity(0.4), width: 2.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.sp),
          borderSide: BorderSide(color: deepGreen, width: 2.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.sp),
          borderSide: BorderSide(color: Colors.red, width: 2.sp),
        ),
      ),
      validator: validator,
    );
  }
}
