import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/reuseable_widget/dynamic_form.dart';
import 'package:software/reuseable_widget/excel.dart';

class NonRetailStockPrices extends StatefulWidget {
  const NonRetailStockPrices({super.key});

  @override
  State<NonRetailStockPrices> createState() => _NonRetailStockPrices();
}

class _NonRetailStockPrices extends State<NonRetailStockPrices> {
  late Box nonretailstockBox;

  final List<String> fieldNames = [
    "Name",
    "Net Price",
    "Retail Price",
  ];

  @override
  void initState() {
    super.initState();
    nonretailstockBox = Hive.box('nonretailstockBox');
  }

  void _addSale() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Non Retail Stock Price"),
          content: DynamicForm(
            fieldNames: fieldNames,
            onSubmit: (values) {
              nonretailstockBox.add({
                "Name": values["Name"] ?? "",
                "Net Price": int.tryParse(values["Net Price"] ?? "0") ?? 0,
                "Retail Price":
                    double.tryParse(values["Retail Price"] ?? "0") ?? 0.0,
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void _editSale(int key, Map sale) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Non Retail Stock Stock"),
          content: DynamicForm(
            fieldNames: fieldNames,
            initialValues: {
              "Name": sale["Name"] ?? "",
              "Net Price": sale[" Net Price"].toString(),
              "Retail Price": sale["Retail Price"].toString(),
            },
            onSubmit: (values) {
              nonretailstockBox.put(key, {
                "Name": values["Name"] ?? "",
                "Net Price": double.tryParse(values["Net Price"] ?? "0") ?? 0.0,
                "Retail Price":
                    double.tryParse(values["Retail Price"] ?? "0") ?? 0.0,
              });
              // Navigator.pop(context); // close edit dialog
            },
          ),
        );
      },
    );
  }

  void _deleteSale(int key) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete this  stock?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              nonretailstockBox.delete(key);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Non Retail Stocks"),
          backgroundColor: Colors.green,
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: "Export to Excel",
              onPressed: () {
                ExcelHelper.exportToExcel(
                  context: context,
                  boxes: [nonretailstockBox],
                  sheetName: "  Non Retail Stocks ",
                  fileName: "Non Retail Stocks",
                  headers: ["Name", "Net Price", "Retail Price"],
                );
              },
              icon: const Icon(Icons.file_upload),
            ),
            IconButton(
              tooltip: "Import from Excel",
              onPressed: () {
                ExcelHelper.importFromExcel(
                  context: context,
                  boxes: [nonretailstockBox],
                  headers: ["Name", "Net Price", "Retail Price"],
                );
              },
              icon: const Icon(Icons.file_download),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addSale,
              child: const Text("+Non Retail Stocks"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: nonretailstockBox.listenable(),
                builder: (context, Box box, _) {
                  if (box.isEmpty) {
                    return const Center(child: Text("No Non Retail Stocks"));
                  }

                  final keys = box.keys.toList();

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Net Price")),
                          DataColumn(label: Text("Retail Price")),
                          DataColumn(label: Text("Actions")),
                        ],
                        rows: keys.map((key) {
                          final sale = box.get(key) as Map;
                          return DataRow(
                            cells: [
                              DataCell(Text(sale["Name"]?.toString() ?? "")),
                              DataCell(Text(sale["Net Price"] != null
                                  ? double.parse(sale["Net Price"].toString())
                                      .toStringAsFixed(2)
                                  : "")),
                              DataCell(Text(sale["Retail Price"] != null
                                  ? double.parse(
                                          sale["Retail Price"].toString())
                                      .toStringAsFixed(2)
                                  : "")),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () => _editSale(key, sale),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () => _deleteSale(key),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
