import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Lottie.asset('assets/images/not-found.zip'),
      ),
    );
  }
}
