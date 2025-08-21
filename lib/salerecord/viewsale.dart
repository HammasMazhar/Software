import 'package:flutter/material.dart';

class Viewsale extends StatefulWidget {
  const Viewsale({super.key});

  @override
  State<Viewsale> createState() => _ViewsaleState();
}

class _ViewsaleState extends State<Viewsale> {
  static const String routeName = '/view_sale';
  List<Map<String, dynamic>> sales = [
    {"id": 1, "invoice": "INV001", "customer": "Ali Khan", "total": 1500},
    {"id": 2, "invoice": "INV002", "customer": "Pharma B", "total": 950},
  ];

  void _addSale() {
    showDialog(
      context: context,
      builder: (context) {
        final invoiceController = TextEditingController();
        final customerController = TextEditingController();
        final totalController = TextEditingController();

        return AlertDialog(
          title: const Text("Add Sale"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: invoiceController,
                decoration: const InputDecoration(labelText: "Invoice #"),
              ),
              TextField(
                controller: customerController,
                decoration: const InputDecoration(labelText: "Customer"),
              ),
              TextField(
                controller: totalController,
                decoration: const InputDecoration(labelText: "Total"),
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
                    "id": sales.length + 1,
                    "invoice": invoiceController.text,
                    "customer": customerController.text,
                    "total": int.tryParse(totalController.text) ?? 0,
                  });
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _editSale(Map<String, dynamic> sale) {
    final invoiceController = TextEditingController(text: sale["invoice"]);
    final customerController = TextEditingController(text: sale["customer"]);
    final totalController = TextEditingController(
      text: sale["total"].toString(),
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Edit Sale"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: invoiceController,
                  decoration: const InputDecoration(labelText: "Invoice #"),
                ),
                TextField(
                  controller: customerController,
                  decoration: const InputDecoration(labelText: "Customer"),
                ),
                TextField(
                  controller: totalController,
                  decoration: const InputDecoration(labelText: "Total"),
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
                    sale["invoice"] = invoiceController.text;
                    sale["customer"] = customerController.text;
                    sale["total"] = int.tryParse(totalController.text) ?? 0;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Update"),
              ),
            ],
          ),
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
      appBar: AppBar(title: const Text("View Sales")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addSale,
              child: const Text("+ Add Sale"),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Invoice")),
                    DataColumn(label: Text("Customer")),
                    DataColumn(label: Text("Total")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows:
                      sales
                          .map(
                            (sale) => DataRow(
                              cells: [
                                DataCell(Text(sale["invoice"])),
                                DataCell(Text(sale["customer"])),
                                DataCell(Text(sale["total"].toString())),
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
            ),
          ],
        ),
      ),
    );
  }
}
