//   }
// }
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late Box scheduleBox;
  String searchQuery = "";
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    scheduleBox = Hive.box('scheduleBox');
  }

  Future<void> _deleteAllStocks() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text(
            "Are you sure you want to delete All Schedule? This action cannot be undone."),
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
      await scheduleBox.clear();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All stocks deleted successfully!")),
      );
      setState(() {}); // refresh UI
    }
  }

  // Export to Excel
  Future<void> _exportToExcel() async {
    var excel = Excel.createExcel();
    const sheetName = "Booking Schedule";

    if (excel.sheets.containsKey("Sheet1")) {
      excel.delete("Sheet1");
    }

    Sheet sheet = excel[sheetName];
    excel.setDefaultSheet(sheetName);

    sheet.appendRow([
      TextCellValue("Distributor Name"),
      TextCellValue("Day"),
    ]);

    for (var key in scheduleBox.keys) {
      final schedule = Map<String, dynamic>.from(scheduleBox.get(key));
      sheet.appendRow([
        TextCellValue(schedule["name"] ?? ""),
        TextCellValue(schedule["day"] ?? ""),
      ]);
    }

    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Excel File',
      fileName: 'BookingSchedule.xlsx',
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
          final schedule = {
            "name": row[0]?.value.toString() ?? "",
            "day": row[1]?.value.toString() ?? "",
          };
          scheduleBox.add(schedule);
        }
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Import successful")),
      );
      setState(() {});
    }
  }

  void _addSchedule() {
    final fieldNames = ["Distributor Name", "Day"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Schedule"),
          content: SizedBox(
            width: 500,
            height: 200,
            child: DynamicForm(
              fieldNames: fieldNames,
              onSubmit: (values) {
                final newSchedule = {
                  "name": values["Distributor Name"] ?? "",
                  "day": values["Day"] ?? "",
                };
                scheduleBox.add(newSchedule);
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  void _editSchedule(int key, Map schedule) {
    final fieldNames = ["Distributor Name", "Day"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Schedule"),
          content: SizedBox(
            width: 500,
            height: 200,
            child: DynamicForm(
              fieldNames: fieldNames,
              initialValues: {
                "Distributor Name": schedule["name"] ?? "",
                "Day": schedule["day"] ?? "",
              },
              onSubmit: (values) {
                final updatedSchedule = {
                  "name": values["Distributor Name"] ?? "",
                  "day": values["Day"] ?? "",
                };
                scheduleBox.put(key, updatedSchedule);
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  void _deleteSchedule(int key) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("This schedule will be deleted permanently."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                scheduleBox.delete(key);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Schedule deleted')),
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
        title: const Text("Booking Schedule",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            )),
        // centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: _addSchedule,
            child: const Text("+ Add Shcedule",
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
            tooltip: " Delete all Schedule",
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
                labelText: "Search Distributor or Day",
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
          //   onPressed: _addSchedule,
          //   child: const Text("+ Add Schedule"),
          // ),

          // Paginated DataTable
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: scheduleBox.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text("No schedules available"));
                }

                var filteredKeys = box.keys.where((key) {
                  final data = box.get(key);
                  if (data is! Map) return false;
                  final schedule = Map<String, dynamic>.from(data);
                  final name =
                      (schedule["name"] ?? "").toString().toLowerCase();
                  final day = (schedule["day"] ?? "").toString().toLowerCase();

                  if (searchQuery.isEmpty) return true;
                  return name.contains(searchQuery) ||
                      day.contains(searchQuery);
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
                    final fractions = [0.35, 0.4, 0.2];
                    final colWidths =
                        fractions.map((f) => totalWidth * f).toList();

                    return SingleChildScrollView(
                      child: PaginatedDataTable(
                        //header: const Text("Booking Schedule"),
                        header: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // spread out
                          children: [
                            const Text("Booking Schedule",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                )),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: _addSchedule,
                                  child: const Text("+ Add Schedule",
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
                          DataColumn(label: Text("Distributor Name")),
                          DataColumn(label: Text("Day")),
                          DataColumn(label: Text("Actions")),
                        ],
                        source: _ScheduleDataSource(
                          filteredKeys,
                          box,
                          _editSchedule,
                          _deleteSchedule,
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
class _ScheduleDataSource extends DataTableSource {
  final List<dynamic> keys;
  final Box box;
  final Function(int, Map) onEdit;
  final Function(int) onDelete;
  final List<double> colWidths;

  _ScheduleDataSource(
      this.keys, this.box, this.onEdit, this.onDelete, this.colWidths);

  String _text(Object? v) => (v ?? "").toString();

  @override
  DataRow? getRow(int index) {
    if (index >= keys.length) return null;
    final key = keys[index];
    final schedule = Map<String, dynamic>.from(box.get(key) ?? {});
    return DataRow(
      cells: [
        DataCell(SizedBox(
          width: colWidths[0],
          child: Text(_text(schedule["name"]), overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths[1],
          child: Text(_text(schedule["day"]), overflow: TextOverflow.ellipsis),
        )),
        DataCell(SizedBox(
          width: colWidths[2],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () => onEdit(key, schedule),
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
