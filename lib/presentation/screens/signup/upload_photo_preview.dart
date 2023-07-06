import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../widgets/app_container.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';

class UploadPhotoPreviewScreen extends StatefulWidget {
  const UploadPhotoPreviewScreen({super.key});

  @override
  State<UploadPhotoPreviewScreen> createState() => _UploadPhotoPreviewScreenState();
}

class _UploadPhotoPreviewScreenState extends State<UploadPhotoPreviewScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Form(
      key: formKey,
      child: BackGround(
        index: 1,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultBackButton(icon: Icons.arrow_back_ios_new,onPressed: (){Navigator.pop(context);},),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: DefaultText(
                    text: 'Upload Your Photo Profile',
                    weight: FontWeight.bold,
                    textSize: 22.sp,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                  child: DefaultText(
                    text:
                    'This data will be displayed in your account\n profile for security',
                    textSize: 10.sp,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
                  child: SizedBox(
                    height: 15.h,
                    width: 80.w,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/Gallery Icon.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
                  child: SizedBox(
                    height: 15.h,
                    width: 80.w,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/Camera Icon.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(top: 20.h, bottom: 1.h, left: 22.w),
                  child: AppContainer(
                    child: DefaultMaterialButton(
                      width: 57.w,
                      heigth: 9.h,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, screens.signUpPaymentMethodScreen);
                      },
                      child: DefaultText(
                        text: 'Next',
                        textColor: Colors.white,
                        textSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    ),
    );
  }
}
