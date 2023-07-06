import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;

import '../../../business_logic/app_cubit.dart';
import '../../../core/my_cache_keys.dart';
import '../../../data/local/mycache.dart';
import '../../widgets/first_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  void initState() {
    Timer(const Duration(milliseconds: 3500), () {
      print(MyCache.getString(key: MyCacheKeys.profileId));
      if(cubit.checkIsShawn() || MyCache.getString(key: MyCacheKeys.profileId)=='') {
        Navigator.pushNamedAndRemoveUntil(
          context, screens.signUpScreen, (route) => false);
      }
      else if(MyCache.getString(key: MyCacheKeys.profileId)!=''){
        Navigator.pushNamedAndRemoveUntil(
            context, screens.homeLayoutScreen, (route) => false);
      }
      else {
        Navigator.pushNamedAndRemoveUntil(
            context, screens.onBoardingScreenFirst, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BackGround(
        index: 0,
        children: [
        Padding(
          padding: EdgeInsets.only(bottom: 35.h),
          child: Image.asset('assets/untitled (1).png',),
        )
      ],)
    );
  }
}
