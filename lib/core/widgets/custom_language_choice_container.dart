import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../modules/layouts/settings_provider.dart';
import '../constants/app_icons.dart';
import '../theme/app_colors.dart';

class LanguageChoiceContainer extends StatefulWidget {
  const LanguageChoiceContainer({
    super.key,
  });

  @override
  State<LanguageChoiceContainer> createState() =>
      _LanguageChoiceContainerState();
}

class _LanguageChoiceContainerState extends State<LanguageChoiceContainer> {
  var provider = Provider.of<SettingsProvider>(navigatorKey.currentContext!);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.04.height,
      width: 0.18.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                provider.setCurrentLanguage('ar');
              });
            },
            child: SvgPicture.asset(
              AppIcons.iconsArabic,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                provider.setCurrentLanguage('en');
              });
            },
            child: SvgPicture.asset(
              AppIcons.iconsEnglish,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
