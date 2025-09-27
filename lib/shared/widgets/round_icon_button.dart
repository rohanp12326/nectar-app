import 'package:flutter/material.dart';
import 'package:demo_app_2/core/constants/app_colors.dart';
import 'package:demo_app_2/core/constants/app_dimensions.dart';

class RoundIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final bool enabled;
  final Color backgroundColor;
  const RoundIconButton({super.key, required this.icon, required this.onTap, this.enabled = true, this.backgroundColor = AppColors.accentGreen});

  @override
  Widget build(BuildContext context) {
    final size = AppDimensions.spacingXl(context);
    return Material(
      color: enabled ? backgroundColor : backgroundColor.withOpacity(0.4),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: icon),
        ),
      ),
    );
  }
}
