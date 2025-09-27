import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/core/constants/app_dimensions.dart';
import 'package:demo_app_2/core/constants/app_images.dart';
import 'package:demo_app_2/modules/home/controllers/home_controller.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;
  const SearchBar({super.key, required this.placeholder, required this.onChanged, this.onClear});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    return SizedBox(
      height: AppDimensions.searchBarHeight(context),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: c.searchController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: placeholder,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingXs(context)),
                  child: Image.asset(AppImages.search, fit: BoxFit.contain),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: AppDimensions.spacingXl(context),
                  minHeight: AppDimensions.spacingXl(context),
                ),
                suffixIcon: Obx(
                  () => c.searchQuery.value.isEmpty
                      ? const SizedBox.shrink()
                      : Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              c.searchController.clear();
                              c.onSearchChanged('');
                              onClear?.call();
                            },
                            child: const Icon(Icons.close, color: Colors.black54),
                          ),
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
