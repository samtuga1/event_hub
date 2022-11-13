import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  // MY APP'S THEME DATA
  static ThemeData themeData(bool isDarkMode) {
    return ThemeData(
      splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      useMaterial3: true,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: isDarkMode ? const Color(0xff181818) : Colors.white,
      //   unselectedLabelStyle: TextStyle(
      //     fontWeight: FontWeight.w400,
      //     fontSize: 16.sp,
      //     fontFamily: 'Gilroy',
      //     color: isDarkMode ? Colors.white : const Color(0xffD6DBDE),
      //   ),
      //   selectedLabelStyle: TextStyle(
      //     fontWeight: FontWeight.w400,
      //     fontSize: 16.sp,
      //     fontFamily: 'Gilroy',
      //     color: const Color(0xFF17A5DF),
      //   ),
      // ),
      // // COLOR FOR SEARCH BAR FILL
      // accentColor:
      //     isDarkMode ? const Color(0xff272727) : const Color(0xffF0F1F5),
      // appBarTheme: AppBarTheme(
      //   titleTextStyle: TextStyle(
      //     fontWeight: FontWeight.w600,
      //     fontSize: 24.sp,
      //     color: isDarkMode ? const Color(0xff17A5DF) : Colors.black,
      //     fontFamily: 'Gilroy',
      //   ),
      //   foregroundColor: const Color(0xFF17A5DF),
      //   backgroundColor: isDarkMode ? const Color(0xff181818) : Colors.white,
      // ),
      // chipTheme: ChipThemeData(
      //   backgroundColor:
      //       isDarkMode ? const Color(0xff272727) : const Color(0xffF0F1F5),
      // ),
      primaryColor: const Color(0xff6F5FF8),
      textTheme: textTheme(isDarkMode),
      scaffoldBackgroundColor:
          isDarkMode ? const Color(0xff181818) : Colors.white,
      // splashColor: const Color(0xFFD0F0E4),
      buttonColor: const Color(0xff6F5FF8),
    );
  }
}

// TEXTTHEME FOR THE WHOLE APP
TextTheme textTheme(bool isDarkMode) {
  return TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 32.sp,
      color: isDarkMode ? Colors.white : Colors.black,
      fontFamily: 'Gilroy',
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22.sp,
      color: isDarkMode ? const Color(0xff6F5FF8) : Colors.black,
      fontFamily: 'Gilroy',
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 19.sp,
      fontFamily: 'Gilroy',
      color: isDarkMode ? Colors.white : Colors.black,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 19.sp,
      fontFamily: 'Gilroy',
      color: isDarkMode ? Colors.white : Colors.black,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15.5.sp,
      fontFamily: 'Gilroy',
      color: const Color(0xff637381),
    ),
    button: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.sp,
      color: isDarkMode ? Colors.white : Colors.black,
      fontFamily: 'Gilroy',
    ),
  );
}
