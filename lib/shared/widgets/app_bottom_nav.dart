import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/core/constants/app_colors.dart';
import 'package:demo_app_2/core/constants/app_dimensions.dart';
import 'package:demo_app_2/core/constants/app_images.dart';
import 'package:demo_app_2/core/constants/app_strings.dart';
import 'package:demo_app_2/core/utils/context_extensions.dart';
import 'package:demo_app_2/modules/home/controllers/home_controller.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    final itemPadding = EdgeInsets.symmetric(vertical: AppDimensions.spacingXs(context));
    return Obx(
      () => Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Color(0x172A2A2A), offset: Offset(0, -6), blurRadius: 12),
        ]),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingLg(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Item(
                  selected: c.tabIndex.value == 0,
                  label: AppStrings.home,
                  icon: AppImages.bottomHome,
                  onTap: () => c.setTab(0),
                  selectedColor: AppColors.accentGreen,
                ),
                _Item(
                  selected: c.tabIndex.value == 1,
                  label: AppStrings.explore,
                  icon: AppImages.bottomSearch,
                  onTap: () => c.setTab(1),
                  selectedColor: AppColors.textPrimary,
                ),
                _Item(
                  selected: c.tabIndex.value == 2,
                  label: AppStrings.cart,
                  icon: AppImages.cart,
                  onTap: () => c.setTab(2),
                  selectedColor: AppColors.textPrimary,
                ),
                _Item(
                  selected: c.tabIndex.value == 3,
                  label: AppStrings.favourite,
                  icon: AppImages.fav,
                  onTap: () => c.setTab(3),
                  selectedColor: AppColors.textPrimary,
                ),
                _Item(
                  selected: c.tabIndex.value == 4,
                  label: AppStrings.account,
                  icon: AppImages.bottomProfile,
                  onTap: () => c.setTab(4),
                  selectedColor: AppColors.textPrimary,
                ),
              ]
                  .map((w) => Padding(padding: itemPadding, child: w))
                  .toList(growable: false),
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool selected;
  final String label;
  final String icon;
  final VoidCallback onTap;
  final Color selectedColor;

  const _Item({
    required this.selected,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = context.widthUnit * 6.5;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: selected ? AppColors.accentGreen : Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(context.widthUnit * 2.0),
              child: Image.asset(
                icon,
                width: iconSize,
                height: iconSize,
                fit: BoxFit.contain,
                color: selected ? Colors.white : null,
              ),
            ),
          ),
        ),
        SizedBox(height: context.heightUnit * 0.8),
        Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.w600,
            fontSize: AppDimensions.fontSm(context),
            color: selected ? AppColors.accentGreen : AppColors.navInactive,
          ),
        ),
      ],
    );
  }
}
