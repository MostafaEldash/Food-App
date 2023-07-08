import 'package:flutter/material.dart';
import 'package:food_ninja/business_logic/registration_cubit/registration_cubit.dart';
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
  State<UploadPhotoPreviewScreen> createState() =>
      _UploadPhotoPreviewScreenState();
}

class _UploadPhotoPreviewScreenState extends State<UploadPhotoPreviewScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late RegistrationCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = RegistrationCubit.get(context);
    super.didChangeDependencies();
  }

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
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                      child: RegistrationCubit.image.path != ''
                          ? Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.sp),
                                child: Image.file(
                                  RegistrationCubit.image,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.sp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(30.sp)),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                          : const DefaultText(text: "You didn't Choose image"),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 8.h, bottom: 1.h, left: 22.w),
                      child: AppContainer(
                        child: DefaultMaterialButton(
                          width: 57.w,
                          heigth: 9.h,
                          onPressed: () {
                            if(RegistrationCubit.image.path!='') {
                              cubit.uploadPhoto();
                            }
                            Navigator.pushNamed(
                                context, screens.setLocationScreen);
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
