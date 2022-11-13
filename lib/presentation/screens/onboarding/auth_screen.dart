import 'dart:developer';

import 'package:event_hub/consts/global_methods.dart';
import 'package:event_hub/logic/cubits/local_auth/local_auth_cubit.dart';
import 'package:event_hub/presentation/screens/onboarding/interest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth_screen';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: GlobalMethods.globalAppBar('Back'),
      body: BlocConsumer<LocalAuthCubit, LocalAuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final auth = context.read<LocalAuthCubit>();
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Provide extra security to keep things personal',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headline2,
                  ),
                  Expanded(
                    child: LottieBuilder.asset('assets/lottie/auth.zip'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GlobalMethods.materialButton(
                          onPressed: () => Navigator.of(context).pushNamed(
                            InterestScreen.routeName,
                          ),
                          child: 'Skip',
                          theme: theme,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GlobalMethods.materialButton(
                          onPressed: () async {
                            await auth.authenticate();
                          },
                          child: 'Continue',
                          theme: theme,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
