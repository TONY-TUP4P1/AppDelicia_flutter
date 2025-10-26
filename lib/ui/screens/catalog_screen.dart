import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/local_data.dart';
import '../../models/product.dart';
import '../../providers/cart_model.dart';
import '../widgets/product_tile.dart';
import '../../routes.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cart.totalItems > 0)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(radius: 8, backgroundColor: Colors.red, child: Text('${cart.totalItems}', style: const TextStyle(fontSize: 10, color: Colors.white))),
                  )
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.cart);
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, Routes.profile),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, i) {
          final Product p = productsList[i];
          return ProductTile(product: p);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ejemplo: navegar a cart
          Navigator.pushNamed(context, Routes.cart);
        },
        child: const Icon(Icons.shopping_bag),
      ),
    );
  }
}
