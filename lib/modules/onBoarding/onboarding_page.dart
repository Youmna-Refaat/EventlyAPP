import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_images.dart';
import '../../core/models/onboarding_model.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  const OnboardingPage({
    super.key,
    required this.onBoardingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppImages.imagesOnBoardingAppBar,
          height: 50,
        ).setVerticalPadding(context, value: 10),
        Image.asset(
          onBoardingModel.image,
          height: 0.43.height,
        ),
        Text(
          onBoardingModel.title,
          style: AppTextStyles.styleBold20(context)
              .copyWith(color: AppColors.primaryColor),
        ),
        Expanded(
          child: Text(
            onBoardingModel.desc,
            style: AppTextStyles.styleMedium16(context)
                .copyWith(color: AppColors.black),
          ),
        )
      ],
    );
  }
}
