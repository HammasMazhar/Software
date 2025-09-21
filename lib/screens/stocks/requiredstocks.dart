import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';
import 'package:software/screens/global_widgets/excel.dart';

class Requiredstocks extends StatefulWidget {
  const Requiredstocks({super.key});

  @override
  State<Requiredstocks> createState() => _RequiredstocksState();
}

class _RequiredstocksState extends State<Requiredstocks> {
//  static const String routeName = '/requiredstocks';
  late Box requiredBox;

  final List<String> fieldNames = [
    "Name",
    "Quantity",
    "Distributor",
  ];

  @override
  void initState() {
    super.initState();
    requiredBox = Hive.box('requiredBox');
  }

  void _addStocks() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Required Stock"),
          content: SizedBox(
              width: 500,
              height: 250,
              child: DynamicForm(
                fieldNames: fieldNames,
                onSubmit: (values) {
                  requiredBox.add({
                    "Name": values["Name"] ?? "",
                    "Quantity": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                    "Distributor": values["Distributor"] ?? "",
                  });
                  Navigator.pop(context);
                },
              )),
        );
      },
    );
  }

  void _editStocks(int index, Map stock) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Required Stock"),
          content: SizedBox(
              width: 500,
              height: 250,
              child: DynamicForm(
                fieldNames: fieldNames,
                initialValues: {
                  "Name": stock["Name"] ?? "",
                  "Quantity": stock["Quantity"].toString(),
                  "Distributor": stock["Distributor"] ?? "",
                },
                onSubmit: (values) {
                  requiredBox.putAt(index, {
                    "Name": values["Name"] ?? "",
                    "Quantity": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                    "Distributor": values["Distributor"] ?? "",
                  });
                },
              )),
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
          content: const Text("This stock will be deleted permanently."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                requiredBox.deleteAt(index);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Stock deleted')),
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
          title: const Text("Required Stocks"),
          //  backgroundColor: Colors.green,
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: "Export to Excel",
              onPressed: () {
                ExcelHelper.exportToExcel(
                  context: context,
                  boxes: [requiredBox],
                  sheetName: " Required Stocks ",
                  fileName: " Required Stocks",
                  headers: [
                    "Name",
                    "Quantity",
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
                  boxes: [requiredBox],
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
                valueListenable: requiredBox.listenable(),
                builder: (context, Box box, _) {
                  if (box.isEmpty) {
                    return const Center(child: Text("No Required Stocks"));
                  }

                  return Center(
                    child: SingleChildScrollView(
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
