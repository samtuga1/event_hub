import 'package:bubbles_selection/bubbles_selection.dart';
import 'package:event_hub/presentation/screens/onboarding/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import '../../../consts/global_methods.dart';

class InterestScreen extends StatefulWidget {
  static const routeName = 'features_screen';
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<String> bubbles = [
    'Music 🎧️',
    'Food 🥗',
    'Party 🥂',
    'Sports ⚽️',
    'Movies 🎬️',
    'Arts 🎭️',
    'Gaming🎮',
    'Others 🏹'
  ];
  List<Bubble> selectedBubbles = [];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: GlobalMethods.globalAppBar('Pick your Interests'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BubbleSelection(
                bubbles: [
                  ...bubbles.map(
                    (bubble) => Bubble(
                      text: bubble,
                      activeColor: const Color(0xffFFF4EE),
                      inactiveColor: const Color(0xffF2F6FD),
                      textStyle:
                          theme.textTheme.bodyText1!.copyWith(fontSize: 20.sp),
                    ),
                  ),
                ],
                selectedBubbles: selectedBubbles,
                size: const Size(
                  550,
                  300,
                ),
                onSelect: (bubble) {
                  selectedBubbles.add(bubble);
                },
                onRemoved: (bubble) {
                  selectedBubbles.remove(bubble);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: GlobalMethods.materialButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  MapScreen.routeName,
                ),
                child: 'Continue',
                theme: theme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
