import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/core/constants/app_colors.dart';
import 'package:demo_app_2/core/constants/app_dimensions.dart';
import 'package:demo_app_2/modules/home/controllers/home_controller.dart';

class PromoBannerCarousel extends StatelessWidget {
  const PromoBannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    final controller = PageController(viewportFraction: 0.9);
    final height = AppDimensions.bannerHeight(context);

    return SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scrollbar(
            child: PageView.builder(
              controller: controller,
              onPageChanged: c.setBannerIndex,
              itemCount: c.banners.length,
              padEnds: false,
              itemBuilder: (ctx, i) {
                final b = c.banners[i];
                return Padding(
                  padding: EdgeInsets.only(
                    right: i == c.banners.length - 1 ? 0 : AppDimensions.spacingSm(context),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMd(context)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(color: AppColors.bannerRed),
                        Positioned.fill(
                          child: Image.asset(b.image, fit: BoxFit.cover),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.53),
                            border: Border.all(color: const Color(0xFFF2F3F2)),
                            borderRadius: BorderRadius.circular(AppDimensions.radiusMd(context)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                b.title,
                                style: TextStyle(
                                  fontSize: AppDimensions.fontXl(context),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: AppDimensions.spacingXs(context)),
                              Text(
                                b.subtitle,
                                style: TextStyle(
                                  fontSize: AppDimensions.fontMd(context),
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.accentGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: AppDimensions.spacingSm(context),
            child: Obx(
              () => Row(
                children: List.generate(
                  c.banners.length,
                  (index) {
                    final active = c.bannerIndex.value == index;
                    return Container(
                      width: active ? AppDimensions.spacingLg(context) : AppDimensions.spacingSm(context),
                      height: AppDimensions.spacingXs(context) * 0.7,
                      margin: EdgeInsets.symmetric(horizontal: AppDimensions.spacingXs(context) * 0.6),
                      decoration: BoxDecoration(
                        color: active ? AppColors.accentGreen : Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
