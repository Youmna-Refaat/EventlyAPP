import 'package:flutter/material.dart';
import 'package:evently_app/core/constants/local_storage_keys.dart';
import 'package:evently_app/core/routes/screens_route_names.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:evently_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_images.dart';
import '../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstRun = prefs.getBool(LocalStorageKeys.isFirstTimeRun);

    await Future.delayed(const Duration(seconds: 2));

    if (isFirstRun == true) {
      await prefs.setBool(LocalStorageKeys.isFirstTimeRun, false);
      navigatorKey.currentContext!.removeAllAndPushNamed(
          routeName: ScreensRouteNames.onBoardingStartRoute);
    } else {
      navigatorKey.currentContext!
          .removeAllAndPushNamed(routeName: ScreensRouteNames.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.imagesLogo,
            height: 0.22.height,
            width: 0.34.width,
          )
        ],
      ).setToCenter(),
    );
  }
}
