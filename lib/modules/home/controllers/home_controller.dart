import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/core/constants/app_images.dart';
import 'package:demo_app_2/core/constants/app_strings.dart';
import 'package:demo_app_2/modules/home/models/category.dart';
import 'package:demo_app_2/modules/home/models/product.dart';
import 'package:demo_app_2/modules/home/models/promo_banner.dart';

class HomeController extends GetxController {
  final tabIndex = 0.obs;

  final searchQuery = ''.obs;
  final selectedCategoryId = RxnString();
  final bannerIndex = 0.obs;

  final cartCount = 0.obs;

  final searchController = TextEditingController();

  List<PromoBanner> get banners => const [
        PromoBanner(
          id: 'b1',
          title: AppStrings.freshVegetables,
          subtitle: AppStrings.getUpTo40,
          image: AppImages.featured1,
        ),
        PromoBanner(
          id: 'b2',
          title: AppStrings.freshVegetables,
          subtitle: AppStrings.getUpTo40,
          image: AppImages.featured2,
        ),
      ];

  List<Category> get categories => const [
        Category(
          id: 'pulses',
          title: AppStrings.pulses,
          image: AppImages.peanuts,
          color: 0xFFF8A44C,
        ),
        Category(
          id: 'rice',
          title: AppStrings.rice,
          image: AppImages.tortilla,
          color: 0xFF53B175,
        ),
      ];

  List<Product> get products => const [
        Product(
          id: 'p1',
          name: 'Organic Bananas',
          image: AppImages.avacado,
          price: 4.99,
          unitText: AppStrings.priceUnit7pcs,
          categoryId: 'pulses',
        ),
        Product(
          id: 'p2',
          name: 'Red Apple',
          image: AppImages.onion,
          price: 4.99,
          unitText: AppStrings.priceUnitKg,
          categoryId: 'rice',
        ),
        Product(
          id: 'p3',
          name: 'Bell Pepper Red',
          image: AppImages.cabbage,
          price: 4.99,
          unitText: AppStrings.priceUnitKg,
          categoryId: 'pulses',
        ),
        Product(
          id: 'p4',
          name: 'Ginger',
          image: AppImages.tortilla,
          price: 4.99,
          unitText: AppStrings.priceUnit250g,
          categoryId: 'rice',
        ),
        Product(
          id: 'p5',
          name: 'Organic Bananas',
          image: AppImages.avacado,
          price: 4.99,
          unitText: AppStrings.priceUnitKg,
          categoryId: 'pulses',
        ),
        Product(
          id: 'p6',
          name: 'Beef Bone',
          image: AppImages.featured1,
          price: 4.99,
          unitText: AppStrings.priceUnitKg,
          categoryId: 'pulses',
        ),
        Product(
          id: 'p7',
          name: 'Broiler Chicken',
          image: AppImages.featured2,
          price: 4.99,
          unitText: AppStrings.priceUnitKg,
          categoryId: 'rice',
        ),
      ];

  List<Product> get exclusiveOffers => products.take(3).toList(growable: false);
  List<Product> get bestSelling => products.reversed.take(3).toList(growable: false);

  List<Product> get meatAndPoultry => products.where((p) => p.name == 'Beef Bone' || p.name == 'Broiler Chicken').toList(growable: false);

  List<Product> get filteredProducts {
    final query = searchQuery.value.trim().toLowerCase();
    final cat = selectedCategoryId.value;
    return products.where((p) {
      final matchesQuery = query.isEmpty || p.name.toLowerCase().contains(query);
      final matchesCat = cat == null || p.categoryId == cat;
      return matchesQuery && matchesCat;
    }).toList(growable: false);
  }

  String get searchPlaceholder => AppStrings.searchPlaceholder;

  void onSearchChanged(String value) {
    searchQuery(value);
  }

  void selectCategory(String? id) {
    if (selectedCategoryId.value == id) {
      selectedCategoryId.value = null;
    } else {
      selectedCategoryId.value = id;
    }
  }

  void addToCart(Product p) {
    cartCount.value++;
  }

  void setTab(int index) {
    tabIndex.value = index;
  }

  void onSeeAllExclusive() {}
  void onSeeAllBestSelling() {}

  void setBannerIndex(int index) {
    bannerIndex.value = index;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
