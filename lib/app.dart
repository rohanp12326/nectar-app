import 'package:demo_app_2/core/bindings/initial_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/core/routing/app_pages.dart';
import 'package:demo_app_2/core/theme/app_theme.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo App 2',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
      initialBinding: InitialBindings(),
    );
  }
}
