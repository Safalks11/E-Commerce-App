import 'package:e_commerce_app/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "E-Commerce App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    );
  }
}
