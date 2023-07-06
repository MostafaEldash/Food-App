import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';
import 'default_text.dart';

class DefaultCheckListTile extends StatelessWidget {
  const DefaultCheckListTile(
      {super.key, required this.checkValue, required this.text});
  final bool checkValue;
  final String text;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checkValue,
      onChanged: (value) {
      },
     checkboxShape:  const CircleBorder(),
      activeColor: lightGreen,
      title: DefaultText(
        text: text,
        textSize: 12.sp,
        textColor: Colors.grey,
      ),

    );
  }
}
