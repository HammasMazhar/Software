import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/reuseable_widget/dynamic_form.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

//this without the excel widget
class Availablestocks extends StatefulWidget {
  const Availablestocks({super.key});

  @override
  State<Availablestocks> createState() => _AvailablestocksState();
}

class _AvailablestocksState extends State<Availablestocks> {
  late Box availableBox;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    availableBox = Hive.box('availableBox');
  }

  Future<void> _exportToExcel() async {
    var excel = Excel.createExcel();
    const sheetName = "Available Stocks";

    if (excel.sheets.containsKey("Sheet1")) {
      //ya default sheet jo banti ha usko delelte karti ha
      excel.delete("Sheet1");
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
            "Distributor": row[3]?.value.toString() ?? "",
            "Tablets": row[4]?.value.toString() ?? "",
            "Pack Price": row[5]?.value.toString() ?? "",
          };
          availableBox.add(stock);
        }
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Import successful")),
      );
    }
  }

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
          content: DynamicForm(
            fieldNames: fieldNames,
            onSubmit: (values) {
              final newStock = {
                "Medicine Name": values["Medicine Name"] ?? "",
                "Company": values["Company"] ?? "",
                "Distributor": values["Distributor"] ?? "",
                "Tablets": values["Tablets"] ?? "",
                "Pack Price": values["Pack Price"] ?? "",
              };
              availableBox.add(newStock);
            },
          ),
        );
      },
    );
  }

  void _editStocks(int key, Map stock) {
    final fieldNames = [
      "Medicine Name",
      "Company",
      "Tablets",
      "Distributor",
      "Pack Price"
    ];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Stocks"),
          content: DynamicForm(
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
                "Medicine Name": values["Medicine Name"] ?? "",
                "Company": values["Company"] ?? "",
                "Distributor": values["Distributor"] ?? "",
                "Tablets": values["Tablets"] ?? "",
                "Pack Price": values["Pack Price"] ?? "",
              };
              availableBox.put(key, updatedStock);
            },
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
                availableBox.delete(key);
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
        title: const Text("Available Stocks"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search by Medicine or Company",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addStocks,
              child: const Text("+ Add Stocks"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ValueListenableBuilder(
                    valueListenable: availableBox.listenable(),
                    builder: (context, Box box, _) {
                      if (box.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text("No stocks available")),
                        );
                      }

                      final filteredKeys = box.keys.where((key) {
                        final data = box.get(key);
                        if (data is! Map) return false;

                        final stock = Map<String, dynamic>.from(data);
                        final name = (stock["Medicine Name"] ?? "")
                            .toString()
                            .toLowerCase();
                        final company =
                            (stock["Company"] ?? "").toString().toLowerCase();

                        return name.contains(searchQuery) ||
                            company.contains(searchQuery);
                      }).toList();

                      if (filteredKeys.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text("No matching stocks")),
                        );
                      }

                      return DataTable(
                        columns: const [
                          DataColumn(label: Text("Medicine Name")),
                          DataColumn(label: Text("Company")),
                          DataColumn(label: Text('Distributor')),
                          DataColumn(label: Text("Tablets")),
                          DataColumn(label: Text("Pack Price")),
                          DataColumn(label: Text("Actions")),
                        ],
                        rows: filteredKeys.map((key) {
                          final stock = Map<String, dynamic>.from(box.get(key));
                          return DataRow(
                            cells: [
                              DataCell(Text(stock["Medicine Name"] ?? "")),
                              DataCell(Text(stock["Company"] ?? "")),
                              DataCell(Text(stock["Distributor"] ?? "")),
                              DataCell(Text(stock["Tablets"] ?? "")),
                              DataCell(Text(stock["Pack Price"] ?? "")),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () => _editStocks(key, stock),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () => _deleteStocks(key),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
