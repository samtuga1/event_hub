import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../consts/global_methods.dart';
import 'fill_info_screen.dart';

class VerifyEmail extends StatefulWidget {
  static const routeName = '/check_email';
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late Timer _timer;
  @override
  void didChangeDependencies() {
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        FillInfoScreen.routeName,
        (route) => false,
      );
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();
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
        appBar: GlobalMethods.globalAppBar('Sign Up'),
        body: ListView(
          children: [
            SizedBox(
              height: 68.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 64.h,
                  ),
                  Text('Check your E-mail', style: theme.textTheme.headline2),
                  SizedBox(
                    height: 52.h,
                  ),
                  Image.asset('assets/images/onboarding/email-open.png'),
                  Text(
                    'We have sent verification link to your email. Click on it to verify email',
                    style: theme.textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Text(
                    'Did not receive the email? Check your spam filter, or try another email address',
                    style: theme.textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
