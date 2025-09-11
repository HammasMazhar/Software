import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/reuseable_widget/dynamic_form.dart';
import 'package:software/reuseable_widget/excel.dart';

class Nonpaidstock extends StatefulWidget {
  const Nonpaidstock({super.key});

  @override
  State<Nonpaidstock> createState() => _NonpaidstockState();
}

class _NonpaidstockState extends State<Nonpaidstock> {
//  static const String routeName = '/requiredstocks';
  late Box nonpaidBox;

  final List<String> fieldNames = [
    "Name",
    "Quantity",
    "Distributor",
  ];

  @override
  void initState() {
    super.initState();
    nonpaidBox = Hive.box('nonpaidBox');
  }

  void _addStocks() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Non Paid Stock"),
          content: DynamicForm(
            fieldNames: fieldNames,
            onSubmit: (values) {
              nonpaidBox.add({
                "Name": values["Name"] ?? "",
                "Quantity": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                "Distributor": values["Distributor"] ?? "",
              });
            },
          ),
        );
      },
    );
  }

  void _editStocks(int index, Map stock) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Non Paid Stock"),
          content: DynamicForm(
            fieldNames: fieldNames,
            initialValues: {
              "Name": stock["Name"] ?? "",
              "Quantity": stock["Quantity"].toString(),
              "Distributor": stock["Distributor"] ?? "",
            },
            onSubmit: (values) {
              nonpaidBox.putAt(index, {
                "Name": values["Name"] ?? "",
                "Quantity": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                "Distributor": values["Distributor"] ?? "",
              });
            },
          ),
        );
      },
    );
  }

  void _deleteStocks(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content:
              const Text("This Non paid stock will be deleted permanently."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                nonpaidBox.deleteAt(index);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Non Paid Stock deleted')),
                );
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Non Paid Stocks"),
          backgroundColor: Colors.green,
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: "Export to Excel",
              onPressed: () {
                ExcelHelper.exportToExcel(
                  context: context,
                  boxes: [nonpaidBox],
                  sheetName: " Non Paid Stocks ",
                  fileName: " Non Paid Stocks",
                  headers: [
                    "Name",
                    "Quantity",
                    "Price",
                    "Distributor",
                  ],
                );
              },
              icon: const Icon(Icons.file_upload),
            ),
            IconButton(
              tooltip: "Import from Excel",
              onPressed: () {
                ExcelHelper.importFromExcel(
                  context: context,
                  boxes: [nonpaidBox],
                  headers: [
                    "Name",
                    "Quantity",
                    "Distributor",
                  ],
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
              onPressed: _addStocks,
              child: const Text("+ Add Required Stock"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: nonpaidBox.listenable(),
                builder: (context, Box box, _) {
                  if (box.isEmpty) {
                    return const Center(child: Text("No Required Stocks"));
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Quantity")),
                          DataColumn(label: Text("Distributor")),
                          DataColumn(label: Text("Actions")),
                        ],
                        rows: List.generate(
                          box.length,
                          (index) {
                            final stock = box.getAt(index) as Map;
                            return DataRow(
                              cells: [
                                DataCell(Text(stock["Name"] ?? "")),
                                DataCell(Text(stock["Quantity"].toString())),
                                DataCell(Text(stock["Distributor"] ?? "")),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit,
                                            color: Colors.blue),
                                        onPressed: () =>
                                            _editStocks(index, stock),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () => _deleteStocks(index),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
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
