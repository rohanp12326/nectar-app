import 'package:flutter/material.dart';
import 'package:demo_app_2/core/utils/context_extensions.dart';

class AppDimensions {
  AppDimensions._();

  static double spacingXs(BuildContext context) => context.widthUnit * 1.5;
  static double spacingSm(BuildContext context) => context.widthUnit * 2.5;
  static double spacingMd(BuildContext context) => context.widthUnit * 4;
  static double spacingLg(BuildContext context) => context.widthUnit * 6;
  static double spacingXl(BuildContext context) => context.widthUnit * 8;

  static double radiusSm(BuildContext context) => context.widthUnit * 2.5;
  static double radiusMd(BuildContext context) => context.widthUnit * 3.5;
  static double radiusLg(BuildContext context) => context.widthUnit * 4.5;

  static double fontXs(BuildContext context) => context.heightUnit * 1.4;
  static double fontSm(BuildContext context) => context.heightUnit * 1.6;
  static double fontMd(BuildContext context) => context.heightUnit * 1.8;
  static double fontLg(BuildContext context) => context.heightUnit * 2.0;
  static double fontXl(BuildContext context) => context.heightUnit * 2.4;

  static double bannerHeight(BuildContext context) =>
      ContextExtensionss(context).isPortrait ? context.screenHeight * 0.16 : context.screenHeight * 0.32;

  static double productCardWidth(BuildContext context) =>
      context.screenWidth * (ContextExtensionss(context).isPortrait ? 0.42 : 0.28);

  static double productCardHeight(BuildContext context) =>
      ContextExtensionss(context).isPortrait ? context.screenHeight * 0.24 : context.screenHeight * 0.42;

  static double categoryTileHeight(BuildContext context) =>
      ContextExtensionss(context).isPortrait ? context.screenHeight * 0.08 : context.screenHeight * 0.14;

  static double searchBarHeight(BuildContext context) =>
      ContextExtensionss(context).isPortrait ? context.screenHeight * 0.055 : context.screenHeight * 0.1;
}
