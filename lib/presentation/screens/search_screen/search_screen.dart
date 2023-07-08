import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/app_cubit.dart';
import '../../../business_logic/search_cubit/search_cubit.dart';
import '../../styles/colors.dart';
import '../../views/food_list_item.dart';
import '../../widgets/default_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController searchController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  late SearchCubit searchCubit;
  @override
  void didChangeDependencies() {
    searchCubit = SearchCubit.get(context);
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
                          onPressed: () {
                          },
                          color: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp)),
                          child:
                              SvgPicture.asset('assets/Icon Notifiaction.svg')),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: SearchBar(
                    textStyle: const MaterialStatePropertyAll(
                        TextStyle(color: backButtonArrow)),
                    controller: searchController,

                    hintText: 'What do you want to order?',
                    onChanged: (value) {
                      searchCubit.getFoodWithName(foodName: value);
                    },
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                    leading: const Icon(
                      Icons.search,
                      color: backButtonArrow,
                    )),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return ListView.separated(
                        itemBuilder: (context, index) => FoodListItem(
                          index: index,
                          allFoodData: searchCubit.allFoodResponse.data[index],
                        ),
                        itemCount: searchCubit.allFoodResponse.data.length,
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
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
