import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../controllers/product_controller.dart';
import '../widgets/products_grid_widget.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: CustomAppBar(onLogoutPressed: () {}, title: 'Home', leading: Icon(Icons.menu)),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () => productController.fetchProducts(),
          child: Column(
            children: [Expanded(child: ProductsGridWidget(controller: productController))],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
