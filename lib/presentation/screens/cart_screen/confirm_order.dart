import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/presentation/widgets/first_background.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/order_cubit/order_cubit.dart';
import '../../../core/my_cache_keys.dart';
import '../../../data/local/mycache.dart';
import '../../styles/colors.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_text.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;


class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  late OrderCubit orderCubit;

  @override
  void didChangeDependencies() {
    orderCubit = OrderCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: BackGround(
          index: 1,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultBackButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    child: DefaultText(
                      text: 'Confirm Order',
                      weight: FontWeight.bold,
                      textSize: 22.sp,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                child: DefaultText(text: 'Deliver to',textColor: Colors.grey,textSize: 12.sp,),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: SvgPicture.asset('assets/Pin Logo.svg'),
                              ),
                              DefaultText(
                                maxLines: 2,
                                text: "latitude ${MyCache.getDouble(key: MyCacheKeys.lat)},\nlongitude ${MyCache.getDouble(key: MyCacheKeys.long)}",
                                textSize: 12.sp,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                child: DefaultText(text: 'Payment Method',textColor: Colors.grey,textSize: 12.sp,),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: SvgPicture.asset('assets/Payoneer_logo 1.svg',color: Colors.white,),
                              ),
                              DefaultText(
                                textColor: Colors.grey,
                                text: "2458 7455 5555 ****",
                                textSize: 12.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w,top: 2.h),
                    child: AppContainer(
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/orderBACKGROUND.svg',
                            color: Colors.white.withOpacity(0.3),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    DefaultText(
                                      text: 'Sub-Total',
                                      textColor: Colors.white,
                                      textSize: 15.sp,
                                    ),
                                    BlocBuilder<OrderCubit, OrderState>(
                                      builder: (context, state) {
                                        return DefaultText(
                                          text: '${OrderCubit.totalPrice}\$',
                                          textColor: Colors.white,
                                          textSize: 15.sp,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    DefaultText(
                                      text: 'Delivery Charge',
                                      textColor: Colors.white,
                                      textSize: 15.sp,
                                    ),
                                    DefaultText(
                                      text: '0\$',
                                      textColor: Colors.white,
                                      textSize: 12.sp,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    DefaultText(
                                      text: 'Discount',
                                      textColor: Colors.white,
                                      textSize: 15.sp,
                                    ),
                                    DefaultText(
                                      text: '0\$',
                                      textColor: Colors.white,
                                      textSize: 15.sp,
                                    ),
                                  ],
                                ),
                              ),
                              BlocBuilder<OrderCubit, OrderState>(
                                builder: (context, state) {
                                  return Padding(
                                    padding: EdgeInsets.all(8.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        DefaultText(
                                          text: 'Total',
                                          textColor: Colors.white,
                                          textSize: 15.sp,
                                          weight: FontWeight.bold,
                                        ),
                                        DefaultText(
                                          text: '${OrderCubit.totalPrice}\$',
                                          textColor: Colors.white,
                                          textSize: 15.sp,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: Container(
                                  width: 80.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.sp)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      OrderCubit.get(context).createOrders();
                                      Navigator.pushNamedAndRemoveUntil(context, screens.rateDriverScreen, (route) => false);
                                    },
                                    child: DefaultText(
                                      text: 'Place my order',
                                      textColor: lightGreen,
                                      weight: FontWeight.bold,
                                      textSize: 15.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
