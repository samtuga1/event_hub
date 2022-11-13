import 'sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../consts/global_methods.dart';
import '../../widgets/textformbox.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool rememberMeStat = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: theme.textTheme.headline2,
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    TextFormBox(
                      theme: theme,
                      onChanged: (String value) {
                        // print(value);
                      },
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
                      theme: theme,
                      onChanged: (String value) {},
                      labelText: 'Enter your password',
                      prefixIcon: 'assets/images/onboarding/lock-icon.png',
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return 'Your password is required';
                        }
                        if (value.trim().length < 8) {
                          return 'Please enter 8 or more characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 54.h,
                    ),
                    GlobalMethods.materialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Navigator.pushReplacementNamed(
                          //   context,
                          //   NavigationScreen.routeName,
                          // );
                        }
                      },
                      theme: theme,
                      child: 'Login',
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create an account?',
                            style: theme.textTheme.bodyText1),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(
                              SignUpScreen.routeName,
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: theme.textTheme.bodyText1
                                ?.copyWith(color: theme.primaryColor),
                          ),
                        )
                      ],
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
