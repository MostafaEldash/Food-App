import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../business_logic/order_cubit/order_cubit.dart';
import '../../data/responses/all_food_response/all_food_response.dart';
import '../styles/colors.dart';
import '../widgets/app_container.dart';
import '../widgets/default_text.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.allFoodData,
    required this.index,
  });

  final AllFoodData allFoodData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5.sp),
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 8.sp)
              ],
              color: deleteColor,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset('assets/Icon trash.svg'),
              ],
            ),
          ),
          Dismissible(
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              OrderCubit.get(context).removeOrderFromList(
                index: index,
              );
            },
            key: UniqueKey(),
            child: Container(
              margin: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurStyle: BlurStyle.outer,
                      blurRadius: 8.sp)
                ],
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultText(
                                text: allFoodData.name,
                                textSize: 15.sp,
                                weight: FontWeight.bold,
                              ),
                              DefaultText(
                                text: '${allFoodData.price}\$',
                                textSize: 10.sp,
                                textColor: backButtonArrow,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: lightGreen.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(15.sp)),
                                    child: IconButton(
                                      onPressed: () {
                                        OrderCubit.get(context)
                                            .decreaseQuantity(
                                                index, allFoodData);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: deepGreen,
                                      ),
                                    ),
                                  ),
                                  DefaultText(
                                      text: OrderCubit.listOfQuantities[index]
                                          .toString()),
                                  AppContainer(
                                    child: IconButton(
                                      onPressed: () {
                                        OrderCubit.get(context)
                                            .increaseQuantity(
                                                index, allFoodData);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}
