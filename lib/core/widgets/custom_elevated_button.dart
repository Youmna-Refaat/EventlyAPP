import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/theme/app_text_styles.dart';
import 'package:evently_app/extenstions/center_ext.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final bool hasPrefixIcn;
  final bool? prefixIcon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = AppColors.kWhite,
    this.radius = 16,
    this.hasPrefixIcn = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        side: const BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      child: Text(
        text,
        style: AppTextStyles.styleMedium20(context).copyWith(
          color: textColor,
        ),
      ).setToCenter(),
    );
  }
}
