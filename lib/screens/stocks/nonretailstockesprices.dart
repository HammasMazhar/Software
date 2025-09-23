// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/screens/global_widgets/dynamic_form.dart';
// import 'package:software/screens/global_widgets/excel.dart';

// class NonRetailStockPrices extends StatefulWidget {
//   const NonRetailStockPrices({super.key});

//   @override
//   State<NonRetailStockPrices> createState() => _NonRetailStockPrices();
// }

// class _NonRetailStockPrices extends State<NonRetailStockPrices> {
//   late Box nonretailstockBox;

//   final List<String> fieldNames = [
//     "Name",
//     "Net Price",
//     "Retail Price",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     nonretailstockBox = Hive.box('nonretailstockBox');
//   }

//   void _addSale() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Add Non Retail Stock Price"),
//           content: SizedBox(
//               width: 500,
//               height: 250,
//               child: DynamicForm(
//                 fieldNames: fieldNames,
//                 onSubmit: (values) {
//                   nonretailstockBox.add({
//                     "Name": values["Name"] ?? "",
//                     "Net Price": int.tryParse(values["Net Price"] ?? "0") ?? 0,
//                     "Retail Price":
//                         double.tryParse(values["Retail Price"] ?? "0") ?? 0.0,
//                   });
//                   Navigator.pop(context);
//                 },
//               )),
//         );
//       },
//     );
//   }

//   void _editSale(int key, Map sale) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Non Retail Stock Stock"),
//           content: SizedBox(
//               width: 500,
//               height: 250,
//               child: DynamicForm(
//                 fieldNames: fieldNames,
//                 initialValues: {
//                   "Name": sale["Name"] ?? "",
//                   "Net Price": sale[" Net Price"].toString(),
//                   "Retail Price": sale["Retail Price"].toString(),
//                 },
//                 onSubmit: (values) {
//                   nonretailstockBox.put(key, {
//                     "Name": values["Name"] ?? "",
//                     "Net Price":
//                         double.tryParse(values["Net Price"] ?? "0") ?? 0.0,
//                     "Retail Price":
//                         double.tryParse(values["Retail Price"] ?? "0") ?? 0.0,
//                   });
//                   // Navigator.pop(context); // close edit dialog
//                 },
//               )),
//         );
//       },
//     );
//   }

//   void _deleteSale(int key) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Confirm Delete"),
//         content: const Text("Are you sure you want to delete this  stock?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               nonretailstockBox.delete(key);
//               Navigator.pop(context);
//             },
//             child: const Text("Delete"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Non Retail Stocks"),
//           //    backgroundColor: Colors.green,
//           actions: [
//             IconButton(
//               tooltip: "Export to Excel",
//               onPressed: () {
//                 ExcelHelper.exportToExcel(
//                   context: context,
//                   boxes: [nonretailstockBox],
//                   sheetName: "  Non Retail Stocks ",
//                   fileName: "Non Retail Stocks",
//                   headers: ["Name", "Net Price", "Retail Price"],
//                 );
//               },
//               icon: const Icon(Icons.file_upload),
//             ),
//             IconButton(
//               tooltip: "Import from Excel",
//               onPressed: () {
//                 ExcelHelper.importFromExcel(
//                   context: context,
//                   boxes: [nonretailstockBox],
//                   headers: ["Name", "Net Price", "Retail Price"],
//                 );
//               },
//               icon: const Icon(Icons.file_download),
//             ),
//           ]),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addSale,
//               child: const Text("+Non Retail Stocks"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: nonretailstockBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No Non Retail Stocks"));
//                   }

//                   final keys = box.keys.toList();

//                   return Center(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: DataTable(
//                           columns: const [
//                             DataColumn(label: Text("Name")),
//                             DataColumn(label: Text("Net Price")),
//                             DataColumn(label: Text("Retail Price")),
//                             DataColumn(label: Text("Actions")),
//                           ],
//                           rows: keys.map((key) {
//                             final sale = box.get(key) as Map;
//                             return DataRow(
//                               cells: [
//                                 DataCell(Text(sale["Name"]?.toString() ?? "")),
//                                 DataCell(Text(sale["Net Price"] != null
//                                     ? double.parse(sale["Net Price"].toString())
//                                         .toStringAsFixed(2)
//                                     : "")),
//                                 DataCell(Text(sale["Retail Price"] != null
//                                     ? double.parse(
//                                             sale["Retail Price"].toString())
//                                         .toStringAsFixed(2)
//                                     : "")),
//                                 DataCell(
//                                   Row(
//                                     children: [
//                                       IconButton(
//                                         icon: const Icon(Icons.edit,
//                                             color: Colors.blue),
//                                         onPressed: () => _editSale(key, sale),
//                                       ),
//                                       IconButton(
//                                         icon: const Icon(Icons.delete,
//                                             color: Colors.red),
//                                         onPressed: () => _deleteSale(key),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class NonRetailStockPrices extends StatefulWidget {
  const NonRetailStockPrices({super.key});

  @override
  State<NonRetailStockPrices> createState() => _NonRetailStockPricesState();
}

class _NonRetailStockPricesState extends State<NonRetailStockPrices> {
  Future<void> _deleteAllStocks() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text(
            "Are you sure you want to delete ALL stocks? This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text("Delete All"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await nonRetailBox.clear();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All stocks deleted successfully!")),
      );
      setState(() {}); // refresh UI
    }
  }

  late Box nonRetailBox;
  String searchQuery = "";
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    nonRetailBox = Hive.box('nonretailstockBox');
  }

  // Export to Excel
  Future<void> _exportToExcel() async {
    var excel = Excel.createExcel();
    const sheetName = "Non Retail Stocks";

    if (excel.sheets.containsKey("Sheet1")) {
      excel.delete("Sheet1");
    }

    Sheet sheet = excel[sheetName];
    excel.setDefaultSheet(sheetName);

    sheet.appendRow([
      TextCellValue("Name"),
      TextCellValue("Net Price"),
      TextCellValue("Retail Price"),
    ]);

    for (var key in nonRetailBox.keys) {
      final stock = Map<String, dynamic>.from(nonRetailBox.get(key));
      sheet.appendRow([
        TextCellValue(stock["Name"] ?? ""),
        TextCellValue(stock["Net Price"].toString()),
        TextCellValue(stock["Retail Price"].toString()),
      ]);
    }

    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Excel File',
      fileName: 'NonRetailStocks.xlsx',
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (outputFile != null) {
      File(outputFile).writeAsBytesSync(excel.encode()!);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exported to $outputFile")),
      );
    }
  }

  // Import from Excel
  Future<void> _importFromExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      var bytes = File(result.files.single.path!).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows.skip(1)) {
          final stock = {
            "Name": row[0]?.value.toString() ?? "",
            "Net Price":
                double.tryParse(row[1]?.value.toString() ?? "0") ?? 0.0,
            "Retail Price":
                double.tryParse(row[2]?.value.toString() ?? "0") ?? 0.0,
          };
          nonRetailBox.add(stock);
        }
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Import successful")),
      );
      setState(() {});
    }
  }

  void _addStocks() {
    final fieldNames = ["Name", "Net Price", "Retail Price"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Non Retail Stock"),
          content: SizedBox(
            width: 500,
            height: 250,
            child: DynamicForm(
              fieldNames: fieldNames,
              onSubmit: (values) {
                if ((values["Name"] ?? "").trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Name is required")),
                  );
                  return;
                }
                if ((values["Net Price"] ?? "").trim().isEmpty ||
                    double.tryParse(values["Net Price"] ?? "") == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Net Price must be a valid number")),
                  );
                  return;
                }
                if ((values["Retail Price"] ?? "").trim().isEmpty ||
                    double.tryParse(values["Retail Price"] ?? "") == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Retail Price must be a valid number")),
                  );
                  return;
                }

                final newStock = {
                  "Name": values["Name"]!,
                  "Net Price": double.parse(values["Net Price"]!),
                  "Retail Price": double.parse(values["Retail Price"]!),
                };

                nonRetailBox.add(newStock);
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  void _editStocks(int key, Map stock) {
    final fieldNames = ["Name", "Net Price", "Retail Price"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Non Retail Stock"),
          content: SizedBox(
            width: 500,
            height: 250,
            child: DynamicForm(
              fieldNames: fieldNames,
              initialValues: {
                "Name": stock["Name"] ?? "",
                "Net Price": stock["Net Price"].toString(),
                "Retail Price": stock["Retail Price"].toString(),
              },
              onSubmit: (values) {
                final updatedStock = {
                  "Name": values["Name"] ?? "",
                  "Net Price":
                      double.tryParse(values["Net Price"] ?? "0") ?? 0.0,
                  "Retail Price":
                      double.tryParse(values["Retail Price"] ?? "0") ?? 0.0,
                };
                nonRetailBox.put(key, updatedStock);
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  void _deleteStocks(int key) {
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
                nonRetailBox.delete(key);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Stock deleted')),
                );
                setState(() {});
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
        title: const Text("Non paid Stocks",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            )),
        // centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: _addStocks,
            child: const Text("+ Add Non Paid Stock",
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
          IconButton(
            icon: const Icon(Icons.file_upload),
            tooltip: "Export to Excel",
            onPressed: _exportToExcel,
          ),
          IconButton(
            tooltip: "Import from Excel",
            icon: const Icon(Icons.file_download),
            onPressed: _importFromExcel,
          ),
          IconButton(
            tooltip: " Delete all stocks",
            icon: const Icon(Icons.delete),
            onPressed: _deleteAllStocks,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search by Name",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.trim().toLowerCase();
                });
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: _addStocks,
          //   child: const Text("+ Add Non Retail Stock"),
          // ),

          // Paginated DataTable
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: nonRetailBox.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text("No Non Retail Stocks"));
                }

                var filteredKeys = box.keys.where((key) {
                  final data = box.get(key);
                  if (data is! Map) return false;
                  final stock = Map<String, dynamic>.from(data);
                  final name = (stock["Name"] ?? "").toString().toLowerCase();

                  if (searchQuery.isEmpty) return true;
                  return name.contains(searchQuery);
                }).toList();

                // latest first
                try {
                  if (filteredKeys.every((k) => k is int)) {
                    filteredKeys.sort((a, b) => (b as int).compareTo(a as int));
                  } else {
                    filteredKeys = filteredKeys.reversed.toList();
                  }
                } catch (_) {
                  filteredKeys = filteredKeys.reversed.toList();
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final totalWidth = constraints.maxWidth;
                    final fractions = [0.30, 0.20, 0.20, 0.15];
                    final colWidths =
                        fractions.map((f) => totalWidth * f).toList();

                    return SingleChildScrollView(
                      child: PaginatedDataTable(
                        //  header: const Text("Non Retail Stocks"),
                        header: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // spread out
                          children: [
                            const Text("Non Retail Stocks",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                )),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: _addStocks,
                                  child: const Text("+ Add Non Retail Stocks",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.file_upload),
                                  tooltip: "Export to Excel",
                                  onPressed: _exportToExcel,
                                ),
                                IconButton(
                                  tooltip: "Import from Excel",
                                  icon: const Icon(Icons.file_download),
                                  onPressed: _importFromExcel,
                                ),
                              ],
                            ),
                          ],
                        ),
                        rowsPerPage: _rowsPerPage,
                        availableRowsPerPage: const [10, 20, 50, 100],
                        onRowsPerPageChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _rowsPerPage = value;
                          });
                        },
                        columns: const [
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Net Price")),
                          DataColumn(label: Text("Retail Price")),
                          DataColumn(label: Text("Actions")),
                        ],
                        source: _NonRetailStockDataSource(
                          filteredKeys,
                          box,
                          _editStocks,
                          _deleteStocks,
                          colWidths,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Custom DataTableSource
class _NonRetailStockDataSource extends DataTableSource {
  final List<dynamic> keys;
  final Box box;
  final Function(int, Map) onEdit;
  final Function(int) onDelete;
  final List<double> colWidths;

  _NonRetailStockDataSource(
      this.keys, this.box, this.onEdit, this.onDelete, this.colWidths);

  String _text(Object? v) => (v ?? "").toString();

  @override
  DataRow? getRow(int index) {
    if (index >= keys.length) return null;
    final key = keys[index];
    final stock = Map<String, dynamic>.from(box.get(key) ?? {});
    return DataRow(
      cells: [
        DataCell(SizedBox(
          width: colWidths[0],
          child: Text(_text(stock["Name"]), overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths[1],
          child:
              Text(_text(stock["Net Price"]), overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths[2],
          child: Text(_text(stock["Retail Price"]),
              overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths[3],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () => onEdit(key, stock),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onDelete(key),
              ),
            ],
          ),
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => keys.length;

  @override
  int get selectedRowCount => 0;
}
