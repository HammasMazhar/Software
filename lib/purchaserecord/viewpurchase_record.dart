import 'package:flutter/material.dart';

class ViewpurchaseRecord extends StatefulWidget {
  const ViewpurchaseRecord({super.key});

  @override
  State<ViewpurchaseRecord> createState() => _ViewpurchaseRecordState();
}

class _ViewpurchaseRecordState extends State<ViewpurchaseRecord> {
  static const String routeName = '/viewpurchase_record';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008000),
      appBar: AppBar(title: const Text('View Purchase Record')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'View Purchase Record',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
