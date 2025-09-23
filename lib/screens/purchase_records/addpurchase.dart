import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';
import 'package:software/screens/global_widgets/excel.dart';
import 'package:win32/win32.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final Box addPurchaseBox = Hive.box('addPurchaseBox');
  final List<String> fieldNames = [
    'Distributor Name',
    'Product Name',
    'Invoice Number',
    'Expiri',
    'Amount'
  ];

  String searchQuery = "";

  void _addPurchaseDialog({Map<String, String>? initialValues, int? index}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(index == null ? "Add Purchase" : "Edit Purchase"),
        content: SizedBox(
            width: 500,
            height: 380,
            child: DynamicForm(
              fieldNames: fieldNames,
              initialValues: initialValues,
              onSubmit: (values) {
                final Map<String, dynamic> purchase = {
                  'Distributor': (values['Distributor Name'] ?? '').isEmpty
                      ? 'Non Distributor'
                      : values['Distributor Name']!,
                  'Product Name': (values['Product Name'] ?? '').isEmpty
                      ? 'No Product Added'
                      : values['Product Name']!,
                  'Invoice Number': (values['Invoice Number'] ?? '').isEmpty
                      ? 'No Invoice Added'
                      : values['Invoice Number']!,
                  'Expiri': (values['Expiri'] ?? '').isEmpty
                      ? 'No Expiri Added'
                      : values['Expiri']!,
                  'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  'day': DateFormat('EEEE').format(DateTime.now()),
                  'Amount': double.tryParse(values['Amount'] ?? '0') ?? 0.0,
                };
                if (index == null) {
                  addPurchaseBox.add(purchase);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Purchase added successfully!')),
                  );
                } else {
                  addPurchaseBox.putAt(index, purchase);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Purchase updated successfully!')),
                  );
                }
              },
            )),
      ),
    );
  }

  void _deletePurchase(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          width: 500,
          height: 400,
          child: AlertDialog(
            title: const Text("Are you sure?"),
            content: const Text("This purchase will be deleted permanently."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  addPurchaseBox.deleteAt(index);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Purchase deleted')),
                  );
                },
                child: const Text("Delete"),
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
          title: Text(
            "Purchases",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add Purchase"),
                onPressed: () => _addPurchaseDialog(),
              ),
            ),
            IconButton(
              tooltip: "Export to Excel",
              onPressed: () {
                ExcelHelper.exportToExcel(
                  context: context,
                  boxes: [addPurchaseBox],
                  sheetName: "Add Purchase",
                  fileName: "Add Purchase",
                  headers: [
                    "Distributor",
                    "Product Name",
                    "Invoice Number",
                    "Expiri",
                    "date",
                    "day",
                    "Amount",
                  ],
                );
              },
              icon: const Icon(Icons.file_upload),
            ),
            IconButton(
              tooltip: "Import from Excel",
              onPressed: () {
                ExcelHelper.importFromExcel(
                  context: context,
                  boxes: [addPurchaseBox],
                  headers: [
                    "Distributor",
                    "Product Name",
                    "Invoice Number",
                    "Expiri",
                    "date",
                    "day",
                    "Amount",
                  ],
                );
              },
              icon: const Icon(Icons.file_download),
            ),
          ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search by Distributor name...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.trim().toLowerCase();
                });
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: ElevatedButton.icon(
          //     icon: const Icon(Icons.add),
          //     label: const Text("Add Purchase"),
          //     onPressed: () => _addPurchaseDialog(),
          //   ),
          // ),
          //const Divider(),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: addPurchaseBox.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text("No purchases yet"));
                }

                var purchases =
                    box.values.whereType<Map>().toList().where((purchase) {
                  final company =
                      (purchase['Distributor'] ?? '').toString().toLowerCase();
                  return company.contains(searchQuery);
                }).toList();

                purchases = purchases.reversed.toList();

                if (purchases.isEmpty) {
                  return const Center(child: Text("No matching purchases"));
                }

                return ListView.builder(
                  itemCount: purchases.length,
                  itemBuilder: (context, i) {
                    final purchase = purchases[i];
                    final index = box.values.toList().indexOf(purchase);

                    return Card(
                      child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              purchase['Distributor'] ?? 'Non Distributor',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rs.${purchase['Amount'] ?? 0}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          "${purchase['day'] ?? ''} | ${purchase['date'] ?? ''}",
                        ),
                        children: [
                          ListTile(
                            title: const Text(
                              'Invoice Number',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(purchase['Invoice Number'] ??
                                'No Invoice Added'),
                          ),
                          ListTile(
                            title: const Text(
                              'Product Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                purchase['Product Name'] ?? 'No Product Added'),
                          ),
                          ListTile(
                            title: const Text(
                              "Expiri Details",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle:
                                Text(purchase['Expiri'] ?? 'No Expiri Added'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.green),
                                onPressed: () => _addPurchaseDialog(
                                  initialValues: {
                                    'Distributor Name':
                                        purchase['Distributor'] ??
                                            'Non Distributor',
                                    'Product Name': purchase['Product Name'] ??
                                        'No Product Added',
                                    'Invoice Number':
                                        purchase['Invoice Number'] ??
                                            'No Invoice Added',
                                    'Expiri':
                                        purchase['Expiri'] ?? 'No Expiri Added',
                                    'Amount':
                                        (purchase['Amount'] ?? 0).toString(),
                                  },
                                  index: index,
                                ),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deletePurchase(index),
                              ),
                            ],
                          ),
                        ],
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
