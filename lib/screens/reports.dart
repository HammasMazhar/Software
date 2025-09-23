import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:software/screens/global_widgets/excel.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  late Box currentPurchaseBox;
  late Box currentsalesBox;

  List<Map<String, dynamic>> weeklyTotals = [];

  @override
  void initState() {
    super.initState();
    currentPurchaseBox = Hive.box('currentPurchaseBox');
    currentsalesBox = Hive.box('currentsalesBox');
    _calculateWeeklyReports();
  }

  DateTime _startOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  DateTime _endOfWeek(DateTime date) {
    return date.add(Duration(days: 7 - date.weekday));
  }

  void _calculateWeeklyReports() {
    final allDates = <DateTime>{};

    for (var key in currentPurchaseBox.keys) {
      if (key.toString().length >= 10) {
        allDates.add(DateTime.parse(key.toString()));
      }
    }

    for (var key in currentsalesBox.keys) {
      if (key.toString().length >= 10) {
        allDates.add(DateTime.parse(key.toString()));
      }
    }

    final Map<String, Map<String, double>> weeks = {};

    for (var date in allDates) {
      final start = _startOfWeek(date);
      final end = _endOfWeek(date);
      final weekKey =
          "${DateFormat('dd-MMM').format(start)} to ${DateFormat('dd-MMM').format(end)}";

      double weekPurchase = 0.0;
      double weekSales = 0.0;

      for (int i = 0; i < 7; i++) {
        final key =
            DateFormat('yyyy-MM-dd').format(start.add(Duration(days: i)));
        final dayPurchases = currentPurchaseBox.get(key, defaultValue: []);
        if (dayPurchases is List) {
          for (var item in dayPurchases) {
            if (item is Map && item.containsKey('amount')) {
              weekPurchase += (item['amount'] as num).toDouble();
            }
          }
        } else if (dayPurchases is double || dayPurchases is int) {
          weekPurchase += (dayPurchases as num).toDouble();
        }

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
        actions: [
          IconButton(
            tooltip: "Export to Excel",
            onPressed: () {
              ExcelHelper.exportRowsToExcel(
                context: context,
                sheetName: "Reports",
                fileName: "Reports",
                headers: [
                  "week",
                  "purchase",
                  "sales",
                  "profit",
                  "loss",
                ],
                rows: weeklyTotals.map((week) {
                  final profit =
                      double.tryParse(week['profit'].toString()) ?? 0;

                  return [
                    week['week'].toString(),
                    week['purchase'].toString(),
                    week['sales'].toString(),
                    profit >= 0 ? profit.toString() : "",
                    profit < 0 ? profit.abs().toString() : "",
                  ];
                }).toList(),
              );
            },
            icon: const Icon(Icons.file_upload),
          ),
          IconButton(
            tooltip: "Import from Excel",
            onPressed: () async {
              final imported = await ExcelHelper.importRowsFromExcel(
                context: context,
                headers: [
                  "week",
                  "purchase",
                  "sales",
                  "profit",
                  "loss",
                ],
              );
              setState(() {
                weeklyTotals = imported;
              });
            },
            icon: const Icon(Icons.file_download),
          ),
        ],
        // backgroundColor: const Color(0xFF008000),
      ),
      //   backgroundColor: const Color(0xFF008000),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: weeklyTotals.length,
        itemBuilder: (context, index) {
          final week = weeklyTotals[index];
          return _weekCard(
            week['week'],
            double.tryParse(week['purchase'].toString()) ?? 0,
            double.tryParse(week['sales'].toString()) ?? 0,
            double.tryParse(week['profit'].toString()) ?? 0,
            week['isProfit'] == true || week['profit'] >= 0,
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
          // gradient: LinearGradient(
          //   colors: [Colors.white, isProfit ? Colors.green : Colors.red],
          //   stops: const [0.5, 0.5],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: SizedBox(
          height: 125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(weekRange,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
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
              Divider(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
