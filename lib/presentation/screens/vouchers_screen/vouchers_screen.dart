import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../../business_logic/order_cubit/order_cubit.dart';
import '../../styles/colors.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';

class VouchersScreen extends StatefulWidget {
  const VouchersScreen({super.key});

  @override
  State<VouchersScreen> createState() => _VouchersScreenState();
}

class _VouchersScreenState extends State<VouchersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BackGround(
          index: 1,
          children: [
            Center(
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
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    child: DefaultText(
                      text: 'Voucher promo',
                      weight: FontWeight.bold,
                      textSize: 22.sp,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      width: 80.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [lightGreen, deepGreen],
                        ),
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/voucher_frame.png',
                            height: 100.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: DefaultText(
                                        text: 'Special Deal for\njuly',
                                        weight: FontWeight.bold,
                                        textColor: Colors.white,
                                        textSize: 15.sp,
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        OrderCubit.get(context).createOrders();
                                        Navigator.pushNamed(
                                            context, screens.rateDriverScreen);
                                      },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: const DefaultText(
                                        text: 'Buy Now',
                                        textColor: lightGreen,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    child: Container(
                      width: 80.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(0, 233, 247, 186),
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/second_voucher_frame.png',
                            height: 100.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: DefaultText(
                                        text: 'Special Deal for\njuly',
                                        weight: FontWeight.bold,
                                        textColor: const Color(0xff6B3A5B),
                                        textSize: 15.sp,
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        OrderCubit.get(context).createOrders();
                                        Navigator.pushNamed(
                                            context, screens.rateDriverScreen);
                                      },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: const DefaultText(
                                        text: 'Buy Now',
                                        textColor: lightGreen,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                    child: AppContainer(
                      child: DefaultMaterialButton(
                        width: 80.w,
                        heigth: 9.h,
                        onPressed: () {
                          OrderCubit.get(context).createOrders();

                          Navigator.pushNamed(
                              context, screens.rateDriverScreen);
                        },
                        child: DefaultText(
                          text: 'Check Out',
                          textColor: Colors.white,
                          textSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
