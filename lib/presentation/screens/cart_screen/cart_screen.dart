import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../../business_logic/order_cubit/order_cubit.dart';
import '../../styles/colors.dart';
import '../../views/order_list_item.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late OrderCubit orderCubit;

  @override
  void didChangeDependencies() {
    orderCubit = OrderCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AppCubit.get(context).background[1],
          fit: BoxFit.fill,
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                child: DefaultText(
                  text: 'Order details',
                  weight: FontWeight.bold,
                  textSize: 22.sp,
                  textAlign: TextAlign.start,
                ),
              ),
              BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => OrderItem(
                            allFoodData:
                                OrderCubit.get(context).getOrders()[index],
                            index: index,
                          ),
                      separatorBuilder: (context, index) => Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  height: 1.h,
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                      itemCount: OrderCubit.listOfOrders.length);
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w),
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
        ),
      ],
    );
  }
}
