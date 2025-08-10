import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/logout_confirmation_sheet.dart';
import '../../auth/controllers/auth_controller.dart';
import '../controllers/product_controller.dart';
import '../widgets/products_grid_widget.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();
  final AuthController authController = Get.find<AuthController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLogoutPressed: () => _showLogoutConfirmation(),
        title: 'Home',
        leading: Icon(Icons.menu),
      ),
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

  void _showLogoutConfirmation() {
    Get.bottomSheet(
      LogoutConfirmationSheet(
        onConfirm: () {
          Get.back();
          authController.logout();
        },
      ),
      isScrollControlled: false,
    );
  }
}
