import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../../business_logic/registration_cubit/registration_cubit.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_back_button.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';
import '../../widgets/text_form_filed.dart';

class SignUpProcess extends StatefulWidget {

  final String email;
  final String password;
  final bool keepMeSigned;

  const SignUpProcess({
    super.key,
    required this.email,
    required this.password, required this.keepMeSigned,
  });

  @override
  State<SignUpProcess> createState() => _SignUpProcessState();
}

class _SignUpProcessState extends State<SignUpProcess> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  late RegistrationCubit cubit;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  DefaultBackButton(icon: Icons.arrow_back_ios_new,onPressed: (){Navigator.pop(context);},),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    child: DefaultText(
                      text: 'Fill in your bio to get started',
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
                    padding: EdgeInsets.only(top: 2.h, right: 8.w, left: 5.w),
                    child: DefaultTextFormField(
                      controller: firstNameController,
                      hintText: 'First Name',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 3.h,
                      right: 8.w,
                      left: 5.w,
                    ),
                    child: DefaultTextFormField(
                      controller: lastNameController,
                      hintText: 'Last Name',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 3.h, right: 8.w, left: 5.w, bottom: 2.h),
                    child: DefaultTextFormField(
                      controller: mobileController,
                      hintText: 'Mobile Number',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, bottom: 1.h, left: 20.w),
                    child: AppContainer(
                      child: DefaultMaterialButton(
                        width: 57.w,
                        heigth: 9.h,
                        onPressed: () {
                          cubit.register(
                              email: widget.email,
                              password: widget.password,
                              mobile: mobileController.text,
                              keepMeSigned: widget.keepMeSigned,
                              name:
                                  '${firstNameController.text} ${lastNameController.text}');
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
    ));
  }
}
