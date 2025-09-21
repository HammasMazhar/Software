import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/screens/authentication/signin.dart';
import 'package:software/screens/dashboard.dart';
import 'package:software/screens/invoice.dart';
import 'package:software/services/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  final sessionBox = Hive.box('sessionBox');
  final isSignedIn = sessionBox.get('isSignedIn', defaultValue: false);

  runApp(
    PharmacySoftware(isSignedIn: isSignedIn),
  );
}

class PharmacySoftware extends StatelessWidget {
  const PharmacySoftware({super.key, required isSignedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
