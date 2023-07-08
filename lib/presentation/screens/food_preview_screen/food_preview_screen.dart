import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/business_logic/food_cubit/food_cubit.dart';
import 'package:food_ninja/data/responses/all_food_response/all_food_response.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../business_logic/order_cubit/order_cubit.dart';
import '../../styles/colors.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';

class FoodPreviewScreen extends StatefulWidget {
  const FoodPreviewScreen({super.key, required this.allFoodData, required this.index});
  final AllFoodData allFoodData;
  final int index;
  @override
  State<FoodPreviewScreen> createState() => _FoodPreviewScreenState();
}

class _FoodPreviewScreenState extends State<FoodPreviewScreen> {

  late FoodCubit foodCubit;

  @override
  void didChangeDependencies() {
    foodCubit = FoodCubit.get(context);
    print(widget.index);
        super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.5),
                      color: backButtonArrow.withOpacity(0.1),
                    ),
                    child: const DefaultText(
                      text: 'Popular',
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                  child: DefaultText(
                      text: widget.allFoodData.name,
                      textSize: 20.sp,
                      weight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_half,
                        color: lightGreen,
                      ),
                      DefaultText(
                        text: "4.5 rating",
                        textColor: Colors.grey,
                        textSize: 10.sp,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.h,bottom: 10.h),
                  child: AppContainer(
                      child: DefaultMaterialButton(
                        width: 57.w,
                        heigth: 9.h,
                        onPressed: () {
                          if(!OrderCubit.listOfOrders.contains(foodCubit.allFoodResponse.data[widget.index])) {
                            OrderCubit.get(context).addOrderToList(
                              foodCubit.allFoodResponse.data[widget.index],
                            );

                          }
                        },
                        child: DefaultText(
                          text: 'Add To Chart',
                          textColor: Colors.white,
                          textSize: 15.sp,
                        ),
                      )),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
