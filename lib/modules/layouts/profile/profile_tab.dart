import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/extenstions/extension.dart';
import 'package:provider/provider.dart';
import '../../../core/routes/screens_route_names.dart';
import '../../../core/services/firebase_authentication_services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../main.dart';
import '../settings_provider.dart';
import 'widgets/profile_header_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    final isDark = provider.isDark();

    final dropdownFillColor = isDark ? AppColors.black : AppColors.white;
    final dropdownTextColor = isDark ? AppColors.white : AppColors.black;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeaderSection(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              20.setVerticalSpace(),
              Text(
                context.l10n.language,
                style: AppTextStyles.styleBold20(context),
              ),
              6.setVerticalSpace(),
              CustomDropdown<String>(
                hintText: provider.currentLanguage == "en" ? "English" : "عربي",
                items: provider.languagesList,
                onChanged: (value) {
                  if (value == "English") provider.setCurrentLanguage("en");
                  if (value != "English") provider.setCurrentLanguage("ar");
                },
                decoration: CustomDropdownDecoration(
                  closedFillColor: dropdownFillColor,
                  expandedFillColor: dropdownFillColor,
                  closedBorder:
                      Border.all(color: AppColors.primaryColor, width: 1.8),
                  closedBorderRadius: BorderRadius.circular(18.0),
                  closedSuffixIcon: const Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 28,
                    color: AppColors.primaryColor,
                  ),
                  hintStyle: TextStyle(color: dropdownTextColor),
                  headerStyle: TextStyle(color: dropdownTextColor),
                  listItemStyle: TextStyle(color: dropdownTextColor),
                ),
              ),
              16.setVerticalSpace(),
              Text(
                context.l10n.theme,
                style: AppTextStyles.styleBold20(context),
              ),
              6.setVerticalSpace(),
              CustomDropdown<String>(
                hintText:
                    provider.isDark() ? context.l10n.themeDark : context.l10n.themeLight,
                items: [context.l10n.themeLight, context.l10n.themeDark],
                onChanged: (value) {
                  if (value == context.l10n.themeDark) {
                    provider.setCurrentTheme(ThemeMode.dark);
                  }
                  if (value == context.l10n.themeLight) {
                    provider.setCurrentTheme(ThemeMode.light);
                  }
                },
                decoration: CustomDropdownDecoration(
                  closedFillColor: dropdownFillColor,
                  expandedFillColor: dropdownFillColor,
                  closedBorder:
                      Border.all(color: AppColors.primaryColor, width: 1.8),
                  closedBorderRadius: BorderRadius.circular(18.0),
                  closedSuffixIcon: const Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 28,
                    color: AppColors.primaryColor,
                  ),
                  hintStyle: TextStyle(color: dropdownTextColor),
                  headerStyle: TextStyle(color: dropdownTextColor),
                  listItemStyle: TextStyle(color: dropdownTextColor),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuthServices.logout();
                  navigatorKey.currentContext!.removeAllAndPushNamed(
                      routeName: ScreensRouteNames.loginRoute);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout_outlined,
                      color: AppColors.white,
                      size: 20,
                    ),
                    10.setHorizontalSpace(),
                    Text(
                      context.l10n.logout,
                      style: AppTextStyles.styleMedium20(context).copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ).setSymmetricPadding(context, horizontal: 5, vertical: 10),
              ).setVerticalPadding(context, value: 50)
            ]).setHorizontalPadding(context, value: 20),
          ],
        ),
      ),
    );
  }
}
