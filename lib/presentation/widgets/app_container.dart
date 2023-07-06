import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
        borderRadius: BorderRadius.circular(15.sp),
        child: Container(
          decoration: const BoxDecoration(
        gradient: LinearGradient(
        colors: [lightGreen,deepGreen],
    ),
    ),
          child: child));
  }
}
