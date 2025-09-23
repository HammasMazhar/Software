import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class Availablestocks extends StatefulWidget {
  const Availablestocks({super.key});

  @override
  State<Availablestocks> createState() => _AvailablestocksState();
}

class _AvailablestocksState extends State<Availablestocks> {
  // Delete all stocks
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
      await availableBox.clear();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All stocks deleted successfully!")),
      );
      setState(() {}); // refresh UI
    }
  }

  late Box availableBox;
  String searchQuery = "";
  int _rowsPerPage = 20; // default rows per page

  @override
  void initState() {
    super.initState();
    availableBox = Hive.box('availableBox');
  }

  // helper: match by startsWith on whole field or any word in field
  bool _startsWithAnyWord(String field, String q) {
    final normalized = field.toLowerCase();
    if (normalized.startsWith(q)) return true;
    for (final part in normalized.split(RegExp(r'\s+'))) {
      if (part.startsWith(q)) return true;
    }
    return false;
  }

  // compute a score so items that start with query (medicine name first-letter/word) show at top
  int _matchScore(Map<String, dynamic> stock, String q) {
    if (q.isEmpty) return 0;
    final name = (stock["Medicine Name"] ?? "").toString().toLowerCase();
    final company = (stock["Company"] ?? "").toString().toLowerCase();
    final distributor = (stock["Distributor"] ?? "").toString().toLowerCase();

    int score = 0;

    // highest priority: medicine name starts with q
    if (name.startsWith(q)) score += 100;
    // next: any word in medicine name starts with q
    for (final part in name.split(RegExp(r'\s+'))) {
      if (part.startsWith(q)) {
        score += 80;
        break;
      }
    }
    // company / distributor priority but lower than medicine name
    if (company.startsWith(q)) score += 50;
    for (final part in company.split(RegExp(r'\s+'))) {
      if (part.startsWith(q)) {
        score += 40;
        break;
      }
    }
    if (distributor.startsWith(q)) score += 30;
    for (final part in distributor.split(RegExp(r'\s+'))) {
      if (part.startsWith(q)) {
        score += 20;
        break;
      }
    }

    // contains matches get small boost so they appear after startsWith matches
    if (name.contains(q) && !name.startsWith(q)) score += 10;
    if (company.contains(q) && !company.startsWith(q)) score += 5;
    if (distributor.contains(q) && !distributor.startsWith(q)) score += 3;

    return score;
  }

  // Export to Excel
  Future<void> _exportToExcel() async {
    var excel = Excel.createExcel();
    const sheetName = "Available Stocks";

    if (excel.sheets.containsKey("Sheet1")) {
      excel.delete("Sheet1"); // remove default sheet
    }

    Sheet sheet = excel[sheetName];
    excel.setDefaultSheet(sheetName);

    sheet.appendRow([
      TextCellValue("Medicine Name"),
      TextCellValue("Company"),
      TextCellValue("Distributor"),
      TextCellValue("Tablets"),
      TextCellValue("Pack Price"),
    ]);

    for (var key in availableBox.keys) {
      final stock = Map<String, dynamic>.from(availableBox.get(key));
      sheet.appendRow([
        TextCellValue(stock["Medicine Name"] ?? ""),
        TextCellValue(stock["Company"] ?? ""),
        TextCellValue(stock["Distributor"] ?? ""),
        TextCellValue(stock["Tablets"] ?? ""),
        TextCellValue(stock["Pack Price"] ?? ""),
      ]);
    }

    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Excel File',
      fileName: 'AvailableStocks.xlsx',
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
            "Medicine Name": row[0]?.value.toString() ?? "",
            "Company": row[1]?.value.toString() ?? "",
            "Distributor": row[2]?.value.toString() ?? "",
            "Tablets": row[3]?.value.toString() ?? "",
            "Pack Price": row[4]?.value.toString() ?? "",
          };
          availableBox.add(stock);
        }
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Import successful")),
      );
      setState(() {}); // ensure UI updates immediately
    }
  }

  // Add stock
  void _addStocks() {
    final fieldNames = [
      "Medicine Name",
      "Company",
      "Distributor",
      "Tablets",
      "Pack Price"
    ];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Stocks"),
          content: SizedBox(
            width: 500,
            height: 400,
            child: DynamicForm(
              fieldNames: fieldNames,
              onSubmit: (values) {
                if ((values["Medicine Name"] ?? "").trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Medicine Name is required")),
                  );
                  return;
                }
                if ((values["Tablets"] ?? "").trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Tablets is required")),
                  );
                  return;
                }
                if ((values["Pack Price"] ?? "").trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pack Price is required")),
                  );
                  return;
                }

                if (int.tryParse(values["Tablets"] ?? "") == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Tablets must be digits only")),
                  );
                  return;
                }
                if (double.tryParse(values["Pack Price"] ?? "") == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Pack Price must be a valid number")),
                  );
                  return;
                }

                final newStock = {
                  "Medicine Name": values["Medicine Name"]!,
                  "Company": values["Company"] ?? "",
                  "Distributor": values["Distributor"] ?? "",
                  "Tablets": values["Tablets"]!,
                  "Pack Price": values["Pack Price"]!,
                };
                availableBox.add(newStock);
                Navigator.pop(context);
                setState(() {}); // ensure the new item shows at top immediately
              },
            ),
          ),
        );
      },
    );
  }

  // Edit stock
  void _editStocks(int key, Map stock) {
    final fieldNames = [
      "Medicine Name",
      "Company",
      "Distributor",
      "Tablets",
      "Pack Price"
    ];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Stocks"),
          content: SizedBox(
            width: 500,
            height: 400,
            child: DynamicForm(
              fieldNames: fieldNames,
              initialValues: {
                "Medicine Name": stock["Medicine Name"] ?? "",
                "Company": stock["Company"] ?? "",
                "Distributor": stock["Distributor"] ?? "",
                "Tablets": stock["Tablets"] ?? "",
                "Pack Price": stock["Pack Price"] ?? "",
              },
              onSubmit: (values) {
                final updatedStock = {
                  "Medicine Name": values["Medicine Name"]!,
                  "Company": values["Company"] ?? "",
                  "Distributor": values["Distributor"] ?? "",
                  "Tablets": values["Tablets"]!,
                  "Pack Price": values["Pack Price"]!,
                };
                availableBox.put(key, updatedStock);
                Navigator.pop(context);
                setState(() {}); // refresh immediately
              },
            ),
          ),
        );
      },
    );
  }

  // Delete stock
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
                availableBox.delete(key);
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
        title: const Text("Available Stocks",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          ElevatedButton(
            onPressed: _addStocks,
            child: const Text("+ Add Stocks",
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
                labelText: "Search by Medicine/Company/Distributor",
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
              valueListenable: availableBox.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text("No stocks available"));
                }

                final q = searchQuery;
                var filteredKeys = box.keys.where((key) {
                  final data = box.get(key);
                  if (data is! Map) return false;
                  final stock = Map<String, dynamic>.from(data);
                  final name = (stock["Medicine Name"] ?? "").toString();
                  final distributor = (stock["Distributor"] ?? "").toString();
                  final company = (stock["Company"] ?? "").toString();

                  if (q.isEmpty) return true;

                  final nq = q.toLowerCase();
                  return name.toLowerCase().contains(nq) ||
                      company.toLowerCase().contains(nq) ||
                      distributor.toLowerCase().contains(nq);
                }).toList();

                // sort by match score so items whose medicine name starts with query appear first,
                // then word-start matches, then contains matches. Within same score show newest first.
                if (q.isNotEmpty) {
                  filteredKeys.sort((a, b) {
                    final sa =
                        _matchScore(Map<String, dynamic>.from(box.get(a)), q);
                    final sb =
                        _matchScore(Map<String, dynamic>.from(box.get(b)), q);
                    if (sb != sa) return sb - sa;
                    // tie-breaker: if numeric keys (Hive int keys), newer (larger) first
                    try {
                      if (a is int && b is int) {
                        return (b as int).compareTo(a as int);
                      }
                    } catch (_) {}
                    return 0;
                  });
                } else {
                  // when no query, show newest first
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
                    // Adjust fractions to control column width distribution (sum approx 1.0)
                    final fractions = [0.30, 0.18, 0.18, 0.12, 0.12, 0.08];
                    final colWidths =
                        fractions.map((f) => totalWidth * f).toList();

                    return SingleChildScrollView(
                      child: PaginatedDataTable(
                        // header: Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceBetween, // spread out
                        //   children: [
                        //     // const Text("Available Stocks",
                        //     //     style: TextStyle(
                        //     //       fontSize: 23,
                        //     //       fontWeight: FontWeight.bold,
                        //     //     )),
                        //     Row(
                        //       children: [
                        //         // ElevatedButton(
                        //         //   onPressed: _addStocks,
                        //         //   child: const Text("+ Add Stocks",
                        //         //       style: TextStyle(
                        //         //         color: Colors.black,
                        //         //       )
                        //         //       ),
                        //         // ),
                        //         // IconButton(
                        //         //   icon: const Icon(Icons.file_upload),
                        //         //   tooltip: "Export to Excel",
                        //         //   onPressed: _exportToExcel,
                        //         // ),
                        //         // IconButton(
                        //         //   tooltip: "Import from Excel",
                        //         //   icon: const Icon(Icons.file_download),
                        //         //   onPressed: _importFromExcel,
                        //         // ),
                        //         //  IconButton(
                        //         //   tooltip: " Delete all stocks",
                        //         //   icon: const Icon(Icons.delete),
                        //         //   onPressed: _importFromExcel,
                        //         // ),
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
                        columnSpacing: 0, // reduce gaps between columns
                        horizontalMargin:
                            8, // reduce left/right padding of each cell
                        columns: const [
                          DataColumn(label: Text("Medicine Name")),
                          DataColumn(label: Text("Company")),
                          DataColumn(label: Text("Distributor")),
                          DataColumn(label: Text("Tablets")),
                          DataColumn(label: Text("Pack Price")),
                          DataColumn(label: Text("Actions")),
                        ],
                        source: _StockDataSource(
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

// Custom DataTableSource (for pagination)
class _StockDataSource extends DataTableSource {
  final List<dynamic> keys;
  final Box box;
  final Function(int, Map) onEdit;
  final Function(int) onDelete;
  final List<double> colWidths;

  _StockDataSource(
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
          width: colWidths.isNotEmpty ? colWidths[0] : 200,
          child: Text(_text(stock["Medicine Name"]),
              overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths.length > 1 ? colWidths[1] : 120,
          child: Text(_text(stock["Company"]), overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths.length > 2 ? colWidths[2] : 120,
          child: Text(_text(stock["Distributor"]),
              overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths.length > 3 ? colWidths[3] : 80,
          child: Text(_text(stock["Tablets"]), overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths.length > 4 ? colWidths[4] : 80,
          child:
              Text(_text(stock["Pack Price"]), overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths.length > 5 ? colWidths[5] : 100,
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
