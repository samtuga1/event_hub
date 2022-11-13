import 'package:event_hub/presentation/screens/not_found_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/interest_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/fill_info_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/login_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/map_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/sign_up_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/verify_screen.dart';
import 'package:flutter/material.dart';

import '../screens/bottom_nav_screen.dart';
import '../screens/onboarding/auth_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignUpScreen.routeName:
        return route(const SignUpScreen());
      case LoginScreen.routeName:
        return route(const LoginScreen());
      case VerifyEmail.routeName:
        return route(const VerifyEmail());
      case FillInfoScreen.routeName:
        return route(const FillInfoScreen());
      case AuthScreen.routeName:
        return route(const AuthScreen());
      case InterestScreen.routeName:
        return route(const InterestScreen());
      case MapScreen.routeName:
        return route(const MapScreen());
      case BottomBarScreen.routeName:
        return route(BottomBarScreen());
      default:
        return route(const NotFoundScreen());
    }
  }
}

Route route(Widget routeWidget) {
  return MaterialPageRoute(
    builder: (context) => routeWidget,
  );
}
