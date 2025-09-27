import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/core/constants/app_strings.dart';
import 'package:demo_app_2/modules/home/controllers/home_controller.dart';
import 'package:demo_app_2/modules/home/views/home_screen.dart';
import 'package:demo_app_2/shared/widgets/app_bottom_nav.dart';

class CombinedScreens extends StatelessWidget {
  const CombinedScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            switch (c.tabIndex.value) {
              case 0:
                return const HomeScreen();
              case 1:
                return const _CenteredText(text: AppStrings.explore);
              case 2:
                return const _CenteredText(text: AppStrings.cart);
              case 3:
                return const _CenteredText(text: AppStrings.favourite);
              case 4:
                return const _CenteredText(text: AppStrings.account);
              default:
                return const HomeScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}

class _CenteredText extends StatelessWidget {
  final String text;
  const _CenteredText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
