import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/business_logic/category_cubit/category_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../styles/colors.dart';
import '../../widgets/default_text.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late CategoryCubit categoryCubit;

  @override
  void didChangeDependencies() {
    categoryCubit = CategoryCubit.get(context)..getCategoriesFood();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AppCubit.get(context).background[1],
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, left: 5.w),
                    child: DefaultText(
                      text: 'Find Your\nFavorite Food',
                      weight: FontWeight.bold,
                      textSize: 25.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, right: 2.h),
                    child: SizedBox(
                      width: 7.h,
                      height: 7.h,
                      child: MaterialButton(
                          onPressed: () {},
                          color: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp)),
                          child:
                              SvgPicture.asset('assets/icon_notification.svg')),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: SearchBar(
                  textStyle: const MaterialStatePropertyAll(
                      TextStyle(color: backButtonArrow)),
                  hintText: 'What do you want to order?',
                  onChanged: (value) {},
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  leading: const Icon(
                    Icons.search,
                    color: backButtonArrow,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Row(
                  children: [
                    DefaultText(
                      text: 'Type',
                      textSize: 12.sp,
                      weight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 5.sp)],
                          color: Theme.of(context).colorScheme.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: 'Restaurant',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 5.sp)],
                          color: Theme.of(context).colorScheme.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: 'Menu',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Row(
                  children: [
                    DefaultText(
                      text: 'Location',
                      textSize: 12.sp,
                      weight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 5.sp)],
                          color: Theme.of(context).colorScheme.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: '1km',
                          ),
                        ],
                      ),
                    ),
                  ),Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 5.sp)],
                          color: Theme.of(context).colorScheme.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: '< 10km',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 5.sp)],
                          color: Theme.of(context).colorScheme.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: '> 10km',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Row(
                  children: [
                    DefaultText(
                      text: 'Food',
                      textSize: 12.sp,
                      weight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              Flexible(
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 5.sp)],
                                    color: Theme.of(context).colorScheme.primary),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    DefaultText(
                                      text: categoryCubit
                                          .categoryResponse.data[index].name,
                                    ),
                                  ],
                                ),
                              ),
                        ),
                        itemCount: categoryCubit.categoryResponse.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 5/3,
                          crossAxisCount: 3,
                          mainAxisSpacing: 5.sp,crossAxisSpacing: 5.sp
                        ));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
