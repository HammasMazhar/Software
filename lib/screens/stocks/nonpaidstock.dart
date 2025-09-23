// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/screens/global_widgets/dynamic_form.dart';
// import 'package:software/screens/global_widgets/excel.dart';

// class Nonpaidstock extends StatefulWidget {
//   const Nonpaidstock({super.key});

//   @override
//   State<Nonpaidstock> createState() => _NonpaidstockState();
// }

// class _NonpaidstockState extends State<Nonpaidstock> {
// //  static const String routeName = '/requiredstocks';
//   late Box nonpaidBox;

//   final List<String> fieldNames = [
//     "Name",
//     "Quantity",
//     "Distributor",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     nonpaidBox = Hive.box('nonpaidBox');
//   }

//   void _addStocks() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Add Non Paid Stock"),
//           content: SizedBox(
//               width: 500,
//               height: 280,
//               child: DynamicForm(
//                 fieldNames: fieldNames,
//                 onSubmit: (values) {
//                   nonpaidBox.add({
//                     "Name": values["Name"] ?? "",
//                     "Quantity": int.tryParse(values["Quantity"] ?? "0") ?? 0,
//                     "Distributor": values["Distributor"] ?? "",
//                   });
//                   Navigator.pop(context);
//                 },
//               )),
//         );
//       },
//     );
//   }

//   void _editStocks(int index, Map stock) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Non Paid Stock"),
//           content: SizedBox(
//               width: 500,
//               height: 280,
//               child: DynamicForm(
//                 fieldNames: fieldNames,
//                 initialValues: {
//                   "Name": stock["Name"] ?? "",
//                   "Quantity": stock["Quantity"].toString(),
//                   "Distributor": stock["Distributor"] ?? "",
//                 },
//                 onSubmit: (values) {
//                   nonpaidBox.putAt(index, {
//                     "Name": values["Name"] ?? "",
//                     "Quantity": int.tryParse(values["Quantity"] ?? "0") ?? 0,
//                     "Distributor": values["Distributor"] ?? "",
//                   });
//                 },
//               )),
//         );
//       },
//     );
//   }

//   void _deleteStocks(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content:
//               const Text("This Non paid stock will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 nonpaidBox.deleteAt(index);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Non Paid Stock deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Non Paid Stocks"),
//           //    backgroundColor: Colors.green,
//           actions: [
//             IconButton(
//               tooltip: "Export to Excel",
//               onPressed: () {
//                 ExcelHelper.exportToExcel(
//                   context: context,
//                   boxes: [nonpaidBox],
//                   sheetName: " Non Paid Stocks ",
//                   fileName: " Non Paid Stocks",
//                   headers: [
//                     "Name",
//                     "Quantity",
//                     "Price",
//                     "Distributor",
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
//                   boxes: [nonpaidBox],
//                   headers: [
//                     "Name",
//                     "Quantity",
//                     "Distributor",
//                   ],
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
//               onPressed: _addStocks,
//               child: const Text("+ Add Required Stock"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: nonpaidBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No Required Stocks"));
//                   }

//                   return Center(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: DataTable(
//                           columns: const [
//                             DataColumn(label: Text("Name")),
//                             DataColumn(label: Text("Quantity")),
//                             DataColumn(label: Text("Distributor")),
//                             DataColumn(label: Text("Actions")),
//                           ],
//                           rows: List.generate(
//                             box.length,
//                             (index) {
//                               final stock = box.getAt(index) as Map;
//                               return DataRow(
//                                 cells: [
//                                   DataCell(Text(stock["Name"] ?? "")),
//                                   DataCell(Text(stock["Quantity"].toString())),
//                                   DataCell(Text(stock["Distributor"] ?? "")),
//                                   DataCell(
//                                     Row(
//                                       children: [
//                                         IconButton(
//                                           icon: const Icon(Icons.edit,
//                                               color: Colors.blue),
//                                           onPressed: () =>
//                                               _editStocks(index, stock),
//                                         ),
//                                         IconButton(
//                                           icon: const Icon(Icons.delete,
//                                               color: Colors.red),
//                                           onPressed: () => _deleteStocks(index),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
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

class Nonpaidstock extends StatefulWidget {
  const Nonpaidstock({super.key});

  @override
  State<Nonpaidstock> createState() => _NonpaidstockState();
}

class _NonpaidstockState extends State<Nonpaidstock> {
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
      await nonpaidBox.clear();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All stocks deleted successfully!")),
      );
      setState(() {}); // refresh UI
    }
  }

  late Box nonpaidBox;
  String searchQuery = "";
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    nonpaidBox = Hive.box('nonpaidBox');
  }

  int _matchScore(Map<String, dynamic> stock, String q) {
    if (q.isEmpty) return 0;
    final name = (stock["Name"] ?? "").toString().toLowerCase();
    final distributor = (stock["Distributor"] ?? "").toString().toLowerCase();

    int score = 0;
    if (name.startsWith(q)) score += 100;
    for (final part in name.split(RegExp(r'\s+'))) {
      if (part.startsWith(q)) {
        score += 80;
        break;
      }
    }
    if (distributor.startsWith(q)) score += 50;
    for (final part in distributor.split(RegExp(r'\s+'))) {
      if (part.startsWith(q)) {
        score += 40;
        break;
      }
    }
    if (name.contains(q) && !name.startsWith(q)) score += 10;
    if (distributor.contains(q) && !distributor.startsWith(q)) score += 5;
    return score;
  }

  // Export to Excel
  Future<void> _exportToExcel() async {
    var excel = Excel.createExcel();
    const sheetName = "Non Paid Stocks";

    if (excel.sheets.containsKey("Sheet1")) {
      excel.delete("Sheet1");
    }

    Sheet sheet = excel[sheetName];
    excel.setDefaultSheet(sheetName);

    sheet.appendRow([
      TextCellValue("Name"),
      TextCellValue("Quantity"),
      TextCellValue("Distributor"),
    ]);

    for (var key in nonpaidBox.keys) {
      final stock = Map<String, dynamic>.from(nonpaidBox.get(key));
      sheet.appendRow([
        TextCellValue(stock["Name"] ?? ""),
        TextCellValue(stock["Quantity"].toString()),
        TextCellValue(stock["Distributor"] ?? ""),
      ]);
    }

    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Excel File',
      fileName: 'NonPaidStocks.xlsx',
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
            "Quantity": int.tryParse(row[1]?.value.toString() ?? "0") ?? 0,
            "Distributor": row[2]?.value.toString() ?? "",
          };
          nonpaidBox.add(stock);
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
    final fieldNames = ["Name", "Quantity", "Distributor"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Non Paid Stock"),
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
                if ((values["Quantity"] ?? "").trim().isEmpty ||
                    int.tryParse(values["Quantity"] ?? "") == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Quantity must be digits only")),
                  );
                  return;
                }

                final newStock = {
                  "Name": values["Name"]!,
                  "Quantity": int.parse(values["Quantity"]!),
                  "Distributor": values["Distributor"] ?? "",
                };
                nonpaidBox.add(newStock);
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
    final fieldNames = ["Name", "Quantity", "Distributor"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Non Paid Stock"),
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
                final updatedStock = {
                  "Name": values["Name"]!,
                  "Quantity": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                  "Distributor": values["Distributor"] ?? "",
                };
                nonpaidBox.put(key, updatedStock);
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
                nonpaidBox.delete(key);
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
                labelText: "Search by Name / Distributor",
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

          // Paginated DataTable
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: nonpaidBox.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text("No Non Paid Stocks"));
                }

                final q = searchQuery;
                var filteredKeys = box.keys.where((key) {
                  final data = box.get(key);
                  if (data is! Map) return false;
                  final stock = Map<String, dynamic>.from(data);
                  final name = (stock["Name"] ?? "").toString();
                  final distributor = (stock["Distributor"] ?? "").toString();

                  if (q.isEmpty) return true;
                  final nq = q.toLowerCase();
                  return name.toLowerCase().contains(nq) ||
                      distributor.toLowerCase().contains(nq);
                }).toList();

                if (q.isNotEmpty) {
                  filteredKeys.sort((a, b) {
                    final sa =
                        _matchScore(Map<String, dynamic>.from(box.get(a)), q);
                    final sb =
                        _matchScore(Map<String, dynamic>.from(box.get(b)), q);
                    if (sb != sa) return sb - sa;
                    try {
                      if (a is int && b is int) {
                        return (b as int).compareTo(a as int);
                      }
                    } catch (_) {}
                    return 0;
                  });
                } else {
                  try {
                    if (filteredKeys.every((k) => k is int)) {
                      filteredKeys
                          .sort((a, b) => (b as int).compareTo(a as int));
                    } else {
                      filteredKeys = filteredKeys.reversed.toList();
                    }
                  } catch (_) {
                    filteredKeys = filteredKeys.reversed.toList();
                  }
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final totalWidth = constraints.maxWidth;
                    final fractions = [0.30, 0.2, 0.20, 0.2];
                    final colWidths =
                        fractions.map((f) => totalWidth * f).toList();

                    return SingleChildScrollView(
                      child: PaginatedDataTable(
                        //  header: const Text("Non Paid Stocks"),
                        // header: Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceBetween, // spread out
                        //   children: [
                        //     const Text("Non Paid Stocks",
                        //         style: TextStyle(
                        //           fontSize: 23,
                        //           fontWeight: FontWeight.bold,
                        //         )),
                        //     Row(
                        //       children: [
                        //         ElevatedButton(
                        //             onPressed: _addStocks,
                        //             child: const Text(
                        //               "+ Add Non Paid Stock",
                        //               style: TextStyle(
                        //                 color: Colors.black,
                        //               ),
                        //             )),
                        //         IconButton(
                        //           icon: const Icon(Icons.file_upload),
                        //           tooltip: "Export to Excel",
                        //           onPressed: _exportToExcel,
                        //         ),
                        //         IconButton(
                        //           tooltip: "Import from Excel",
                        //           icon: const Icon(Icons.file_download),
                        //           onPressed: _importFromExcel,
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
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
                          DataColumn(label: Text("Quantity")),
                          DataColumn(label: Text("Distributor")),
                          DataColumn(label: Text("Actions")),
                        ],
                        source: _NonPaidStockDataSource(
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
class _NonPaidStockDataSource extends DataTableSource {
  final List<dynamic> keys;
  final Box box;
  final Function(int, Map) onEdit;
  final Function(int) onDelete;
  final List<double> colWidths;

  _NonPaidStockDataSource(
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
              Text(_text(stock["Quantity"]), overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths[2],
          child: Text(_text(stock["Distributor"]),
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
