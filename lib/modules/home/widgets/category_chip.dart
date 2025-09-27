import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/core/constants/app_dimensions.dart';
import 'package:demo_app_2/core/utils/context_extensions.dart';
import 'package:demo_app_2/modules/home/models/category.dart';
import 'package:demo_app_2/modules/home/controllers/home_controller.dart';

class CategoryChip extends StatelessWidget {
  final Category category;
  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    final height = AppDimensions.categoryTileHeight(context);
    final width = context.screenWidth * 0.6;

    return Material(
      color: Color(category.color),
      borderRadius: BorderRadius.circular(AppDimensions.radiusMd(context)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => c.selectCategory(category.id),
        child: SizedBox(
          height: height,
          width: width,
          child: Row(
            children: [
              SizedBox(width: AppDimensions.spacingMd(context)),
              Image.asset(category.image, height: height * 0.7, fit: BoxFit.contain),
              SizedBox(width: AppDimensions.spacingMd(context)),
              Text(
                category.title,
                style: TextStyle(
                  fontSize: AppDimensions.fontLg(context),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3D413F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
