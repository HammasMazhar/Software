import 'package:flutter/material.dart';

class Expiredstocks extends StatefulWidget {
  const Expiredstocks({super.key});

  @override
  State<Expiredstocks> createState() => _ExpiredstocksState();
}

class _ExpiredstocksState extends State<Expiredstocks> {
  static const String routeName = '/view_sale';
  List<Map<String, dynamic>> sales = [];

  void _addSale() {
    showDialog(
      context: context,
      builder: (context) {
        final idController = TextEditingController();
        final batchController = TextEditingController();
        final nameController = TextEditingController();
        final quantityController = TextEditingController();
        final priceController = TextEditingController();
        final expiryDateController = TextEditingController();
        final distributorController = TextEditingController();
        return AlertDialog(
          title: const Text("Add Expired Stock"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: "ID"),
              ),
              TextField(
                controller: batchController,
                decoration: const InputDecoration(labelText: "Batch"),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Price"),
              ),
              TextField(
                controller: expiryDateController,
                decoration: const InputDecoration(labelText: "Expiry Date"),
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
                    "id": int.tryParse(idController.text) ?? 0,
                    "Batch": batchController.text,
                    "Name": nameController.text,
                    "Quantitiy": int.tryParse(quantityController.text) ?? 0,
                    "Price": double.tryParse(priceController.text) ?? 0.0,
                    "ExpiryDate": expiryDateController.text,
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

  void _editSale(Map<String, dynamic> sale) {
    final idController = TextEditingController(text: sale["id"].toString());
    final batchController = TextEditingController(text: sale["Batch"]);
    final nameController = TextEditingController(text: sale["Name"]);
    final quantityController = TextEditingController(
      text: sale["Quantitiy"].toString(),
    );
    final priceController = TextEditingController(
      text: sale["Price"].toString(),
    );
    final expiryDateController = TextEditingController(
      text: sale["ExpiryDate"],
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
                controller: idController,
                decoration: const InputDecoration(labelText: "ID"),
              ),
              TextField(
                controller: batchController,
                decoration: const InputDecoration(labelText: "Batch"),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Price"),
              ),
              TextField(
                controller: expiryDateController,
                decoration: const InputDecoration(labelText: "Expiry Date"),
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
                  sale["id"] = int.tryParse(idController.text) ?? 0;
                  sale["Batch"] = batchController.text;
                  sale["Name"] = nameController.text;
                  sale["Quantitiy"] =
                      int.tryParse(quantityController.text) ?? 0;
                  sale["Price"] = double.tryParse(priceController.text) ?? 0.0;
                  sale["ExpiryDate"] = expiryDateController.text;
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

  void _deleteSale(Map<String, dynamic> sale) {
    setState(() {
      sales.remove(sale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expired Stocks"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addSale,
              child: const Text("+ Add Expired Stock"),
            ),
            Expanded(
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
                rows:
                    sales
                        .map(
                          (sale) => DataRow(
                            cells: [
                              DataCell(Text(sale["Batch"] ?? "")),
                              DataCell(Text(sale["Name"] ?? "")),
                              DataCell(
                                Text(sale["Quantitiy"]?.toString() ?? "0"),
                              ),
                              DataCell(
                                Text(sale["Price"]?.toString() ?? "0.0"),
                              ),
                              DataCell(Text(sale["ExpiryDate"] ?? "")),
                              DataCell(Text(sale["Distributor"] ?? "")),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () => _editSale(sale),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _deleteSale(sale),
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
