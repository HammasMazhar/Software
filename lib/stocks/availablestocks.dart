import 'package:flutter/material.dart';

class Availablestocks extends StatefulWidget {
  const Availablestocks({super.key});

  @override
  State<Availablestocks> createState() => _AvailablestocksState();
}

class _AvailablestocksState extends State<Availablestocks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('available'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text('go to dash board'),
            ),
          ],
        ),
      ),
    );
  }
}
