import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_model.dart';
import 'routes.dart';

void main() {
  runApp(const AppDeliciaApp());
}

class AppDeliciaApp extends StatelessWidget {
  const AppDeliciaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: MaterialApp(
        title: 'AppDelicia',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          useMaterial3: false,
        ),
        initialRoute: Routes.splash,
        routes: Routes.getRoutes(),
      ),
    );
  }
}
