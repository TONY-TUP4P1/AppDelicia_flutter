import 'dart:async';
import 'package:flutter/material.dart';
import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // simula el splash (1.2s) y va a auth -> catalog
    Timer(const Duration(milliseconds: 1200), () {
      // si en tu Android el splash va directo al catálogo, cambia la ruta a Routes.catalog
      Navigator.pushReplacementNamed(context, Routes.catalog);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // logo (si tienes un logo en assets/images/logo.png)
            Image.asset('assets/images/logo.png', width: 140, height: 140, errorBuilder: (_, __, ___) => const Icon(Icons.fastfood, size: 80, color: Colors.white)),
            const SizedBox(height: 16),
            const Text('AppDelicia', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
