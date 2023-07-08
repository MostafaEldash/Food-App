import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            ? Image.file(image)
            : SvgPicture.asset('assetsabstract-user-flat-4.svg'),
        SlidingUpPanel( borderRadius: BorderRadius.circular(20.sp),
         maxHeight: 95.h,
         minHeight: 50.h,boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2))],
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
                     child: Divider(color: backButtonArrow,height: 15.sp,thickness: 5.sp)),
               ],
             ),
             Padding(
               padding: EdgeInsets.only(left: 5.w),
               child: Container(
                   padding: EdgeInsets.all(5.sp),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(18.5),
                       color: backButtonArrow.withOpacity(0.1),),
                 child: DefaultText(text: 'Gold Member',weight: FontWeight.bold,),
               ),
             ),
             Padding(
               padding: EdgeInsets.symmetric(
                   vertical: 3.h, horizontal: 10.w),
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
      ],
    );
  }
}
