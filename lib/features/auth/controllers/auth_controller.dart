import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController(text: "mor_2314");
  final TextEditingController passwordController = TextEditingController(text: "83r5^_");
  final RxBool isPasswordHidden = true.obs;
  final formKey = GlobalKey<FormState>();
  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
