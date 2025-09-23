import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/screens/global_widgets/excel.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';

class Alldistributor extends StatefulWidget {
  const Alldistributor({super.key});

  @override
  State<Alldistributor> createState() => _AlldistributorState();
}

class _AlldistributorState extends State<Alldistributor> {
  final distributorBox = Hive.box('distributorBox');
  String searchQuery = "";
  int _rowsPerPage = 10;

  final List<String> distributorFields = [
    "Name",
    "Manager",
    "Booking Man",
    "Supply Man",
  ];
  Future<void> _deleteAllStocks() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text(
            "Are you sure you want to delete ALL Distributor? This action cannot be undone."),
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
      await distributorBox.clear();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All stocks deleted successfully!")),
      );
      setState(() {}); // refresh UI
    }
  }

  void _addDistributor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Distributor"),
          content: SizedBox(
            width: 400,
            height: 300,
            child: DynamicForm(
              fieldNames: distributorFields,
              onSubmit: (values) {
                distributorBox.add(values);
                Navigator.pop(context); // close dialog after submit
              },
            ),
          ),
        );
      },
    );
  }

  void _editDistributor(dynamic key, Map distributor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Distributor"),
          content: SizedBox(
            width: 400,
            height: 300,
            child: DynamicForm(
              fieldNames: distributorFields,
              initialValues: Map<String, String>.from(distributor),
              onSubmit: (values) {
                distributorBox.put(key, values);
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  void _deleteDistributor(dynamic key) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("This distributor will be deleted permanently."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                distributorBox.delete(key);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Distributor deleted')),
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
        title: const Text("Distributors",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          ElevatedButton(
            onPressed: _addDistributor,
            child: const Text("+ Add Distributor",
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
          IconButton(
            tooltip: "Export to Excel",
            onPressed: () {
              ExcelHelper.exportToExcel(
                context: context,
                boxes: [distributorBox],
                sheetName: "All Distributor",
                fileName: "All Distributor",
                headers: distributorFields,
              );
            },
            icon: const Icon(Icons.file_upload),
          ),
          IconButton(
            tooltip: "Import from Excel",
            onPressed: () {
              ExcelHelper.importFromExcel(
                context: context,
                boxes: [distributorBox],
                headers: distributorFields,
              );
            },
            icon: const Icon(Icons.file_download),
          ),
          IconButton(
            tooltip: " Delete all Distributor",
            icon: const Icon(Icons.delete),
            onPressed: _deleteAllStocks,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: _addDistributor,
            //   child: const Text("+ Add Distributor"),
            // ),
            //  const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Search by name",
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
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: distributorBox.listenable(),
                builder: (context, Box box, _) {
                  if (box.isEmpty) {
                    return const Center(child: Text("No Distributors Added"));
                  }

                  final distributors = box.keys
                      .map((key) => {"key": key, "data": box.get(key)})
                      .where((entry) {
                    final data = entry["data"] as Map;
                    final name = (data["Name"] ?? "").toString().toLowerCase();
                    return name.contains(searchQuery);
                  }).toList();

                  return SingleChildScrollView(
                    child: PaginatedDataTable(
                      //  header: const Text("All Distributors"),
                      // header: Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.spaceBetween, // spread out
                      //   children: [
                      //     const Text("All Distributors",
                      //         style: TextStyle(
                      //           fontSize: 23,
                      //           fontWeight: FontWeight.bold,
                      //         )),
                      //     Row(
                      //       children: [
                      //         ElevatedButton(
                      //           onPressed: _addDistributor,
                      //           child: const Text("+ Add Distributor",
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //               )),
                      //         ),
                      //         IconButton(
                      //           tooltip: "Export to Excel",
                      //           onPressed: () {
                      //             ExcelHelper.exportToExcel(
                      //               context: context,
                      //               boxes: [distributorBox],
                      //               sheetName: "All Distributor",
                      //               fileName: "All Distributor",
                      //               headers: distributorFields,
                      //             );
                      //           },
                      //           icon: const Icon(Icons.file_upload),
                      //         ),
                      //         IconButton(
                      //           tooltip: "Import from Excel",
                      //           onPressed: () {
                      //             ExcelHelper.importFromExcel(
                      //               context: context,
                      //               boxes: [distributorBox],
                      //               headers: distributorFields,
                      //             );
                      //           },
                      //           icon: const Icon(Icons.file_download),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      rowsPerPage: _rowsPerPage,
                      availableRowsPerPage: const [5, 10, 20, 50],
                      onRowsPerPageChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _rowsPerPage = value;
                          });
                        }
                      },
                      columnSpacing: 20,
                      horizontalMargin: 10,
                      columns: const [
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Manager")),
                        DataColumn(label: Text("Booking Man")),
                        DataColumn(label: Text("Supply Man")),
                        DataColumn(label: Text("Actions")),
                      ],
                      source: _DistributorDataSource(
                        distributors,
                        _editDistributor,
                        _deleteDistributor,
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

// Custom DataTableSource
class _DistributorDataSource extends DataTableSource {
  final List<dynamic> distributors;
  final Function(dynamic, Map) onEdit;
  final Function(dynamic) onDelete;

  _DistributorDataSource(this.distributors, this.onEdit, this.onDelete);

  @override
  DataRow? getRow(int index) {
    if (index >= distributors.length) return null;
    final entry = distributors[index];
    final distributor = entry["data"] as Map;
    final key = entry["key"];

    return DataRow(cells: [
      DataCell(Text(distributor["Name"] ?? "")),
      DataCell(Text(distributor["Manager"] ?? "")),
      DataCell(Text(distributor["Booking Man"] ?? "")),
      DataCell(Text(distributor["Supply Man"] ?? "")),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () => onEdit(key, distributor),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => onDelete(key),
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => distributors.length;

  @override
  int get selectedRowCount => 0;
}
