// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import '../reuseable_widget/dynamic_form.dart';

// class Currentsale extends StatefulWidget {
//   const Currentsale({super.key});

//   @override
//   State<Currentsale> createState() => _DailySaleReportState();
// }

// class _DailySaleReportState extends State<Currentsale> {
//   final Box currentsaleBox = Hive.box('currentsaleBox');

//   Map<String, double> dailyTotals = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailySales();
//   }

//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 8) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   void _loadDailySales() {
//     Map<String, double> totals = {};

//     for (var key in currentsaleBox.keys) {
//       final data = currentsaleBox.get(key, defaultValue: []);
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

//   void addSale(double amount, {bool isSubtract = false}) {
//     final now = DateTime.now();
//     final todayKey = _businessDateKey(now);

//     final data = currentsaleBox.get(todayKey, defaultValue: []);
//     List sales = (data is List) ? data : [];

//     sales.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     currentsaleBox.put(todayKey, sales);

//     _loadDailySales();
//   }

//   void _showSaleDialog({bool isSubtract = false}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.zero,
//         ),
//         title: Text(isSubtract ? "Subtract Sale" : "Add Sale"),
//         content: DynamicForm(
//           fieldNames: ["Amount"],
//           onSubmit: (values) {
//             final amount = double.tryParse(values["Amount"] ?? "0") ?? 0.0;
//             if (amount > 0) {
//               addSale(amount, isSubtract: isSubtract);
//             }
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailyTotals.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Daily Sale Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       // backgroundColor: const Color(0xFF008000),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);

//           return _saleCard(
//             "$dayName ($formattedDate)",
//             dailyTotals[key] ?? 0.0,
//           );
//         },
//       ),

//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "addSale",
//             onPressed: () => _showSaleDialog(isSubtract: false),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtractSale",
//             backgroundColor: Colors.red,
//             onPressed: () => _showSaleDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _saleCard(String title, double amount) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     child: Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         gradient: const LinearGradient(
//           colors: [Colors.white, Colors.green],
//           stops: [0.5, 0.5],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             "Rs. ${amount.toStringAsFixed(2)}",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: amount >= 0 ? Colors.black : Colors.red,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import '../reuseable_widget/dynamic_form.dart';

// class Currentsale extends StatefulWidget {
//   const Currentsale({super.key});

//   @override
//   State<Currentsale> createState() => _DailySaleReportState();
// }

// class _DailySaleReportState extends State<Currentsale> {
//   final Box currentsaleBox = Hive.box('currentsaleBox');

//   Map<String, List<Map<String, dynamic>>> dailySales = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailySales();
//   }

//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 8) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   void _loadDailySales() {
//     Map<String, List<Map<String, dynamic>>> salesMap = {};

//     for (var key in currentsaleBox.keys) {
//       final data = currentsaleBox.get(key, defaultValue: []);
//       if (data is List) {
//         final dateSales = <Map<String, dynamic>>[];
//         for (var item in data) {
//           if (item is Map &&
//               item.containsKey('amount') &&
//               item.containsKey('time')) {
//             dateSales.add(Map<String, dynamic>.from(item));
//           }
//         }
//         if (dateSales.isNotEmpty) {
//           salesMap[key.toString()] = dateSales;
//         }
//       }
//     }

//     setState(() {
//       dailySales = salesMap;
//     });
//   }

//   void addSale(double amount, {bool isSubtract = false}) {
//     final now = DateTime.now();
//     final todayKey = _businessDateKey(now);

//     final data = currentsaleBox.get(todayKey, defaultValue: []);
//     List sales = (data is List) ? data : [];

//     sales.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     currentsaleBox.put(todayKey, sales);
//     _loadDailySales();
//   }

//   void editSale(String dateKey, int index, double newAmount) {
//     final data = currentsaleBox.get(dateKey, defaultValue: []);
//     if (data is List && index < data.length) {
//       data[index]['amount'] = newAmount;
//       data[index]['time'] = DateTime.now().toIso8601String();
//       currentsaleBox.put(dateKey, data);
//       _loadDailySales();
//     }
//   }

//   void deleteSale(String dateKey, int index) {
//     final data = currentsaleBox.get(dateKey, defaultValue: []);
//     if (data is List && index < data.length) {
//       data.removeAt(index);
//       currentsaleBox.put(dateKey, data);
//       _loadDailySales();
//     }
//   }

//   void _showSaleDialog({bool isSubtract = false, String? dateKey, int? index}) {
//     double initialValue = 0.0;
//     if (dateKey != null && index != null) {
//       initialValue = (dailySales[dateKey]![index]['amount'] as num).toDouble();
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         title: Text(isSubtract
//             ? "Subtract Sale"
//             : (dateKey != null ? "Edit Sale" : "Add Sale")),
//         content: DynamicForm(
//           fieldNames: ["Amount"],
//           initialValues: {"Amount": initialValue.toString()},
//           onSubmit: (values) {
//             final amount = double.tryParse(values["Amount"] ?? "0") ?? 0.0;
//             if (amount > 0) {
//               if (dateKey != null && index != null) {
//                 editSale(dateKey, index, amount);
//               } else {
//                 addSale(amount, isSubtract: isSubtract);
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailySales.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Daily Sale Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);
//           final salesList = dailySales[key]!;

//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("$dayName ($formattedDate)",
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 5),
//                 ...List.generate(salesList.length, (i) {
//                   final sale = salesList[i];
//                   final amount = (sale['amount'] as num).toDouble();

//                   return Card(
//                     child: ListTile(
//                       title: Text("Rs. ${amount.toStringAsFixed(2)}"),
//                       subtitle: Text(
//                           "Time: ${DateFormat('hh:mm a').format(DateTime.parse(sale['time']))}"),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () =>
//                                 _showSaleDialog(dateKey: key, index: i),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => deleteSale(key, i),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "addSale",
//             onPressed: () => _showSaleDialog(),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtractSale",
//             backgroundColor: Colors.red,
//             onPressed: () => _showSaleDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import '../reuseable_widget/dynamic_form.dart';

// class Currentsale extends StatefulWidget {
//   const Currentsale({super.key});

//   @override
//   State<Currentsale> createState() => _DailySaleReportState();
// }

// class _DailySaleReportState extends State<Currentsale> {
//   final Box currentsaleBox = Hive.box('currentsaleBox');

//   Map<String, List<Map<String, dynamic>>> dailySales = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailySales();
//   }

//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 8) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   void _loadDailySales() {
//     Map<String, List<Map<String, dynamic>>> salesMap = {};

//     for (var key in currentsaleBox.keys) {
//       final data = currentsaleBox.get(key, defaultValue: []);
//       if (data is List) {
//         final dateSales = <Map<String, dynamic>>[];
//         for (var item in data) {
//           if (item is Map &&
//               item.containsKey('amount') &&
//               item.containsKey('time')) {
//             dateSales.add(Map<String, dynamic>.from(item));
//           }
//         }
//         if (dateSales.isNotEmpty) {
//           salesMap[key.toString()] = dateSales;
//         }
//       }
//     }

//     setState(() {
//       dailySales = salesMap;
//     });
//   }

//   void addSale(double amount, {bool isSubtract = false}) {
//     final now = DateTime.now();
//     final todayKey = _businessDateKey(now);

//     final data = currentsaleBox.get(todayKey, defaultValue: []);
//     List sales = (data is List) ? data : [];

//     sales.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     currentsaleBox.put(todayKey, sales);
//     _loadDailySales();
//   }

//   void editSale(String dateKey, int index, double newAmount) {
//     final data = currentsaleBox.get(dateKey, defaultValue: []);
//     if (data is List && index < data.length) {
//       data[index]['amount'] = newAmount;
//       data[index]['time'] = DateTime.now().toIso8601String();
//       currentsaleBox.put(dateKey, data);
//       _loadDailySales();
//     }
//   }

//   void deleteSale(String dateKey, int index) {
//     final data = currentsaleBox.get(dateKey, defaultValue: []);
//     if (data is List && index < data.length) {
//       data.removeAt(index);
//       currentsaleBox.put(dateKey, data);
//       _loadDailySales();
//     }
//   }

//   void _showSaleDialog({bool isSubtract = false, String? dateKey, int? index}) {
//     double initialValue = 0.0;
//     if (dateKey != null && index != null) {
//       initialValue = (dailySales[dateKey]![index]['amount'] as num).toDouble();
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         title: Text(isSubtract
//             ? "Subtract Sale"
//             : (dateKey != null ? "Edit Sale" : "Add Sale")),
//         content: DynamicForm(
//           fieldNames: ["Amount"],
//           initialValues: {"Amount": initialValue.toString()},
//           validator: {
//             "Amount": (value) {
//               if (value == null || value.isEmpty) {
//                 return "Amount is required";
//               }
//               final val = double.tryParse(value);
//               if (val == null || val <= 0) {
//                 return "Enter a valid number greater than 0";
//               }
//               return null;
//             }
//           },
//           onSubmit: (values) {
//             final amount = double.tryParse(values["Amount"] ?? "0") ?? 0.0;
//             if (amount > 0) {
//               if (dateKey != null && index != null) {
//                 editSale(dateKey, index, amount);
//               } else {
//                 addSale(amount, isSubtract: isSubtract);
//               }
//             }
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailySales.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Daily Sale Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);
//           final salesList = dailySales[key]!;

//           double totalAmount = salesList.fold(0.0,
//               (previousValue, element) => previousValue + (element['amount'] as num).toDouble());

//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("$dayName ($formattedDate)",
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 5),
//                 Text(
//                   "Total: Rs. ${totalAmount.toStringAsFixed(2)}",
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),
//                 ...List.generate(salesList.length, (i) {
//                   final sale = salesList[i];
//                   final amount = (sale['amount'] as num).toDouble();

//                   return Card(
//                     child: ListTile(
//                       title: Text("Rs. ${amount.toStringAsFixed(2)}"),
//                       subtitle: Text(
//                           "Time: ${DateFormat('hh:mm a').format(DateTime.parse(sale['time']))}"),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () =>
//                                 _showSaleDialog(dateKey: key, index: i),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => deleteSale(key, i),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "addSale",
//             onPressed: () => _showSaleDialog(),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtractSale",
//             backgroundColor: Colors.red,
//             onPressed: () => _showSaleDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Currentsale extends StatefulWidget {
  const Currentsale({super.key});

  @override
  State<Currentsale> createState() => _DailySaleReportState();
}

class _DailySaleReportState extends State<Currentsale> {
  final Box currentsalesBox = Hive.box('currentsalesBox');

  Map<String, double> dailyTotals = {};

  @override
  void initState() {
    super.initState();
    _loadDailySales();
  }

  String _businessDateKey(DateTime dt) {
    if (dt.hour < 8) {
      dt = dt.subtract(const Duration(days: 1));
    }
    return DateFormat('yyyy-MM-dd').format(dt);
  }

  void _loadDailySales() {
    Map<String, double> totals = {};

    for (var key in currentsalesBox.keys) {
      final data = currentsalesBox.get(key, defaultValue: []);
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

  void addSale(double amount, {bool isSubtract = false, String? dateKey}) {
    final now = DateTime.now();
    final todayKey = dateKey ?? _businessDateKey(now);

    final data = currentsalesBox.get(todayKey, defaultValue: []);
    List sales = (data is List) ? data : [];

    sales.add({
      'amount': isSubtract ? -amount : amount,
      'time': now.toIso8601String(),
    });

    currentsalesBox.put(todayKey, sales);
    _loadDailySales();
  }

  void _editSale(String dateKey, int index, double oldAmount) {
    final TextEditingController amountController =
        TextEditingController(text: oldAmount.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Sale"),
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
                  final data = currentsalesBox.get(dateKey, defaultValue: []);
                  if (data is List && index < data.length) {
                    data[index]['amount'] = newAmount;
                    currentsalesBox.put(dateKey, data);
                    _loadDailySales();
                  }
                }
                Navigator.pop(context);
              },
              child: const Text("Save")),
        ],
      ),
    );
  }

  void _deleteSale(String dateKey, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Sale"),
        content: const Text("Are you sure you want to delete this sale?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              final data = currentsalesBox.get(dateKey, defaultValue: []);
              if (data is List && index < data.length) {
                data.removeAt(index);
                currentsalesBox.put(dateKey, data);
                _loadDailySales();
              }
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _showSaleDialog({bool isSubtract = false}) {
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isSubtract ? "Subtract Sale" : "Add Sale"),
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
                addSale(amount, isSubtract: isSubtract);
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
      ..sort((a, b) => b.compareTo(a)); // first agai

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Sale Report',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF008000),
      ),
      body: ListView.builder(
        itemCount: sortedKeys.length,
        itemBuilder: (context, index) {
          final key = sortedKeys[index];
          final date = DateTime.parse(key);
          final dayName = DateFormat('EEEE').format(date);
          final formattedDate = DateFormat('dd-MMM-yyyy').format(date);

          final salesOfDay =
              (currentsalesBox.get(key, defaultValue: []) as List)
                  .asMap()
                  .entries
                  .where((entry) => entry.value is Map)
                  .toList();

          return _saleCard(
            "$dayName ($formattedDate)",
            dailyTotals[key] ?? 0.0,
            key,
            salesOfDay,
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () => _showSaleDialog(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "subtract",
            backgroundColor: Colors.red,
            onPressed: () => _showSaleDialog(isSubtract: true),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  Widget _saleCard(String title, double amount, String dateKey,
      List<MapEntry<int, dynamic>> salesOfDay) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Colors.white, Colors.green],
            stops: [0.0, 0.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...salesOfDay.map((entry) {
              final index = entry.key;
              final sale = entry.value as Map;
              final saleAmount = (sale['amount'] as num).toDouble();

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rs. ${saleAmount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: saleAmount >= 0 ? Colors.black : Colors.red,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editSale(dateKey, index, saleAmount),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteSale(dateKey, index),
                      ),
                    ],
                  ),
                ],
              );
            }).toList(),
            const SizedBox(height: 10),
            Text(
              "Total: Rs. ${amount.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
