import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';

class EditPaymentScreen extends StatefulWidget {
  const EditPaymentScreen({super.key});

  @override
  State<EditPaymentScreen> createState() => _EditPaymentScreenState();
}

class _EditPaymentScreenState extends State<EditPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                    text: 'Payment',
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
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: SvgPicture.asset(
                                    'assets/Payoneer_logo 1.svg'),
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
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Column(
                        children: [
                          Row(                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: SvgPicture.asset('assets/paypal.svg'),
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
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: SvgPicture.asset(
                                  'assets/visa.svg',
                                ),
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
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
