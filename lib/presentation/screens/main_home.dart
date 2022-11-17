import 'package:event_hub/presentation/screens/bottom_nav_screen.dart';
import 'package:event_hub/presentation/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (!snapshot.hasData) {
          return WelcomeScreen();
        } else {
          return const BottomBarScreen();
        }
      },
    );
  }
}
