import 'package:flutter/material.dart';
import '../../routes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implementación mínima: botón para entrar (simula login local)
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.catalog);
          },
          child: const Text('Entrar (simulado)'),
        ),
      ),
    );
  }
}
