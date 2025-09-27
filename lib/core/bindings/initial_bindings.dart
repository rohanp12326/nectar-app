import 'package:get/get.dart';
import 'package:demo_app_2/modules/home/bindings/home_binding.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
  }
}
