import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.primaryColor
    ..backgroundColor = AppColors.grey
    ..indicatorColor = AppColors.primaryColor
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withValues(alpha: 0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
