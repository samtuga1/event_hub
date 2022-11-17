import 'package:device_preview/device_preview.dart';
import 'package:event_hub/logic/cubits/image_picker/image_picker_cubit.dart';
import 'package:event_hub/logic/cubits/local_auth/local_auth_cubit.dart';
import 'package:event_hub/logic/cubits/location/location_cubit.dart';
import 'package:event_hub/presentation/router/app_router.dart';
import 'package:event_hub/presentation/screens/main_home.dart';
import 'package:event_hub/presentation/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';

import 'firebase_options.dart';
import 'presentation/screens/welcome_screen.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.ios,
  );
  // await ScreenUtil.ensureScreenSize();
  return runApp(
    // const MyApp(),
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ScrollBehavior defaultScrollBehaviour(BuildContext context, bool isIos) =>
      ScrollConfiguration.of(context).copyWith(
        physics: isIos
            ? const BouncingScrollPhysics()
            : const ClampingScrollPhysics(),
      );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<ImagePickerCubit>(
            create: (context) => ImagePickerCubit(),
          ),
          BlocProvider<LocalAuthCubit>(
            create: (context) => LocalAuthCubit(),
          ),
          BlocProvider<LocationCubit>(create: (context) {
            return LocationCubit();
          }),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: defaultScrollBehaviour(
            context,
            Theme.of(context).platform == TargetPlatform.iOS,
          ),
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: Styles.themeData(false),
          home: const MainHome(),
          onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
        ),
      ),
    );
  }
}
