import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
import 'package:software/screens/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('availableBox');
  await Hive.openBox('viewsalesBox');
  await Hive.openBox('currentsalesBox');

  await Hive.openBox('purchaseBox');
  await Hive.openBox('distributorBox');
  //await Hive.openBox('settingsBox');
  await Hive.openBox('expiredBox');
  await Hive.openBox('requiredBox');
  await Hive.openBox('nonpaidBox');
  await Hive.openBox('scheduleBox');
  await Hive.openBox('invoiceBox');
  await Hive.openBox('discountsBox');
  await Hive.openBox('medicineInvoiceBox');
  await Hive.openBox('invoiceBox');
  await Hive.openBox('reportBox');
  await Hive.openBox('tasksToDoBox');
  await Hive.openBox('passwordBox');
  var passwordBox = Hive.box('passwordBox');
  if (!passwordBox.containsKey('password')) {
    passwordBox.put('password', '122003');
  }

  runApp(const PharmacySoftware());
}

class PharmacySoftware extends StatelessWidget {
  const PharmacySoftware({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      // initialRoute: '/dashboard',
      // routes: {
      //   '/dashboard': (context) => const Dashboard(),
      //   '/schedule': (context) => const SchedulePage(),
      //   '/alldistributor': (context) => const Alldistributor(),
      //   '/availablestocks': (context) => const Availablestocks(),
      //   '/expiredstocks': (context) => const Expiredstocks(),
      //   // '/requiredstocks': (context) => const Requiredstocks(),
      //   // '/invoice': (context) => InvoiceScreen(),
      //   // '/viewsale': (context) => const Viewsale(),
      //   // '/currentsale': (context) => const Currentsale(),
      //   // '/currentpurchase': (context) => const Currentpurchase(),
      //   // '/addpurchase': (context) => const PurchaseScreen(),
      //   // '/bussinessdetails': (context) => const BussinesDetails(),
      //   // '/reports': (context) => const Reports(),
      // },
    );
  }
}
