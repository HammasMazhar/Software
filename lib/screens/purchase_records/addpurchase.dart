// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';
// import 'package:software/reuseable_widget/excel.dart';

// class PurchaseScreen extends StatefulWidget {
//   const PurchaseScreen({super.key});

//   @override
//   State<PurchaseScreen> createState() => _PurchaseScreenState();
// }

// class _PurchaseScreenState extends State<PurchaseScreen> {
//   final Box purchaseBox = Hive.box('purchaseBox');
//   final List<String> fieldNames = ['Company Name', 'Amount'];

//   String searchQuery = "";

//   void _addPurchaseDialog({Map<String, String>? initialValues, int? index}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(index == null ? "Add Purchase" : "Edit Purchase"),
//         content: DynamicForm(
//           fieldNames: fieldNames,
//           initialValues: initialValues,
//           onSubmit: (values) {
//             final Map<String, dynamic> purchase = {
//               'company': values['Company Name']!.isEmpty
//                   ? 'Non Company'
//                   : values['Company Name']!,
//               'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
//               'day': DateFormat('EEEE').format(DateTime.now()),
//               'amount': double.tryParse(values['Amount'] ?? '0') ?? 0.0,
//             };

//             if (index == null) {
//               purchaseBox.add(purchase);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Purchase added successfully!')),
//               );
//             } else {
//               purchaseBox.putAt(index, purchase);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Purchase updated successfully!')),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   void _deletePurchase(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This purchase will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 purchaseBox.deleteAt(index);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Purchase deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Purchases"),
//           backgroundColor: const Color(0xFF008000),
//           actions: [
//             IconButton(
//               tooltip: "Export to Excel",
//               onPressed: () {
//                 ExcelHelper.exportToExcel(
//                   context: context,
//                   boxes: [purchaseBox],
//                   sheetName: " Add Purchase",
//                   fileName: " Add Purchase",
//                   headers: [
//                     "company",
//                     "date",
//                     "day",
//                     "amount",
//                   ],
//                 );
//               },
//               icon: const Icon(Icons.file_upload),
//             ),
//             IconButton(
//               tooltip: "Import from Excel",
//               onPressed: () {
//                 ExcelHelper.importFromExcel(
//                   context: context,
//                   boxes: [purchaseBox],
//                   headers: [
//                     "company",
//                     "date",
//                     "day",
//                     "amount",
//                   ],
//                 );
//               },
//               icon: const Icon(Icons.file_download),
//             ),
//           ]),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               decoration: const InputDecoration(
//                 hintText: "Search by company name...",
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value.trim().toLowerCase();
//                 });
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: ElevatedButton.icon(
//               icon: const Icon(Icons.add),
//               label: const Text("Add Purchase"),
//               onPressed: () => _addPurchaseDialog(),
//             ),
//           ),
//           const Divider(),
//           Expanded(
//             child: ValueListenableBuilder(
//               valueListenable: purchaseBox.listenable(),
//               builder: (context, Box box, _) {
//                 if (box.isEmpty) {
//                   return const Center(child: Text("No purchases yet"));
//                 }

//                 var purchases =
//                     box.values.whereType<Map>().toList().where((purchase) {
//                   final company =
//                       (purchase['company'] ?? '').toString().toLowerCase();
//                   return company.contains(searchQuery);
//                 }).toList();

//                 purchases = purchases.reversed.toList();

//                 if (purchases.isEmpty) {
//                   return const Center(child: Text("No matching purchases"));
//                 }

//                 return ListView.builder(
//                   itemCount: purchases.length,
//                   itemBuilder: (context, i) {
//                     final purchase = purchases[i];
//                     final index = box.values.toList().indexOf(purchase);

//                     return Card(
//                       color: Color(0xFF008000),
//                       margin: const EdgeInsets.all(8),
//                       child: ListTile(
//                         title: Text(
//                           "${purchase['company']} - Rs.${purchase['amount']}",
//                         ),
//                         subtitle: Text(
//                           "${purchase['day']} | ${purchase['date']}",
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon:
//                                   const Icon(Icons.edit, color: Colors.orange),
//                               onPressed: () => _addPurchaseDialog(
//                                 initialValues: {
//                                   'Company Name': purchase['company'],
//                                   'Amount': purchase['amount'].toString(),
//                                 },
//                                 index: index,
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () => _deletePurchase(index),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';
import 'package:software/screens/global_widgets/excel.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final Box addPurchaseBox = Hive.box('addPurchaseBox');
  final List<String> fieldNames = ['Distributor Name', 'Expiri', 'Amount'];

  String searchQuery = "";

  void _addPurchaseDialog({Map<String, String>? initialValues, int? index}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(index == null ? "Add Purchase" : "Edit Purchase"),
        content: DynamicForm(
          fieldNames: fieldNames,
          initialValues: initialValues,
          onSubmit: (values) {
            final Map<String, dynamic> purchase = {
              'Distributor': (values['Distributor Name'] ?? '').isEmpty
                  ? 'Non Distributor'
                  : values['Distributor Name']!,
              'Expiri': (values['Expiri'] ?? '').isEmpty
                  ? 'Non Expiri'
                  : values['Expiri']!,
              'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
              'day': DateFormat('EEEE').format(DateTime.now()),
              'Amount': double.tryParse(values['Amount'] ?? '0') ?? 0.0,
            };
            if (index == null) {
              addPurchaseBox.add(purchase);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Purchase added successfully!')),
              );
            } else {
              addPurchaseBox.putAt(index, purchase);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Purchase updated successfully!')),
              );
            }
          },
        ),
      ),
    );
  }

  void _deletePurchase(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Purchases"),
          backgroundColor: const Color(0xFF008000),
          actions: [
            IconButton(
              tooltip: "Export to Excel",
              onPressed: () {
                ExcelHelper.exportToExcel(
                  context: context,
                  boxes: [addPurchaseBox],
                  sheetName: " Add Purchase",
                  fileName: " Add Purchase",
                  headers: [
                    "Distributor",
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Add Purchase"),
              onPressed: () => _addPurchaseDialog(),
            ),
          ),
          const Divider(),
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
                      color: const Color(0xFF008000),
                      margin: const EdgeInsets.all(8),
                      child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              purchase['Distributor'] ??
                                  'Non Distributor', // Null check
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rs.${purchase['Amount'] ?? 0}", // Null check
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          "${purchase['day'] ?? ''} | ${purchase['date'] ?? ''}", // Null check
                          style: const TextStyle(color: Colors.white70),
                        ),
                        children: [
                          // ListTile(
                          //   title: const Text("Distributor"),
                          //   subtitle: Text(
                          //       purchase['distributor'] ?? 'Non Distributor'),
                          // ),
                          ListTile(
                            title: const Text("Expiri Details"),
                            subtitle: Text(purchase['Expiri'] ?? 'Non Expiri'),
                          ),
                          // ListTile(
                          //   title: const Text("Amount"),
                          //   subtitle: Text("Rs.${purchase['amount'] ?? 0}"),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.green),
                                onPressed: () => _addPurchaseDialog(
                                  initialValues: {
                                    'Distributor Name':
                                        purchase['distributor'] ??
                                            'Non Distributor',
                                    'Expiri':
                                        purchase['expiri'] ?? 'Non Expiri',
                                    'Amount':
                                        (purchase['amount'] ?? 0).toString(),
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
