import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomNavBarItem extends StatelessWidget {
  final int selectedIndex;
  final int navBarItem;
  final String iconPath;
  const CustomNavBarItem({
    super.key,
    required this.selectedIndex,
    required this.navBarItem,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: selectedIndex == navBarItem
                ? AppColors.white.withValues(alpha: 0.2)
                : Colors.transparent),
        child: Image.asset(iconPath));
  }
}
