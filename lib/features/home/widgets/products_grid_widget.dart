import 'package:e_commerce_app/features/home/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductCard(onTap: () {});
      },
    );
  }
}
