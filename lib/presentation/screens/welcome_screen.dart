import 'package:concentric_transition/concentric_transition.dart';
import 'package:event_hub/presentation/screens/onboarding/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final pages = [
    const PageData(
      icon: Icons.travel_explore,
      title: "Explore Upcoming\nand nearby events",
      bgColor: Color(0xFF0043D0),
      textColor: Colors.white,
    ),
    const PageData(
      icon: Icons.wallet,
      title: "Easy payments and fast\nevent ticketing",
      textColor: Colors.white,
      bgColor: Color(0xFFFDBFDD),
    ),
    const PageData(
      icon: Icons.stars,
      title: "Let's go to your favorite\nevent right now!",
      bgColor: Color(0xFFFFFFFF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        onFinish: () => Navigator.pushReplacementNamed(
          context,
          SignUpScreen.routeName,
        ),
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        nextButtonBuilder: (context) => Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: 20.h),
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        itemCount: pages.length,
        duration: const Duration(milliseconds: 1400),
        // opacityFactor: 2.0,
        // scaleFactor: 0.2,
        // verticalPosition: 0.7,
        // direction: Axis.vertical,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page),
          );
        },
      ),
    );
  }
}

class PageData {
  final String? title;
  final IconData? icon;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Column(
      children: [
        space(10),
        _Image(
          page: page,
          size: 190,
          iconSize: 170,
        ),
        space(8),
        _Text(
          page: page,
          style: TextStyle(
            fontSize: screenHeight * 0.046,
          ),
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    this.style,
  }) : super(key: key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      page.title ?? '',
      style: TextStyle(
        color: page.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Helvetica',
        letterSpacing: 0.0,
        fontSize: 18,
        height: 1.2,
      ).merge(style),
      textAlign: TextAlign.center,
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.size,
    required this.iconSize,
  }) : super(key: key);

  final PageData page;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final bgColor = page.bgColor
        // .withBlue(page.bgColor.blue - 40)
        .withGreen(page.bgColor.green + 20)
        .withRed(page.bgColor.red - 100)
        .withAlpha(90);

    final icon1Color =
        page.bgColor.withBlue(page.bgColor.blue - 10).withGreen(220);
    final icon2Color = page.bgColor.withGreen(66).withRed(77);
    final icon3Color = page.bgColor.withRed(111).withGreen(220);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
        color: bgColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          // Positioned.fill(
          //   right: -5,
          //   bottom: -5,
          //   child: RotatedBox(
          //     quarterTurns: 2,
          //     child: Icon(
          //       page.icon,
          //       size: iconSize + 20,
          //       color: icon1Color,
          //     ),
          //   ),
          // ),
          // Positioned.fill(
          //   child: RotatedBox(
          //     quarterTurns: 5,
          //     child: Icon(
          //       page.icon,
          //       size: iconSize + 20,
          //       color: icon2Color,
          //     ),
          //   ),
          // ),
          Icon(
            page.icon,
            size: iconSize,
            //color: icon3Color,
          ),
        ],
      ),
    );
  }
}
