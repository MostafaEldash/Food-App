import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:food_ninja/core/screens_names.dart' as screens;
import '../../../business_logic/app_cubit.dart';
import '../../styles/colors.dart';
import '../../widgets/app_container.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/first_background.dart';
import '../../widgets/text_form_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
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
                        text: 'Sign Up For Free',
                        textSize: 20.sp,
                        weight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(top: 6.h, right: 8.w, left: 8.w),
                        child: DefaultTextFormField(
                          prefixIcon: SvgPicture.asset('assets/Profile.svg'),
                          controller: userNameController,
                          hintText: 'User Name',
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(top: 2.h, right: 8.w, left: 8.w),
                        child: DefaultTextFormField(
                          prefixIcon: SvgPicture.asset(
                            'assets/Message.svg',
                            width: 5.sp,
                            height: 5.sp,
                          ),
                          controller: emailController,
                          hintText: 'Email',
                        ),
                      ),
                      BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: 2.h, right: 8.w, left: 8.w),
                            child: DefaultTextFormField(
                              isHidden: cubit.isHidden,
                              prefixIcon: SvgPicture.asset('assets/Lock.svg'),
                              suffixIcon: IconButton(color: Colors.grey,
                                onPressed: () {
                                  print(cubit.isHidden);
                                  cubit.showAndHidePassword();
                                },
                                icon: Icon(cubit.suffixIcon),
                              ),
                              controller: passwordController,
                              hintText: 'Password',
                            ),
                          );
                        },
                      ),
                      BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          return CheckboxListTile(
                            value: cubit.keepMeSignedIn,
                            onChanged: (value) {
                              cubit.changeKeepMeSigned();
                            },
                            checkboxShape: const CircleBorder(),
                            activeColor: lightGreen,
                            title: DefaultText(
                              text: 'Keep me signed in',
                              textSize: 12.sp,
                              textColor: Colors.grey,
                            ),
                          );
                        },
                      ),BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          return CheckboxListTile(
                            value: cubit.offersEmail,
                            onChanged: (value) {
                              cubit.changeOffersEmail();
                            },
                            checkboxShape: const CircleBorder(),
                            activeColor: lightGreen,
                            title: DefaultText(
                              text: 'Email Me About Special Pricing',
                              textSize: 12.sp,
                              textColor: Colors.grey,
                            ),
                          );
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 3.h, bottom: 1.h),
                        child: AppContainer(
                          child: DefaultMaterialButton(
                            width: 57.w,
                            heigth: 9.h,
                            onPressed: () {
                              Navigator.pushNamed(arguments: {
                                'email': emailController.text,
                                'password': passwordController.text,
                                'keepMeSigned': cubit.keepMeSignedIn
                              },
                                  context, screens.signUpProcessScreen);
                            },
                            child: DefaultText(
                              text: 'Create Account',
                              textColor: Colors.white,
                              textSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamedAndRemoveUntil(
                                context, screens.loginScreen, (route) => false),
                        child: DefaultText(
                          text: 'already have an account?',
                          textColor: lightGreen,
                          textSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
