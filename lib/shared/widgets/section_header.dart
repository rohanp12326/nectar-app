import 'package:flutter/material.dart';
import 'package:demo_app_2/core/constants/app_colors.dart';
import 'package:demo_app_2/core/constants/app_dimensions.dart';
import 'package:demo_app_2/core/constants/app_strings.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  const SectionHeader({super.key, required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    final spacing = AppDimensions.spacingSm(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppDimensions.fontXl(context),
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onSeeAll,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.spacingXs(context)),
                child: Text(
                  AppStrings.seeAll,
                  style: TextStyle(
                    fontSize: AppDimensions.fontMd(context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentGreen,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
