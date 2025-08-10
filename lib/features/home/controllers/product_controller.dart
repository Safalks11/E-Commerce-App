import 'package:get/get.dart';

import '../../../core/models/product_model.dart';
import '../../../core/services/api_service.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;
  final isLoading = false.obs;
  final isDetailsLoading = false.obs;
  final errorMessage = ''.obs;
  final selectedProduct = Rxn<Product>();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final productList = await ApiService.getProducts();
      products.value = productList;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchProductDetail(int id) async {
    isDetailsLoading.value = true;
    errorMessage.value = '';

    try {
      final product = await ApiService.getProduct(id);
      selectedProduct.value = product;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isDetailsLoading.value = false;
    }
  }

  bool get hasProducts => products.isNotEmpty;
}
