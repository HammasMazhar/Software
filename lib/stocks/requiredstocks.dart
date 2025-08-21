import 'package:flutter/material.dart';

class Requiredstocks extends StatefulWidget {
  const Requiredstocks({super.key});

  @override
  State<Requiredstocks> createState() => _RequiredstocksState();
}

class _RequiredstocksState extends State<Requiredstocks> {
  static const String routeName = '/requiredstocks';
  List<Map<String, dynamic>> sales = [
    //{"Name": "panadol", "Quantitiy": "1500", "Distributor": "sameel"},
  ];

  void _addStocks() {
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        final quantityController = TextEditingController();

        final distributorController = TextEditingController();
        return AlertDialog(
          title: const Text("Add Expired Stock"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
              ),

              TextField(
                controller: distributorController,
                decoration: const InputDecoration(labelText: "Distributor"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sales.add({
                    "Name": nameController.text,
                    "Quantitiy": int.tryParse(quantityController.text) ?? 0,

                    "Distributor": distributorController.text,
                  });
                });
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _editStocks(Map<String, dynamic> sale) {
    final nameController = TextEditingController(text: sale["Name"]);
    final quantityController = TextEditingController(
      text: sale["Quantitiy"].toString(),
    );

    final distributorController = TextEditingController(
      text: sale["Distributor"],
    );
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Expired Stock"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
              ),

              TextField(
                controller: distributorController,
                decoration: const InputDecoration(labelText: "Distributor"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sale["Name"] = nameController.text;
                  sale["Quantitiy"] =
                      int.tryParse(quantityController.text) ?? 0;

                  sale["Distributor"] = distributorController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _deleteStocks(Map<String, dynamic> sale) {
    setState(() {
      sales.remove(sale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Required Stocks"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addStocks,
              child: const Text("+ Add Required Stock"),
            ),
            Expanded(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Quantity")),
                  DataColumn(label: Text("Distributor")),
                  DataColumn(label: Text("Actions")),
                ],
                rows:
                    sales
                        .map(
                          (sale) => DataRow(
                            cells: [
                              DataCell(Text(sale["Name"] ?? "")),
                              DataCell(
                                Text(sale["Quantitiy"]?.toString() ?? "0"),
                              ),

                              DataCell(Text(sale["Distributor"] ?? "")),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () => _editStocks(sale),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _deleteStocks(sale),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
