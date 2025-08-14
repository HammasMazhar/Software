import 'package:flutter/material.dart';

class PharmacySoftware extends StatelessWidget {
  const PharmacySoftware({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pharmacy Software')),
      body: Center(
        child: Text(
          'Welcome to the Pharmacy Software',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
