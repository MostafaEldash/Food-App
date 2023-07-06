import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/my_cache_keys.dart';
import '../../../data/local/mycache.dart';
import '../../styles/colors.dart';
import '../../widgets/default_text.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bottomAppBarColorDark,
            borderRadius: BorderRadius.circular(20.sp)
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                    child: DefaultText(
                        text: MyCache.getString(key: MyCacheKeys.name),
                        textSize: 20.sp,
                        weight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: DefaultText(
                      textColor: Colors.grey,
                      text: MyCache.getString(key: MyCacheKeys.email),
                      textSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
