import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../providers/cart_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product?;
    if (product == null) {
      return const Scaffold(
        body: Center(child: Text('Producto no encontrado')),
      );
    }

    // Observamos el cart para actualizar la vista cuando cambie
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.fastfood, size: 120),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(product.description),
                  const SizedBox(height: 12),
                  Text('Precio: S/ ${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<CartModel>().addProduct(product);
                          final snack = SnackBar(content: Text('${product.name} agregado al carrito'));
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        },
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('Agregar'),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Volver'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Aquí usamos el método público para obtener la cantidad
                  Text('En carrito: ${cart.quantityOf(product.id)}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
