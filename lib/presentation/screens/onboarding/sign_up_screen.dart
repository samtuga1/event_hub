import 'package:event_hub/consts/global_methods.dart';
import 'package:event_hub/presentation/screens/onboarding/login_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/textformbox.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign_up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: theme.textTheme.headline2,
                      ),
                      SizedBox(
                        height: 29.h,
                      ),

                      TextFormBox(
                        keyboardType: TextInputType.emailAddress,
                        theme: theme,
                        onChanged: (String value) {},
                        controller: emailController,
                        labelText: 'Enter email here',
                        prefixIcon: 'assets/images/onboarding/email-icon.png',
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Your email is required';
                          }
                          if (!value.contains('@')) {
                            return 'Enter a valid email address';
                          }
                          if (value.contains(' ')) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      TextFormBox(
                        controller: passwordController,
                        theme: theme,
                        onChanged: (String value) {},
                        labelText: 'Enter your password',
                        prefixIcon: 'assets/images/onboarding/lock-icon.png',
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Your password is required';
                          }
                          if (value.trim().length < 6) {
                            return 'Please enter 8 or more characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 54.h,
                      ),
                      // BlocBuilder<UserBloc, UserState>(
                      //     builder: (context, state) {
                      //   if (state is UserLoading) {
                      //     return Container(
                      //       padding: EdgeInsets.symmetric(vertical: 20.h),
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8.r),
                      //         color: theme.buttonColor,
                      //       ),
                      //       child: Center(
                      //         child: const SizedBox(
                      //           height: 20,
                      //           width: 20,
                      //           child: CircularProgressIndicator(
                      //             color: Colors.white,
                      //             strokeWidth: 2.8,
                      //           ),
                      //         ).animate().slide(
                      //               duration:
                      //                   const Duration(milliseconds: 250),
                      //               begin: Offset.zero,
                      //               curve: Curves.easeOut,
                      //               end: const Offset(6, 0),
                      //             ),
                      //       ),
                      //     );
                      //   }
                      //   return
                      // }),
                      GlobalMethods.materialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // context.read<UserBloc>().add(
                            //       CreateUser(
                            //         email: emailController.text,
                            //         password: passwordController.text,
                            //       ),
                            //     );
                            Navigator.of(context).pushNamed(
                              VerifyEmail.routeName,
                            );
                          }
                        },
                        theme: theme,
                        child: 'Sign Up',
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create an account?',
                            style: theme.textTheme.bodyText1,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                LoginScreen.routeName,
                              );
                            },
                            child: Text(
                              'Login',
                              style: theme.textTheme.bodyText1
                                  ?.copyWith(color: theme.primaryColor),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      AuthButton(
                        themes: theme,
                        iconUrl: 'assets/images/onboarding/google.png',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.themes,
    required this.iconUrl,
  }) : super(key: key);
  final ThemeData themes;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          spreadRadius: 1.r,
          blurRadius: 30.r,
          color: const Color(0xFF1E1E1E).withOpacity(0.1),
        ),
      ]),
      width: double.infinity,
      height: 68.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(themes.scaffoldBackgroundColor),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          onPressed: () {},
          child: Row(children: [
            Image.asset(iconUrl),
            SizedBox(
              width: 16.0.w,
            ),
            Text(
              'Sign Up with Google',
              style: theme.textTheme.button,
            ),
          ]),
        ),
      ),
    );
  }
}
