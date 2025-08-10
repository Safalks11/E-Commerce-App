import 'package:e_commerce_app/features/home/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/route_name.dart';
import '../controllers/product_controller.dart';

class ProductsGridWidget extends StatelessWidget {
  final ProductController controller;

  const ProductsGridWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];

          return ProductCard(
            product: product,
            onTap: () {
              Get.toNamed(AppRoutes.productDetail);
            },
          );
        },
      ),
    );
  }
}
