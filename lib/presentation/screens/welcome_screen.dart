import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final List<Introduction> list = [
    Introduction(
      title: 'Explore events',
      subTitle: "Get to know upcoming and nearby events",
      imageUrl: 'assets/images/onboarding/1.png',
    ),
    Introduction(
      title: 'Easy accessibility',
      subTitle:
          "Easy payments and fast event ticketing to be the first show off",
      imageUrl: 'assets/images/onboarding/2.png',
    ),
    Introduction(
      title: 'Getting ready?',
      subTitle: "Let's go to your favorite event right now!🏃‍♂️",
      imageUrl: 'assets/images/onboarding/3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.of(context).pushReplacementNamed('sign_in');
      },
    );
  }
}
