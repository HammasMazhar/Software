import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/reuseable_widget/dynamic_form.dart';

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

  void _addStocks() {
    final fieldNames = ["Medicine Name", "Company", "Tablets", "Pack Price"];

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
    final fieldNames = ["Medicine Name", "Company", "Tablets", "Pack Price"];

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
              "Tablets": stock["Tablets"] ?? "",
              "Pack Price": stock["Pack Price"] ?? "",
            },
            onSubmit: (values) {
              final updatedStock = {
                "Medicine Name": values["Medicine Name"] ?? "",
                "Company": values["Company"] ?? "",
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
