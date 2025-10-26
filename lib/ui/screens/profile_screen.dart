import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implementación mínima: datos ficticios locales (edítalos si tenías perfiles reales)
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 44, child: Icon(Icons.person, size: 44)),
            const SizedBox(height: 12),
            const Text('Usuario Demo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('usuario@ejemplo.com'),
            const SizedBox(height: 18),
            ElevatedButton(onPressed: () {
              // ejemplo: volver al catálogo
              Navigator.pop(context);
            }, child: const Text('Volver')),
          ],
        ),
      ),
    );
  }
}
