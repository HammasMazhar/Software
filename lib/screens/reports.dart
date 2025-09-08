// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:intl/intl.dart';

// // class Reports extends StatefulWidget {
// //   const Reports({super.key});

// //   @override
// //   State<Reports> createState() => _ReportsState();
// // }

// // class _ReportsState extends State<Reports> {
// //   late Box purchaseBox;
// //   late Box salesBox;

// //   double totalPurchases = 0.0;
// //   double totalSales = 0.0;

// //   String selectedMonth = DateFormat('yyyy-MM').format(DateTime.now());

// //   @override
// //   void initState() {
// //     super.initState();
// //     purchaseBox = Hive.box('purchaseBox');
// //     salesBox = Hive.box('viewsalesBox');
// //     _calculateReports();
// //   }

// //   void _calculateReports() {
// //     double purchaseSum = 0.0;
// //     double salesSum = 0.0;

// //     purchaseSum =
// //         purchaseBox.get('${selectedMonth}-purchase', defaultValue: 0.0);
// //     salesSum = salesBox.get('${selectedMonth}-sale', defaultValue: 0.0);

// //     setState(() {
// //       totalPurchases = purchaseSum;
// //       totalSales = salesSum;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final profitOrLoss = totalSales - totalPurchases;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'Monthly Reports',
// //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //         // backgroundColor: Color(0xFF008000),
// //       ),
// //       backgroundColor: const Color(0xFF008000),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             DropdownButton<String>(
// //               value: selectedMonth,
// //               items: _getAvailableMonths()
// //                   .map((month) => DropdownMenuItem(
// //                         value: month,
// //                         child: Text(month),
// //                       ))
// //                   .toList(),
// //               onChanged: (value) {
// //                 if (value != null) {
// //                   setState(() {
// //                     selectedMonth = value;
// //                   });
// //                   _calculateReports();
// //                 }
// //               },
// //             ),
// //             const SizedBox(height: 30),
// //             _reportCard("Total Purchases", totalPurchases),
// //             const SizedBox(height: 20),
// //             _reportCard("Total Sales", totalSales),
// //             const SizedBox(height: 20),
// //             _reportCard(
// //               profitOrLoss >= 0 ? "Profit" : "Loss",
// //               profitOrLoss.abs(),
// //               isProfit: profitOrLoss >= 0,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   List<String> _getAvailableMonths() {
// //     final purchaseMonths = purchaseBox.keys
// //         .where((k) => k.toString().length >= 7)
// //         .map((k) => k.toString().substring(0, 7))
// //         .toSet()
// //         .toList();

// //     final salesMonths = salesBox.keys
// //         .where((k) => k.toString().length >= 7)
// //         .map((k) => k.toString().substring(0, 7))
// //         .toSet()
// //         .toList();

// //     final allMonths = {...purchaseMonths, ...salesMonths}.toList();
// //     allMonths.sort();
// //     return allMonths;
// //   }

// //   Widget _reportCard(String title, double amount, {bool isProfit = true}) {
// //     return Container(
// //       width: double.infinity,
// //       height: 150,
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(10),
// //         gradient: LinearGradient(
// //           colors: [Colors.white, isProfit ? Colors.green : Colors.red],
// //           stops: const [0.5, 0.5],
// //           begin: Alignment.topCenter,
// //           end: Alignment.bottomCenter,
// //         ),
// //       ),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Text(
// //             title,
// //             style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //           ),
// //           const SizedBox(height: 20),
// //           Text(
// //             "Rs. ${amount.toStringAsFixed(2)}",
// //             style: TextStyle(
// //               fontSize: 28,
// //               fontWeight: FontWeight.bold,
// //               color: isProfit ? Colors.green[800] : Colors.red[800],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';

// class Reports extends StatefulWidget {
//   const Reports({super.key});

//   @override
//   State<Reports> createState() => _ReportsState();
// }

// class _ReportsState extends State<Reports> {
//   late Box purchaseBox;
//   late Box salesBox;

//   double totalPurchases = 0.0;
//   double totalSales = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     purchaseBox = Hive.box('purchaseBox');
//     salesBox = Hive.box('viewsalesBox');
//     _calculateReports();
//   }

//   // 🔹 Calculate totals for the last 5 days
//   void _calculateReports() {
//     double purchaseSum = 0.0;
//     double salesSum = 0.0;

//     final today = DateTime.now();
//     final last5Days =
//         List.generate(5, (i) => today.subtract(Duration(days: i)));

//     for (var day in last5Days) {
//       final key = DateFormat('yyyy-MM-dd').format(day);

//       // Sum purchases
//       final dayPurchases = purchaseBox.get(key, defaultValue: 0.0);
//       if (dayPurchases is double || dayPurchases is int) {
//         purchaseSum += dayPurchases.toDouble();
//       } else if (dayPurchases is List) {
//         for (var item in dayPurchases) {
//           if (item is Map && item.containsKey('amount')) {
//             purchaseSum += (item['amount'] as num).toDouble();
//           }
//         }
//       }

//       // Sum sales
//       final daySales = salesBox.get(key, defaultValue: 0.0);
//       if (daySales is double || daySales is int) {
//         salesSum += daySales.toDouble();
//       } else if (daySales is List) {
//         for (var item in daySales) {
//           if (item is Map && item.containsKey('amount')) {
//             salesSum += (item['amount'] as num).toDouble();
//           }
//         }
//       }
//     }

//     setState(() {
//       totalPurchases = purchaseSum;
//       totalSales = salesSum;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final profitOrLoss = totalSales - totalPurchases;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Last 5 Days Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//       ),
//       backgroundColor: const Color(0xFF008000),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _reportCard("Total Purchases", totalPurchases),
//             const SizedBox(height: 20),
//             _reportCard("Total Sales", totalSales),
//             const SizedBox(height: 20),
//             _reportCard(
//               profitOrLoss >= 0 ? "Profit" : "Loss",
//               profitOrLoss.abs(),
//               isProfit: profitOrLoss >= 0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🔹 Report card design (kept original)
//   Widget _reportCard(String title, double amount, {bool isProfit = true}) {
//     return Container(
//       width: double.infinity,
//       height: 150,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         gradient: LinearGradient(
//           colors: [Colors.white, isProfit ? Colors.green : Colors.red],
//           stops: const [0.5, 0.5],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 20),
//           Text(
//             "Rs. ${amount.toStringAsFixed(2)}",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: isProfit ? Colors.green[800] : Colors.red[800],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  late Box purchaseBox;
  late Box currentsalesBox;

  List<Map<String, dynamic>> weeklyTotals = [];

  @override
  void initState() {
    super.initState();
    purchaseBox = Hive.box('purchaseBox');
    currentsalesBox = Hive.box('currentsalesBox');
    _calculateWeeklyReports();
  }

  // 🔹 Get start of the week (Monday)
  DateTime _startOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  // 🔹 Get end of the week (Sunday)
  DateTime _endOfWeek(DateTime date) {
    return date.add(Duration(days: 7 - date.weekday));
  }

  // 🔹 Calculate weekly totals
  void _calculateWeeklyReports() {
    final allDates = <DateTime>{};

    // Collect all purchase dates
    for (var key in purchaseBox.keys) {
      if (key.toString().length >= 10) {
        allDates.add(DateTime.parse(key.toString()));
      }
    }

    // Collect all sales dates
    for (var key in currentsalesBox.keys) {
      if (key.toString().length >= 10) {
        allDates.add(DateTime.parse(key.toString()));
      }
    }

    // Group by week
    final Map<String, Map<String, double>> weeks = {};

    for (var date in allDates) {
      final start = _startOfWeek(date);
      final end = _endOfWeek(date);
      final weekKey =
          "${DateFormat('dd-MMM').format(start)} to ${DateFormat('dd-MMM').format(end)}";

      double weekPurchase = 0.0;
      double weekSales = 0.0;

      // Sum purchases for this week
      for (int i = 0; i < 7; i++) {
        final key =
            DateFormat('yyyy-MM-dd').format(start.add(Duration(days: i)));
        final dayPurchases = purchaseBox.get(key, defaultValue: []);
        if (dayPurchases is List) {
          for (var item in dayPurchases) {
            if (item is Map && item.containsKey('amount')) {
              weekPurchase += (item['amount'] as num).toDouble();
            }
          }
        } else if (dayPurchases is double || dayPurchases is int) {
          weekPurchase += (dayPurchases as num).toDouble();
        }

        // Sum sales for this week
        final daySales = currentsalesBox.get(key, defaultValue: []);
        if (daySales is List) {
          for (var item in daySales) {
            if (item is Map && item.containsKey('amount')) {
              weekSales += (item['amount'] as num).toDouble();
            }
          }
        } else if (daySales is double || daySales is int) {
          weekSales += (daySales as num).toDouble();
        }
      }

      weeks[weekKey] = {
        'purchase': weekPurchase,
        'sales': weekSales,
      };
    }

    // Convert map to list and sort latest week first
    final List<Map<String, dynamic>> weekList = weeks.entries.map((e) {
      final profit = e.value['sales']! - e.value['purchase']!;
      return {
        'week': e.key,
        'purchase': e.value['purchase'],
        'sales': e.value['sales'],
        'profit': profit,
        'isProfit': profit >= 0,
      };
    }).toList();

    weekList.sort((a, b) => b['week'].compareTo(a['week']));

    setState(() {
      weeklyTotals = weekList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Reports',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFF008000),
      ),
      backgroundColor: const Color(0xFF008000),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: weeklyTotals.length,
        itemBuilder: (context, index) {
          final week = weeklyTotals[index];
          return _weekCard(
            week['week'],
            week['purchase'],
            week['sales'],
            week['profit'],
            week['isProfit'],
          );
        },
      ),
    );
  }

  Widget _weekCard(String weekRange, double purchase, double sales,
      double profit, bool isProfit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.white, isProfit ? Colors.green : Colors.red],
            stops: const [0.5, 0.5],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weekRange,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Total Purchases: Rs. ${purchase.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16)),
            Text("Total Sales: Rs. ${sales.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(
              isProfit
                  ? "Profit: Rs. ${profit.toStringAsFixed(2)}"
                  : "Loss: Rs. ${profit.abs().toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isProfit ? Colors.green[800] : Colors.red[800]),
            ),
          ],
        ),
      ),
    );
  }
}
