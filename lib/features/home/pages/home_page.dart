import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../widgets/products_grid_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: CustomAppBar(onLogoutPressed: () {}, title: 'Home', leading: Icon(Icons.menu)),
      body: Column(children: [Expanded(child: ProductsGridWidget())]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
