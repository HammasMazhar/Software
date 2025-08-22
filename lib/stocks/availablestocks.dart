import 'package:flutter/material.dart';

class Availablestocks extends StatefulWidget {
  const Availablestocks({super.key});

  @override
  State<Availablestocks> createState() => _AvailablestocksState();
}

class _AvailablestocksState extends State<Availablestocks> {
  static const routeName = '/availablestocks';
  List<Map<String, dynamic>> stocks = [];

  void _adddstocks() {
    showDialog(
      context: context,
      builder: (context) {
        final medicinenameController = TextEditingController();
        final companyController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Stocks'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: medicinenameController,
                decoration: const InputDecoration(labelText: 'Medicine Name'),
              ),
              TextField(
                controller: companyController,
                decoration: const InputDecoration(labelText: 'Company'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    stocks.add({
                      "Medicine Name": medicinenameController.text,
                      "Company": companyController.text,
                    });
                  });
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  void editstocks(Map<String, dynamic> stock) {
    final medicinenameController = TextEditingController(
      text: stock['Medicine Name'],
    );
    final companyController = TextEditingController(text: stock['Company']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Stocks"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: medicinenameController,
                decoration: const InputDecoration(labelText: 'Medicine Name'),
              ),
              TextField(
                controller: companyController,
                decoration: const InputDecoration(labelText: 'Company'),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      stock["Medicine Name"] = medicinenameController.text;
                      stock["Company"] = companyController.text;

                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text("Update"),
                  ),
                ],
              ),
            ],
          ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _adddstocks,
              child: const Text("+ Add Stocks"),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Medicine Name")),
                    DataColumn(label: Text("Company")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows:
                      stocks
                          .map(
                            (stock) => DataRow(
                              cells: [
                                DataCell(Text(stock["Medicine Name"] ?? "")),
                                DataCell(Text(stock["Company"] ?? "")),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () => editstocks(stock),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            stocks.remove(stock);
                                          });
                                        },
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
