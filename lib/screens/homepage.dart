import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/bebe_logo.png',
          width: 50,
          height: 50,
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: const Text(
            'Bem vindo!',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
