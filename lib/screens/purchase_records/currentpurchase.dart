// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import 'package:software/reuseable_widget/excel.dart';

// class Currentpurchase extends StatefulWidget {
//   const Currentpurchase({super.key});

//   @override
//   State<Currentpurchase> createState() => _DailyPurchaseReportState();
// }

// class _DailyPurchaseReportState extends State<Currentpurchase> {
//   final Box purchaseBox = Hive.box('purchaseBox');

//   Map<String, double> dailyTotals = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailyPurchases();
//   }

//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 13) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   void _loadDailyPurchases() {
//     Map<String, double> totals = {};

//     for (var key in purchaseBox.keys) {
//       final data = purchaseBox.get(key, defaultValue: []);
//       if (data is List) {
//         for (var item in data) {
//           if (item is Map &&
//               item.containsKey('amount') &&
//               item.containsKey('time')) {
//             final amount = (item['amount'] as num).toDouble();
//             final time = DateTime.parse(item['time']);
//             final bKey = _businessDateKey(time);

//             totals[bKey] = (totals[bKey] ?? 0) + amount;
//           }
//         }
//       }
//     }

//     setState(() {
//       dailyTotals = totals;
//     });
//   }

//   void addPurchase(double amount, {bool isSubtract = false, String? dateKey}) {
//     final now = DateTime.now();
//     final todayKey = dateKey ?? _businessDateKey(now);

//     final data = purchaseBox.get(todayKey, defaultValue: []);
//     List purchases = (data is List) ? data : [];

//     purchases.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     purchaseBox.put(todayKey, purchases);

//     _loadDailyPurchases();
//   }

//   void _editPurchase(String dateKey, int index, double oldAmount) {
//     final TextEditingController amountController =
//         TextEditingController(text: oldAmount.toString());

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Edit Purchase"),
//         content: TextField(
//           controller: amountController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(labelText: "Enter new amount"),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//               onPressed: () {
//                 final newAmount = double.tryParse(amountController.text) ?? 0.0;
//                 if (newAmount != oldAmount && newAmount > 0) {
//                   final data = purchaseBox.get(dateKey, defaultValue: []);
//                   if (data is List && index < data.length) {
//                     data[index]['amount'] = newAmount;
//                     purchaseBox.put(dateKey, data);
//                     _loadDailyPurchases();
//                   }
//                 }
//                 Navigator.pop(context);
//               },
//               child: const Text("Save")),
//         ],
//       ),
//     );
//   }

//   void _deletePurchase(String dateKey, int index) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Delete Purchase"),
//         content: const Text("Are you sure you want to delete this purchase?"),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final data = purchaseBox.get(dateKey, defaultValue: []);
//               if (data is List && index < data.length) {
//                 data.removeAt(index);
//                 purchaseBox.put(dateKey, data);
//                 _loadDailyPurchases();
//               }
//               Navigator.pop(context);
//             },
//             child: const Text("Delete"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showPurchaseDialog({bool isSubtract = false}) {
//     final TextEditingController amountController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(isSubtract ? "Subtract Purchase" : "Add Purchase"),
//         content: TextField(
//           controller: amountController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(labelText: "Enter amount"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final amount = double.tryParse(amountController.text) ?? 0.0;
//               if (amount > 0) {
//                 addPurchase(amount, isSubtract: isSubtract);
//               }
//               Navigator.pop(context);
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailyTotals.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//           title: const Text(
//             'Daily Purchase Report',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           centerTitle: true,
//           backgroundColor: Color(0xFF008000),
//           actions: [
//             IconButton(
//               tooltip: "Export to Excel",
//               onPressed: () {
//                 ExcelHelper.exportToExcel(
//                   context: context,
//                   boxes: [purchaseBox],
//                   sheetName: " Current Purchase",
//                   fileName: " Current Purchase",
//                   headers: [
//                     "company",
//                     "date",
//                     "day",
//                     "amount",
//                   ],
//                 );
//               },
//               icon: const Icon(Icons.file_upload),
//             ),
//             IconButton(
//               tooltip: "Import from Excel",
//               onPressed: () {
//                 ExcelHelper.importFromExcel(
//                   context: context,
//                   boxes: [purchaseBox],
//                   headers: [
//                     "company",
//                     "date",
//                     "day",
//                     "amount",
//                   ],
//                 );
//               },
//               icon: const Icon(Icons.file_download),
//             ),
//           ]),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);

//           final purchasesOfDay =
//               (purchaseBox.get(key, defaultValue: []) as List)
//                   .asMap()
//                   .entries
//                   .where((entry) => entry.value is Map)
//                   .toList();

//           return _purchaseCard(
//             "$dayName ($formattedDate)",
//             dailyTotals[key] ?? 0.0,
//             key,
//             purchasesOfDay,
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "add",
//             onPressed: () => _showPurchaseDialog(isSubtract: false),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtract",
//             backgroundColor: Colors.red,
//             onPressed: () => _showPurchaseDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _purchaseCard(
//     String title,
//     double amount,
//     String dateKey,
//     List<MapEntry<int, dynamic>> purchasesOfDay,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.green,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             ...purchasesOfDay.map((entry) {
//               final index = entry.key;
//               final purchase = entry.value;

//               final purchaseAmount =
//                   (purchase is Map && purchase.containsKey('amount'))
//                       ? (purchase['amount'] as num).toDouble()
//                       : 0.0;

//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Rs. ${purchaseAmount.toStringAsFixed(2)}",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: purchaseAmount >= 0 ? Colors.black : Colors.red,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.edit, color: Colors.blue),
//                         onPressed: () =>
//                             _editPurchase(dateKey, index, purchaseAmount),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () => _deletePurchase(dateKey, index),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             }),
//             const SizedBox(height: 10),
//             Text(
//               "Total: Rs. ${amount.toStringAsFixed(2)}",
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:software/screens/global_widgets/excel.dart';

class Currentpurchase extends StatefulWidget {
  const Currentpurchase({super.key});

  @override
  State<Currentpurchase> createState() => _DailyPurchaseReportState();
}

class _DailyPurchaseReportState extends State<Currentpurchase> {
  final Box currentpurchaseBox = Hive.box('currentpurchaseBox');

  Map<String, double> dailyTotals = {};

  @override
  void initState() {
    super.initState();
    _loadDailyPurchases();
  }

  String _businessDateKey(DateTime dt) {
    if (dt.hour < 13) {
      dt = dt.subtract(const Duration(days: 1));
    }
    return DateFormat('yyyy-MM-dd').format(dt);
  }

  void _loadDailyPurchases() {
    Map<String, double> totals = {};

    for (var key in currentpurchaseBox.keys) {
      final data = currentpurchaseBox.get(key, defaultValue: []);
      if (data is List) {
        for (var item in data) {
          if (item is Map &&
              item.containsKey('amount') &&
              item.containsKey('time')) {
            final amount = (item['amount'] as num).toDouble();
            final time = DateTime.parse(item['time']);
            final bKey = _businessDateKey(time);

            totals[bKey] = (totals[bKey] ?? 0) + amount;
          }
        }
      }
    }

    setState(() {
      dailyTotals = totals;
    });
  }

  void addPurchase(double amount, {bool isSubtract = false, String? dateKey}) {
    final now = DateTime.now();
    final todayKey = dateKey ?? _businessDateKey(now);

    final data = currentpurchaseBox.get(todayKey, defaultValue: []);
    List purchases = (data is List) ? data : [];

    purchases.add({
      'amount': isSubtract ? -amount : amount,
      'time': now.toIso8601String(),
    });

    currentpurchaseBox.put(todayKey, purchases);

    _loadDailyPurchases();
  }

  void _editPurchase(String dateKey, int index, double oldAmount) {
    final TextEditingController amountController =
        TextEditingController(text: oldAmount.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Purchase"),
        content: TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Enter new amount"),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          ElevatedButton(
              onPressed: () {
                final newAmount = double.tryParse(amountController.text) ?? 0.0;
                if (newAmount != oldAmount && newAmount > 0) {
                  final data =
                      currentpurchaseBox.get(dateKey, defaultValue: []);
                  if (data is List && index < data.length) {
                    data[index]['amount'] = newAmount;
                    currentpurchaseBox.put(dateKey, data);
                    _loadDailyPurchases();
                  }
                }
                Navigator.pop(context);
              },
              child: const Text("Save")),
        ],
      ),
    );
  }

  void _deletePurchase(String dateKey, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Purchase"),
        content: const Text("Are you sure you want to delete this purchase?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              final data = currentpurchaseBox.get(dateKey, defaultValue: []);
              if (data is List && index < data.length) {
                data.removeAt(index);
                currentpurchaseBox.put(dateKey, data);
                _loadDailyPurchases();
              }
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _showPurchaseDialog({bool isSubtract = false}) {
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isSubtract ? "Subtract Purchase" : "Add Purchase"),
        content: TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Enter amount"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text) ?? 0.0;
              if (amount > 0) {
                addPurchase(amount, isSubtract: isSubtract);
              }
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sortedKeys = dailyTotals.keys.toList()
      ..sort((a, b) => b.compareTo(a)); // latest first

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Purchase Report',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF008000),
        actions: [
          IconButton(
            tooltip: "Export to Excel",
            onPressed: () {
              // Collect rows from Hive box
              List<List<String>> rows = [];
              for (var key in currentpurchaseBox.keys) {
                final value = currentpurchaseBox.get(key);
                if (value is List) {
                  for (var item in value) {
                    if (item is Map) {
                      rows.add([
                        key.toString(),
                        item['amount'].toString(),
                        item['time'].toString(),
                      ]);
                    }
                  }
                }
              }

              ExcelHelper.exportRowsToExcel(
                context: context,
                sheetName: "Current Purchase",
                fileName: "current_purchase",
                headers: ["Date", "Amount", "Time"],
                rows: rows,
              );
            },
            icon: const Icon(Icons.file_upload),
          ),
          IconButton(
            tooltip: "Import from Excel",
            onPressed: () async {
              final imported = await ExcelHelper.importRowsFromExcel(
                context: context,
                headers: ["Date", "Amount", "Time"],
              );

              for (var row in imported) {
                final dateKey = row["Date"] ?? "";
                final amount = double.tryParse(row["Amount"] ?? "0") ?? 0.0;
                final time = row["Time"] ?? DateTime.now().toIso8601String();

                if (dateKey.isNotEmpty) {
                  final existing =
                      currentpurchaseBox.get(dateKey, defaultValue: []);
                  List purchases = (existing is List) ? existing : [];
                  purchases.add({
                    "amount": amount,
                    "time": time,
                  });
                  currentpurchaseBox.put(dateKey, purchases);
                }
              }

              _loadDailyPurchases();
            },
            icon: const Icon(Icons.file_download),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sortedKeys.length,
        itemBuilder: (context, index) {
          final key = sortedKeys[index];
          final date = DateTime.parse(key);
          final dayName = DateFormat('EEEE').format(date);
          final formattedDate = DateFormat('dd-MMM-yyyy').format(date);

          final purchasesOfDay =
              (currentpurchaseBox.get(key, defaultValue: []) as List)
                  .asMap()
                  .entries
                  .where((entry) => entry.value is Map)
                  .toList();

          return _purchaseCard(
            "$dayName ($formattedDate)",
            dailyTotals[key] ?? 0.0,
            key,
            purchasesOfDay,
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () => _showPurchaseDialog(isSubtract: false),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "subtract",
            backgroundColor: Colors.red,
            onPressed: () => _showPurchaseDialog(isSubtract: true),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  Widget _purchaseCard(
    String title,
    double amount,
    String dateKey,
    List<MapEntry<int, dynamic>> purchasesOfDay,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...purchasesOfDay.map((entry) {
              final index = entry.key;
              final purchase = entry.value;

              final purchaseAmount =
                  (purchase is Map && purchase.containsKey('amount'))
                      ? (purchase['amount'] as num).toDouble()
                      : 0.0;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rs. ${purchaseAmount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: purchaseAmount >= 0 ? Colors.black : Colors.red,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () =>
                            _editPurchase(dateKey, index, purchaseAmount),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deletePurchase(dateKey, index),
                      ),
                    ],
                  ),
                ],
              );
            }),
            const SizedBox(height: 10),
            Text(
              "Total: Rs. ${amount.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
