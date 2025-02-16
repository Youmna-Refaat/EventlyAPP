import 'package:evently_app/extenstions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final String? image;
  final Color? borderColor;
  final void Function()? onTap;
  final bool isSelected;
  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    this.isSelected = false,
    this.image,
    this.onTap,
    this.borderColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.primaryColor,
          border: Border.all(
            color: borderColor!,
          ),
          borderRadius: BorderRadius.circular(46),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(
                isSelected == true ? AppColors.primaryColor : AppColors.white,
                BlendMode.srcIn,
              ),
            ).setSymmetricPadding(context, horizontal: 2, vertical: 2),
            4.setHorizontalSpace(),
            Text(
              title,
              style: AppTextStyles.styleMedium16(context).copyWith(
                color: isSelected == true
                    ? AppColors.primaryColor
                    : AppColors.white,
              ),
            ),
          ],
        ).setSymmetricPadding(context, horizontal: 10, vertical: 5),
      ).setOnlyPadding(context, right: 5),
    );
  }
}
