import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_images.dart';
import '../../core/models/onboarding_model.dart';
import '../../core/routes/screens_route_names.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/custom_language_choice_container.dart';
import '../../core/widgets/custom_theme_choice_container.dart';
import '../../core/widgets/custom_elevated_button.dart';

class OnboardingStart extends StatefulWidget {
  const OnboardingStart({super.key});

  @override
  State<OnboardingStart> createState() => _OnboardingStartState();
}

OnBoardingModel onBoardingModel = OnBoardingModel(
  image: AppImages.imagesOnBoardingExperience,
  title: 'Personalize Your Experience',
  desc:
      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
);

class _OnboardingStartState extends State<OnboardingStart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Image.asset(
              AppImages.imagesOnBoardingAppBar,
              height: 50,
            ).setOnlyPadding(context, top: 5),
            Image.asset(onBoardingModel.image)
                .setVerticalPadding(context, value: 0.03.height),
            Text(
              onBoardingModel.title,
              style: AppTextStyles.styleBold20(context)
                  .copyWith(color: AppColors.primaryColor),
            ),
            Text(
              onBoardingModel.desc,
              style: AppTextStyles.styleMedium16(context)
                  .copyWith(color: AppColors.black),
            ).setVerticalPadding(
              context,
              value: 0.03.height,
            ),
            Row(
              children: [
                Text(
                  "Language",
                  style: AppTextStyles.styleMedium20(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
                const Spacer(),
                const LanguageChoiceContainer(),
              ],
            ),
            Row(
              children: [
                Text(
                  "Theme",
                  style: AppTextStyles.styleMedium20(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
                const Spacer(),
                const ThemeChoiceContainer(),
              ],
            ).setVerticalPadding(context, value: 10),
            SizedBox(
              height: 0.07.height,
              child: CustomElevatedButton(
                text: "Lets Start",
                onPressed: () {
                  context.goToNamedReplace(
                      routeName: ScreensRouteNames.onBoardingRoute);
                },
              ),
            ),
            10.setVerticalSpace(),
          ]).setSymmetricPadding(
            context,
            horizontal: 20,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
