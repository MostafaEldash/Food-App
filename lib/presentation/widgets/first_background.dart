import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../business_logic/app_cubit.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, required this.children, required this.index});
  final List<Widget> children;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SvgPicture.asset(AppCubit.get(context).background[index],fit: BoxFit.fill,),
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ))
    ]);
  }
}
