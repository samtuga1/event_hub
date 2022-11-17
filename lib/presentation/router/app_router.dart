import 'package:event_hub/presentation/screens/inner_screens/event_detail_screen.dart';
import 'package:event_hub/presentation/screens/not_found_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/interest_screen.dart';
import 'package:event_hub/presentation/screens/onboarding/fill_info_screen.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:event_hub/presentation/screens/onboarding/map_screen.dart';
import 'package:flutter/material.dart';

import '../screens/bottom_nav_screen.dart';
import '../screens/onboarding/auth_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'sign_in':
        return route(
          SignInScreen(
            providers: [EmailAuthProvider()],
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                Navigator.pushReplacementNamed(
                  context,
                  BottomBarScreen.routeName,
                );
              }),
            ],
          ),
        );
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
      case EventDetail.routeName:
        return route(const EventDetail());
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
