import 'package:flutter/material.dart';

import 'package:software/distributor/schedule.dart';
import 'package:software/invoice.dart';
import 'package:software/distributor/alldistributor.dart';
import 'package:software/purchaserecord/currentpurchase.dart';
import 'package:software/purchaserecord/viewpurchase_record.dart';
import 'package:software/salerecord/currentsale.dart';
import 'package:software/salerecord/viewsale.dart';
import 'package:software/screens/bussines_details.dart';
import 'package:software/stocks/availablestocks.dart';
import 'package:software/stocks/expiredstocks.dart';
import 'package:software/stocks/requiredstocks.dart';
import 'package:software/dashboard.dart';

void main() {
  runApp(const PharmacySoftware());
}

class PharmacySoftware extends StatelessWidget {
  const PharmacySoftware({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard',

      routes: {
        '/dashboard': (context) => const Dashboard(),
        '/schedule': (context) => const Schedule(),
        '/alldistributor': (context) => const Alldistributor(),

        '/availablestocks': (context) => const Availablestocks(),
        '/expiredstocks': (context) => const Expiredstocks(),
        '/requiredstocks': (context) => const Requiredstocks(),

        '/invoice': (context) => InvoiceScreen(),
        '/viewsale': (context) => const Viewsale(),
        '/currentsale': (context) => const Currentsale(),

        '/viewpurchaserecord': (context) => const ViewpurchaseRecord(),
        '/addpurchase': (context) => const Currentpurchase(),
        '/bussinessdetails': (context) => const BussinesDetails(),
      },
    );
  }
}
