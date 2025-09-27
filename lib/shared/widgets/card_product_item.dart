import 'package:flutter/material.dart';
import 'package:demo_app_2/core/constants/app_colors.dart';
import 'package:demo_app_2/core/constants/app_dimensions.dart';
import 'package:demo_app_2/shared/widgets/round_icon_button.dart';

class CardProductItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double price;
  final VoidCallback onAddToCart;
  final bool enabled;
  final EdgeInsetsGeometry? margin;

  const CardProductItem({super.key, required this.image, required this.title, required this.subtitle, required this.price, required this.onAddToCart, this.enabled = true, this.margin});

  @override
  Widget build(BuildContext context) {
    final w = AppDimensions.productCardWidth(context);
    final h = AppDimensions.productCardHeight(context);
    final radius = AppDimensions.radiusMd(context);

    return Container(
      width: w,
      height: h,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(color: AppColors.cardShadow, blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimensions.spacingSm(context)),
          Expanded(
            child: Center(
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingSm(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppDimensions.fontMd(context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: AppDimensions.spacingXs(context) * 0.6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: AppDimensions.fontSm(context),
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: AppDimensions.spacingSm(context)),
                Row(
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: AppDimensions.fontLg(context),
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    RoundIconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onTap: onAddToCart,
                      enabled: enabled,
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.spacingSm(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
