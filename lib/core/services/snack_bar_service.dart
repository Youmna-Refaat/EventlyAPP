import 'package:bot_toast/bot_toast.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/theme/app_text_styles.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:evently_app/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SnackBarService {
  static void showSuccessMessage(String message) {
    BotToast.showCustomNotification(
        duration: const Duration(seconds: 2),
        dismissDirections: [DismissDirection.horizontal],
        align: Alignment.topCenter,
        toastBuilder: (void Function() cancelFunction) {
          return Container(
            height: 0.10.height,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: Colors.green, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  message,
                  style:
                      AppTextStyles.styleMedium16(navigatorKey.currentContext!),
                  maxLines: 2,
                ),
                const Icon(FontAwesomeIcons.circleCheck, color: Colors.green)
              ],
            ).setSymmetricPadding(navigatorKey.currentContext!,
                horizontal: 20, vertical: 10),
          ).setSymmetricPadding(navigatorKey.currentContext!,
              horizontal: 20, vertical: 15);
        });
  }

  static void showErrorMessage(String message) {
    BotToast.showCustomNotification(
        duration: const Duration(seconds: 2),
        dismissDirections: [DismissDirection.horizontal],
        align: Alignment.topCenter,
        toastBuilder: (void Function() cancelFunction) {
          return Container(
            height: 0.10.height,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: Colors.red, width: 1.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  message,
                  style:
                      AppTextStyles.styleMedium16(navigatorKey.currentContext!),
                ),
                const Icon(FontAwesomeIcons.circleXmark, color: Colors.red)
              ],
            ).setSymmetricPadding(navigatorKey.currentContext!,
                horizontal: 20, vertical: 10),
          ).setSymmetricPadding(navigatorKey.currentContext!,
              horizontal: 20, vertical: 15);
        });
  }
}
