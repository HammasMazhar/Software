import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/reuseable_widget/dynamic_form.dart'; // your DynamicForm widget

class Expiredstocks extends StatefulWidget {
  const Expiredstocks({super.key});

  @override
  State<Expiredstocks> createState() => _ExpiredstocksState();
}

class _ExpiredstocksState extends State<Expiredstocks> {
  late Box expiredBox;

  final List<String> fieldNames = [
    "id",
    "Batch",
    "Name",
    "Quantity",
    "Price",
    "ExpiryDate",
    "Distributor",
  ];

  @override
  void initState() {
    super.initState();
    expiredBox = Hive.box('expiredBox');
  }

  void _addSale() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Expired Stock"),
          content: DynamicForm(
            fieldNames: fieldNames,
            onSubmit: (values) {
              expiredBox.add({
                "id": int.tryParse(values["id"] ?? "0") ?? 0,
                "Batch": values["Batch"] ?? "",
                "Name": values["Name"] ?? "",
                "Quantitiy": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                "Price": double.tryParse(values["Price"] ?? "0") ?? 0.0,
                "ExpiryDate": values["ExpiryDate"] ?? "",
                "Distributor": values["Distributor"] ?? "",
              });
              Navigator.pop(context); // close dialog after adding
            },
          ),
        );
      },
    );
  }

  void _editSale(int key, Map sale) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Expired Stock"),
          content: DynamicForm(
            fieldNames: fieldNames,
            initialValues: {
              "id": sale["id"].toString(),
              "Batch": sale["Batch"] ?? "",
              "Name": sale["Name"] ?? "",
              "Quantity": sale["Quantitiy"].toString(),
              "Price": sale["Price"].toString(),
              "ExpiryDate": sale["ExpiryDate"] ?? "",
              "Distributor": sale["Distributor"] ?? "",
            },
            onSubmit: (values) {
              expiredBox.put(key, {
                "id": int.tryParse(values["id"] ?? "0") ?? 0,
                "Batch": values["Batch"] ?? "",
                "Name": values["Name"] ?? "",
                "Quantitiy": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                "Price": double.tryParse(values["Price"] ?? "0") ?? 0.0,
                "ExpiryDate": values["ExpiryDate"] ?? "",
                "Distributor": values["Distributor"] ?? "",
              });
              // Navigator.pop(context); // close edit dialog
            },
          ),
        );
      },
    );
  }

  void _deleteSale(int key) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content:
            const Text("Are you sure you want to delete this expired stock?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Cancel
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              expiredBox.delete(key);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expired Stocks"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addSale,
              child: const Text("+ Add Expired Stock"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: expiredBox.listenable(),
                builder: (context, Box box, _) {
                  if (box.isEmpty) {
                    return const Center(child: Text("No expired stocks found"));
                  }

                  final keys = box.keys.toList();

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Batch")),
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Quantity")),
                          DataColumn(label: Text("Price")),
                          DataColumn(label: Text("Expiry Date")),
                          DataColumn(label: Text("Distributor")),
                          DataColumn(label: Text("Actions")),
                        ],
                        rows: keys.map((key) {
                          final sale = box.get(key) as Map;
                          return DataRow(
                            cells: [
                              DataCell(Text(sale["Batch"] ?? "")),
                              DataCell(Text(sale["Name"] ?? "")),
                              DataCell(Text(sale["Quantitiy"].toString())),
                              DataCell(Text(sale["Price"].toString())),
                              DataCell(Text(sale["ExpiryDate"] ?? "")),
                              DataCell(Text(sale["Distributor"] ?? "")),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () => _editSale(key, sale),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () => _deleteSale(key),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
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
