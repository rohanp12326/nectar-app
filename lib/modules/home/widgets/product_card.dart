import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app_2/modules/home/controllers/home_controller.dart';
import 'package:demo_app_2/modules/home/models/product.dart';
import 'package:demo_app_2/shared/widgets/card_product_item.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();
    return CardProductItem(
      image: product.image,
      title: product.name,
      subtitle: product.unitText,
      price: product.price,
      onAddToCart: () => c.addToCart(product),
    );
  }
}
