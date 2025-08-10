import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../widgets/product_error_widget.dart';
import '../widgets/products_shimmer_effect.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.grey.shade400),
            highlightColor: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isDetailsLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final product = controller.selectedProduct.value;

        if (product == null) {
          return const Center(child: Text('No product selected'));
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                height: 320,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => buildProductImageShimmer(height: 320),
                  errorWidget: (context, url, error) => productErrorWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.green.shade100),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.label_rounded, size: 15, color: Colors.green),
                              const SizedBox(width: 4),
                              Text(
                                product.category,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.orange.shade800,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (i) {
                            double rate = product.rating.rate;
                            return Icon(
                              i < rate.round() ? Icons.star_rounded : Icons.star_border_rounded,
                              size: 16,
                              color: Colors.amber.shade700,
                            );
                          }),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${product.rating.rate}',
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          ' (${product.rating.count} reviews)',
                          style: const TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Divider(color: Colors.grey.shade200, thickness: 1, height: 32),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 16, color: Colors.black54, height: 1.6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              Get.snackbar(
                'Success',
                'Product added to cart!',
                backgroundColor: Colors.green.shade100,
                colorText: Colors.green.shade800,
                snackPosition: SnackPosition.BOTTOM,
                borderRadius: 12,
                margin: const EdgeInsets.all(16),
              );
            },

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart_rounded, size: 22, color: Colors.white),
                const SizedBox(width: 10),
                const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
