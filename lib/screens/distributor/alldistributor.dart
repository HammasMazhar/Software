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

  final List<String> distributorFields = [
    "Name",
    "ManagerName",
    "ManagerNumber",
    "BookingMan1",
    "BookingMan1Number",
    "BookingMan2",
    "BookingMan2Number",
    "SupplyManName",
    "SupplyManNumber"
  ];

  void _addDistributor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Distributor"),
          content: DynamicForm(
            fieldNames: distributorFields,
            onSubmit: (values) {
              distributorBox.add(values);
            },
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
          content: DynamicForm(
            fieldNames: distributorFields,
            initialValues: Map<String, String>.from(distributor),
            onSubmit: (values) {
              distributorBox.put(key, values);
            },
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
        title: const Text("Distributors"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addDistributor,
              child: const Text("+ Add Distributor"),
            ),
            const SizedBox(height: 10),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ValueListenableBuilder(
                    valueListenable: distributorBox.listenable(),
                    builder: (context, Box box, _) {
                      if (box.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("No Distributors Added"),
                          ),
                        );
                      }

                      final distributors = box.keys
                          .map((key) => {"key": key, "data": box.get(key)})
                          .where((entry) {
                        final data = entry["data"] as Map;
                        final name =
                            (data["Name"] ?? "").toString().toLowerCase();
                        return name.contains(searchQuery);
                      }).toList();

                      distributors.sort((a, b) {
                        final aName =
                            (a["data"]["Name"] ?? "").toString().toLowerCase();
                        final bName =
                            (b["data"]["Name"] ?? "").toString().toLowerCase();
                        return aName.compareTo(bName);
                      });

                      return DataTable(
                        columns: const [
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Manager Name")),
                          DataColumn(label: Text("Manager Number")),
                          DataColumn(label: Text("Booking Man1")),
                          DataColumn(label: Text("Booking Man1 Number")),
                          DataColumn(label: Text("Booking Man2")),
                          DataColumn(label: Text("Booking Man2 Number")),
                          DataColumn(label: Text("Supply Man Name")),
                          DataColumn(label: Text("Supply Man Number")),
                          DataColumn(label: Text("Actions")),
                        ],
                        rows: distributors.map((entry) {
                          final distributor = entry["data"] as Map;
                          final key = entry["key"];
                          return DataRow(cells: [
                            DataCell(Text(distributor["Name"] ?? "")),
                            DataCell(Text(distributor["ManagerName"] ?? "")),
                            DataCell(Text(distributor["ManagerNumber"] ?? "")),
                            DataCell(Text(distributor["BookingMan1"] ?? "")),
                            DataCell(
                                Text(distributor["BookingMan1Number"] ?? "")),
                            DataCell(Text(distributor["BookingMan2"] ?? "")),
                            DataCell(
                                Text(distributor["BookingMan2Number"] ?? "")),
                            DataCell(Text(distributor["SupplyManName"] ?? "")),
                            DataCell(
                                Text(distributor["SupplyManNumber"] ?? "")),
                            DataCell(Row(children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () =>
                                    _editDistributor(key, distributor),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteDistributor(key),
                              ),
                            ])),
                          ]);
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
