import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:software/screens/global_widgets/excel.dart';

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
    if (dt.hour < 13) {
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

  /// -------------------- EXPORT --------------------
  void _exportSales() async {
    final headers = ["Date", "Amount", "Time"];
    List<List<String>> rows = [];

    for (var key in currentsalesBox.keys) {
      final data = currentsalesBox.get(key, defaultValue: []);
      if (data is List) {
        for (var item in data) {
          if (item is Map &&
              item.containsKey('amount') &&
              item.containsKey('time')) {
            final amount = (item['amount'] as num).toDouble();
            final time = DateTime.parse(item['time']);
            rows.add([
              key.toString(),
              amount.toStringAsFixed(2),
              DateFormat("yyyy-MM-dd HH:mm:ss").format(time),
            ]);
          }
        }
      }
    }

    await ExcelHelper.exportRowsToExcel(
      context: context,
      sheetName: "CurrentSales",
      fileName: "current_sales",
      headers: headers,
      rows: rows,
    );
  }

  /// -------------------- IMPORT --------------------
  void _importSales() async {
    final headers = ["Date", "Amount", "Time"];
    final importedData = await ExcelHelper.importRowsFromExcel(
        context: context, headers: headers);

    for (var row in importedData) {
      final dateKey = row["Date"] ?? "";
      final amount = double.tryParse(row["Amount"] ?? "0") ?? 0.0;
      final timeString = row["Time"] ?? "";
      final time = timeString.isNotEmpty
          ? DateTime.tryParse(timeString)
          : DateTime.now();

      if (dateKey.isNotEmpty && time != null) {
        final data = currentsalesBox.get(dateKey, defaultValue: []);
        List sales = (data is List) ? data : [];
        sales.add({
          "amount": amount,
          "time": time.toIso8601String(),
        });
        currentsalesBox.put(dateKey, sales);
      }
    }

    _loadDailySales();
  }

  @override
  Widget build(BuildContext context) {
    final sortedKeys = dailyTotals.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Sale Report',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF008000),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: "Export to Excel",
            onPressed: _exportSales,
          ),
          IconButton(
            icon: const Icon(Icons.upload),
            tooltip: "Import from Excel",
            onPressed: _importSales,
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

  Widget _saleCard(
    String title,
    double amount,
    String dateKey,
    List<MapEntry<int, dynamic>> salesOfDay,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
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
            ...salesOfDay.map((entry) {
              final index = entry.key;
              final sale = entry.value;
              final saleAmount = (sale is Map && sale.containsKey('amount'))
                  ? (sale['amount'] as num).toDouble()
                  : 0.0;

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
}
