import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_images.dart';
import '../../core/models/onboarding_model.dart';
import '../../core/routes/screens_route_names.dart';
import '../../core/theme/app_colors.dart';
import '../../main.dart';
import 'onboarding_page.dart';

class OnboardingLayout extends StatefulWidget {
  const OnboardingLayout({super.key});

  @override
  _OnboardingLayoutState createState() => _OnboardingLayoutState();
}

class _OnboardingLayoutState extends State<OnboardingLayout> {
  final PageController pageController = PageController();
  int currentPage = 0;

  List<Widget> _buildOnBoardingPages(BuildContext context) {
    return [
      OnboardingPage(
        onBoardingModel: OnBoardingModel(
          image: AppImages.imagesOnBoardingInspire,
          title: context.l10n.onboardingInspireTitle,
          desc: context.l10n.onboardingInspireDesc,
        ),
      ),
      OnboardingPage(
        onBoardingModel: OnBoardingModel(
          image: AppImages.imagesOnBoardingPlanning,
          title: context.l10n.onboardingPlanningTitle,
          desc: context.l10n.onboardingPlanningDesc,
        ),
      ),
      OnboardingPage(
        onBoardingModel: OnBoardingModel(
          image: AppImages.imagesOnBoardingShare,
          title: context.l10n.onboardingShareTitle,
          desc: context.l10n.onboardingShareDesc,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final onBoardingPages = _buildOnBoardingPages(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 0.9.height,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: onBoardingPages.length,
                itemBuilder: (context, index) {
                  return onBoardingPages[index];
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage >= 0)
                  ElevatedButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: const CircleBorder(
                        side: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    child: Image.asset(
                      AppIcons.iconsBackArrow,
                      height: 20,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: currentPage,
                      count: onBoardingPages.length,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.black,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ],
                ),
                if (currentPage < onBoardingPages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: const CircleBorder(
                          side: BorderSide(color: AppColors.primaryColor),
                        )),
                    child: Image.asset(
                      AppIcons.iconsArrow,
                      height: 20,
                    ),
                  ),
                if (currentPage == onBoardingPages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentContext!.removeAllAndPushNamed(
                          routeName: ScreensRouteNames.layoutRoute);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: const CircleBorder(
                          side: BorderSide(color: AppColors.primaryColor),
                        )),
                    child: Image.asset(
                      AppIcons.iconsArrow,
                      height: 20,
                    ),
                  ),
              ],
            ).setOnlyPadding(context, bottom: 20),
            10.setVerticalSpace(),
          ]).setHorizontalPadding(context, value: 20),
        ),
      ),
    );
  }
}
