import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/core/constants/app_dimensions.dart';
import 'package:demo_app_2/core/constants/app_strings.dart';
import 'package:demo_app_2/core/utils/context_extensions.dart';
import 'package:demo_app_2/modules/home/controllers/home_controller.dart';
import 'package:demo_app_2/modules/home/widgets/promo_banner_carousel.dart';
import 'package:demo_app_2/modules/home/widgets/product_card.dart';
import 'package:demo_app_2/modules/home/widgets/category_chip.dart';
import 'package:demo_app_2/shared/widgets/section_header.dart';
import 'package:demo_app_2/shared/widgets/search_bar.dart' as sb;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    final paddingH = EdgeInsets.symmetric(horizontal: AppDimensions.spacingSm(context));
    final headerGap = SizedBox(height: AppDimensions.spacingSm(context));

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.spacingSm(context),
              right: AppDimensions.spacingSm(context),
              top: AppDimensions.spacingMd(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppDimensions.spacingSm(context),
                      height: AppDimensions.spacingSm(context),
                      decoration: const BoxDecoration(
                        color: Color(0xFF53B175),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: AppDimensions.spacingSm(context)),
                    Text(
                      AppStrings.location,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.fontLg(context),
                        color: const Color(0xFF4C4E4D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.spacingSm(context)),
                sb.SearchBar(
                  placeholder: c.searchPlaceholder,
                  onChanged: c.onSearchChanged,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppDimensions.spacingSm(context))),
        const SliverToBoxAdapter(child: PromoBannerCarousel()),
        SliverToBoxAdapter(child: SizedBox(height: AppDimensions.spacingMd(context))),

        // Exclusive Offer (non-reactive list -> no Obx)
        SliverToBoxAdapter(
          child: SectionHeader(
            title: AppStrings.exclusiveOffer,
            onSeeAll: c.onSeeAllExclusive,
          ),
        ),
        SliverToBoxAdapter(child: headerGap),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppDimensions.productCardHeight(context),
            child: Scrollbar(
              child: ListView.separated(
                padding: paddingH,
                scrollDirection: Axis.horizontal,
                itemCount: c.exclusiveOffers.length,
                separatorBuilder: (_, __) => SizedBox(width: AppDimensions.spacingSm(context)),
                itemBuilder: (ctx, i) => ProductCard(product: c.exclusiveOffers[i]),
              ),
            ),
          ),
        ),

        // Groceries / Categories (non-reactive list -> no Obx)
        SliverToBoxAdapter(child: SizedBox(height: AppDimensions.spacingMd(context))),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingSm(context)),
            child: Text(
              AppStrings.groceries,
              style: TextStyle(
                fontSize: AppDimensions.fontXl(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: headerGap),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppDimensions.categoryTileHeight(context),
            child: Scrollbar(
              child: ListView.separated(
                padding: paddingH,
                scrollDirection: Axis.horizontal,
                itemCount: c.categories.length,
                separatorBuilder: (_, __) => SizedBox(width: AppDimensions.spacingSm(context)),
                itemBuilder: (ctx, i) => CategoryChip(category: c.categories[i]),
              ),
            ),
          ),
        ),

        // Meat & Poultry (non-reactive list -> no Obx)
        SliverToBoxAdapter(child: SizedBox(height: AppDimensions.spacingSm(context))),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppDimensions.productCardHeight(context),
            child: Scrollbar(
              child: ListView.separated(
                padding: paddingH,
                scrollDirection: Axis.horizontal,
                itemCount: c.meatAndPoultry.length,
                separatorBuilder: (_, __) => SizedBox(width: AppDimensions.spacingSm(context)),
                itemBuilder: (ctx, i) => ProductCard(product: c.meatAndPoultry[i]),
              ),
            ),
          ),
        ),

        // Best Selling (non-reactive list -> no Obx)
        SliverToBoxAdapter(child: SizedBox(height: AppDimensions.spacingMd(context))),
        SliverToBoxAdapter(
          child: SectionHeader(
            title: AppStrings.bestSelling,
            onSeeAll: c.onSeeAllBestSelling,
          ),
        ),
        SliverToBoxAdapter(child: headerGap),
        SliverToBoxAdapter(
          child: SizedBox(
            height: AppDimensions.productCardHeight(context),
            child: Scrollbar(
              child: ListView.separated(
                padding: paddingH,
                scrollDirection: Axis.horizontal,
                itemCount: c.bestSelling.length,
                separatorBuilder: (_, __) => SizedBox(width: AppDimensions.spacingSm(context)),
                itemBuilder: (ctx, i) => ProductCard(product: c.bestSelling[i]),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: context.heightUnit * 4)),
      ],
    );
  }
}
