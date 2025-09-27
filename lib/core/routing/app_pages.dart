import 'package:get/get.dart';
import 'package:demo_app_2/modules/home/views/combined_screens.dart';

class Routes {
  Routes._();
  static const String combined = '/';
}

class AppPages {
  AppPages._();

  static const String initial = Routes.combined;

  static final pages = <GetPage>[
    GetPage(name: Routes.combined, page: () => const CombinedScreens()),
  ];
}
