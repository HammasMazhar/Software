import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/screens/authentication/signin.dart';
import 'package:software/screens/dashboard.dart';
import 'package:software/screens/invoice.dart';
import 'package:software/services/hive_service.dart';

// import 'package:software/distributor/schedule.dart';
// import 'package:software/invoice.dart';
// import 'package:software/distributor/alldistributor.dart';
// import 'package:software/purchaserecord/currentpurchase.dart';
// import 'package:software/purchaserecord/addpurchase.dart';
// import 'package:software/reports.dart';
// import 'package:software/salerecord/currentsale.dart';
// import 'package:software/salerecord/viewsale.dart';
// import 'package:software/screens/bussines_details.dart';
// import 'package:software/stocks/availablestocks.dart';
// import 'package:software/stocks/expiredstocks.dart';
// import 'package:software/stocks/requiredstocks.dart';

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
      home: SignIn(),
    );
  }
}
