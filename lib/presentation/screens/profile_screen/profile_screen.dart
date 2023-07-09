import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
  File image = File(MyCache.getString(key: MyCacheKeys.profileImage));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image.path != ''
            ? SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.file(image,fit: BoxFit.cover))
            : SizedBox(
            width: 100.w,
            height: 60.h,
            child: Image.asset('assets/Photo.png',
                fit: BoxFit.cover),),
        SlidingUpPanel(
          borderRadius: BorderRadius.circular(20.sp),
          maxHeight: 95.h,
          minHeight: 50.h,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2))],
          color: Theme.of(context).colorScheme.primary,
          panel: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 5.h,
                      child: Divider(
                          color: backButtonArrow,
                          height: 15.sp,
                          thickness: 5.sp)),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.5),
                    color: backButtonArrow.withOpacity(0.1),
                  ),
                  child: const DefaultText(
                    text: 'Gold Member',
                    textColor: backButtonArrow,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
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
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                child: Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurStyle: BlurStyle.outer,
                          blurRadius: 5.sp)
                    ],
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: SvgPicture.asset('assets/Voucher Icon.svg'),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 1.h),
                            child: DefaultText(
                              text: 'You Have 3 Voucher',
                              textSize: 12.sp,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
