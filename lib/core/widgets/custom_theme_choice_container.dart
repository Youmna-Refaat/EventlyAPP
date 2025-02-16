import 'package:evently_app/extenstions/get_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../modules/layouts/settings_provider.dart';
import '../theme/app_colors.dart';

class ThemeChoiceContainer extends StatefulWidget {
  const ThemeChoiceContainer({
    super.key,
  });

  @override
  State<ThemeChoiceContainer> createState() => _ThemeChoiceContainerState();
}

class _ThemeChoiceContainerState extends State<ThemeChoiceContainer> {
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
                provider.setCurrentTheme(ThemeMode.light);
              });
            },
            child: const Icon(
              Icons.light_mode_rounded,
              color: AppColors.primaryColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                provider.setCurrentTheme(ThemeMode.dark);
              });
            },
            child: const Icon(
              Icons.dark_mode_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
