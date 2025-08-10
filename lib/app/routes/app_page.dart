import 'package:e_commerce_app/app/routes/route_name.dart';
import 'package:e_commerce_app/features/auth/pages/login_page.dart';
import 'package:e_commerce_app/features/auth/pages/splash_page.dart';
import 'package:e_commerce_app/features/home/pages/home_page.dart';
import 'package:e_commerce_app/features/home/pages/product_detail_page.dart';
import 'package:get/get.dart';

import '../../features/auth/controllers/auth_controller.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashPage()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.productDetail, page: () => ProductDetailPage()),
  ];
}
