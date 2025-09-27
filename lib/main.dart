import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/app.dart';
import 'package:demo_app_2/core/bindings/initial_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppRoot());
}
