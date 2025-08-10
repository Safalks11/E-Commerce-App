import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/route_name.dart';
import '../../../core/services/api_service.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController(text: "mor_2314");
  final TextEditingController passwordController = TextEditingController(text: "83r5^_");
  final RxBool isPasswordHidden = true.obs;
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await ApiService.login(usernameController.text, passwordController.text);

      if (response.error != null) {
        errorMessage.value = response.error!;
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      errorMessage.value = 'An error occurred during login';
    } finally {
      isLoading.value = false;
    }
  }
}
