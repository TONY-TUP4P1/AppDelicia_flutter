import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: cart.items.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) {
                final item = cart.items[i];
                return ListTile(
                  leading: SizedBox(width: 56, height: 56, child: Image.asset(item.product.image, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.fastfood))),
                  title: Text(item.product.name),
                  subtitle: Text('S/ ${item.product.price.toStringAsFixed(2)} x ${item.quantity}'),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(onPressed: () => context.read<CartModel>().removeProduct(item.product.id), icon: const Icon(Icons.remove)),
                    IconButton(onPressed: () => context.read<CartModel>().addProduct(item.product), icon: const Icon(Icons.add)),
                    IconButton(onPressed: () => context.read<CartModel>().removeCompletely(item.product.id), icon: const Icon(Icons.delete)),
                  ]),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(child: Text('Total: S/ ${cart.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            ElevatedButton(
              onPressed: cart.items.isEmpty ? null : () {
                // simula proceso de compra local (no cambia datos)
                showDialog(context: context, builder: (_) => AlertDialog(
                  title: const Text('Compra realizada'),
                  content: Text('Se realizó la compra por S/ ${cart.totalPrice.toStringAsFixed(2)}'),
                  actions: [
                    TextButton(onPressed: () {
                      context.read<CartModel>().clear();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }, child: const Text('Aceptar'))
                  ],
                ));
              },
              child: const Text('Pagar'),
            )
          ],
        ),
      ),
    );
  }
}
