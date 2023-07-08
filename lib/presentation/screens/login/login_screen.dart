import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../../business_logic/login_cubit/login_cubit.dart';
import '../../styles/colors.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';
import '../../widgets/text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = LoginCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: BackGround(
            index: 0,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/untitled (1).png',
                      width: 35.w,
                      height: 35.h,
                    ),
                    DefaultText(
                      text: 'Login To Your Account',
                      textSize: 20.sp,
                      weight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6.h, right: 8.w, left: 8.w),
                      child: DefaultTextFormField(
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (text.length < 6) {
                            return '';
                          }
                          return null;
                        },
                        controller: emailController,
                        hintText: 'Email',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 2.h, right: 8.w, left: 8.w, bottom: 2.h),
                      child: DefaultTextFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (text.length < 8) {
                            return 'password cannot be less than 8';
                          }
                          return null;
                        },
                      ),
                    ),
                    DefaultText(
                      text: 'Or Continue With',
                      textSize: 12.sp,
                      weight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 5.h, right: 5.w, left: 7.w),
                          child: SizedBox(
                            height: 8.h,
                            width: 40.w,
                            child: OutlinedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    Fluttertoast.showToast(
                                        msg: '',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.sp);
                                  });
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(end: 3.w),
                                    child: SvgPicture.asset(
                                      'assets/google-icon 1.svg',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  const DefaultText(
                                    textColor: deepGreen,
                                    text: 'Google',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h, right: 5.w),
                          child: SizedBox(
                            height: 8.h,
                            width: 40.w,
                            child: OutlinedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    Fluttertoast.showToast(
                                        msg: cubit.loginResponse.message,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.sp);
                                  });
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(end: 2.w),
                                    child: SvgPicture.asset(
                                        'assets/facebook-3 1.svg'),
                                  ),
                                  const Flexible(
                                    child: DefaultText(
                                      text: 'Facebook',
                                      textColor: deepGreen,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 2.h,
                      ),
                      child: InkWell(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context, screens.loginScreen, (route) => false),
                        child: DefaultText(
                          text: 'forgot your password?',
                          textColor: lightGreen,
                          textSize: 10.sp,
                          weight: FontWeight.bold,
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, bottom: 1.h),
                      child: AppContainer(
                        child: DefaultMaterialButton(
                          width: 57.w,
                          heigth: 9.h,
                          onPressed: () {
                            cubit.login(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context);
                          },
                          child: DefaultText(
                            text: 'Login',
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
      ),
    );
  }
}
