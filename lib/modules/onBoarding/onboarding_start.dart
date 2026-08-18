import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_images.dart';
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

const String onBoardingStartImage = AppImages.imagesOnBoardingExperience;

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
            Image.asset(onBoardingStartImage)
                .setVerticalPadding(context, value: 0.03.height),
            Text(
              context.l10n.onboardingPersonalizeTitle,
              style: AppTextStyles.styleBold20(context)
                  .copyWith(color: AppColors.primaryColor),
            ),
            Text(
              context.l10n.onboardingPersonalizeDesc,
              style: AppTextStyles.styleMedium16(context)
                  .copyWith(color: AppColors.black),
            ).setVerticalPadding(
              context,
              value: 0.03.height,
            ),
            Row(
              children: [
                Text(
                  context.l10n.language,
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
                  context.l10n.theme,
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
                text: context.l10n.letsStart,
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
