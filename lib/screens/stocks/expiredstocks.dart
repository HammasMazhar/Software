// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/screens/global_widgets/dynamic_form.dart';
// import 'package:software/screens/global_widgets/excel.dart';

// class Expiredstocks extends StatefulWidget {
//   const Expiredstocks({super.key});

//   @override
//   State<Expiredstocks> createState() => _ExpiredstocksState();
// }

// class _ExpiredstocksState extends State<Expiredstocks> {
//   late Box expiredBox;

//   final List<String> fieldNames = [
//     "Batch",
//     "Name",
//     "Quantity",
//     "Price",
//     "ExpiryDate",
//     "Distributor",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     expiredBox = Hive.box('expiredBox');
//   }

//   void _addSale() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//             title: const Text("Add Expired Stock"),
//             content: SizedBox(
//               width: 500,
//               height: 450,
//               child: DynamicForm(
//                 fieldNames: fieldNames,
//                 onSubmit: (values) {
//                   expiredBox.add({
//                     "Batch": values["Batch"] ?? "",
//                     "Name": values["Name"] ?? "",
//                     "Quantitiy": int.tryParse(values["Quantity"] ?? "0") ?? 0,
//                     "Price": double.tryParse(values["Price"] ?? "0") ?? 0.0,
//                     "ExpiryDate": values["ExpiryDate"] ?? "",
//                     "Distributor": values["Distributor"] ?? "",
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//             ));
//       },
//     );
//   }

//   void _editSale(int key, Map sale) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Expired Stock"),
//           content: SizedBox(
//               width: 500,
//               height: 450,
//               child: DynamicForm(
//                 fieldNames: fieldNames,
//                 initialValues: {
//                   "Batch": sale["Batch"] ?? "",
//                   "Name": sale["Name"] ?? "",
//                   "Quantity": sale["Quantitiy"].toString(),
//                   "Price": sale["Price"].toString(),
//                   "ExpiryDate": sale["ExpiryDate"] ?? "",
//                   "Distributor": sale["Distributor"] ?? "",
//                 },
//                 onSubmit: (values) {
//                   expiredBox.put(key, {
//                     "Batch": values["Batch"] ?? "",
//                     "Name": values["Name"] ?? "",
//                     "Quantitiy": int.tryParse(values["Quantity"] ?? "0") ?? 0,
//                     "Price": double.tryParse(values["Price"] ?? "0") ?? 0.0,
//                     "ExpiryDate": values["ExpiryDate"] ?? "",
//                     "Distributor": values["Distributor"] ?? "",
//                   });
//                 },
//               )),
//         );
//       },
//     );
//   }

//   void _deleteSale(int key) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Confirm Delete"),
//         content:
//             const Text("Are you sure you want to delete this expired stock?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               expiredBox.delete(key);
//               Navigator.pop(context);
//             },
//             child: const Text("Delete"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Expired Stocks"), actions: [
//         IconButton(
//           tooltip: "Export to Excel",
//           onPressed: () {
//             ExcelHelper.exportToExcel(
//               context: context,
//               boxes: [expiredBox],
//               sheetName: "Expired Stocks",
//               fileName: "Expired_Stocks",
//               headers: [
//                 "Batch",
//                 "Name",
//                 "Quantity",
//                 "Price",
//                 "ExpiryDate",
//                 "Distributor",
//               ],
//             );
//           },
//           icon: const Icon(Icons.file_upload),
//         ),
//         IconButton(
//           tooltip: "Import from Excel",
//           onPressed: () {
//             ExcelHelper.importFromExcel(
//               context: context,
//               boxes: [expiredBox],
//               headers: [
//                 "Batch",
//                 "Name",
//                 "Quantity",
//                 "Price",
//                 "ExpiryDate",
//                 "Distributor",
//               ],
//             );
//           },
//           icon: const Icon(Icons.file_download),
//         ),
//       ]),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: _addSale,
//             child: const Text("+ Add Expired Stock"),
//           ),
//           const SizedBox(height: 10),
//           Expanded(
//             child: ValueListenableBuilder(
//               valueListenable: expiredBox.listenable(),
//               builder: (context, Box box, _) {
//                 if (box.isEmpty) {
//                   return const Center(child: Text("No expired stocks found"));
//                 }

//                 final keys = box.keys.toList().reversed.toList();

//                 return SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Center(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Batch")),
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Quantity")),
//                           DataColumn(label: Text("Price")),
//                           DataColumn(label: Text("Expiry Date")),
//                           DataColumn(label: Text("Distributor")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: keys.map((key) {
//                           final sale = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(sale["Batch"] ?? "")),
//                               DataCell(Text(sale["Name"] ?? "")),
//                               DataCell(Text(sale["Quantitiy"].toString())),
//                               DataCell(Text(sale["Price"].toString())),
//                               DataCell(Text(sale["ExpiryDate"] ?? "")),
//                               DataCell(Text(sale["Distributor"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () => _editSale(key, sale),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteSale(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
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
import 'package:software/screens/global_widgets/dynamic_form.dart';
import 'package:software/screens/global_widgets/excel.dart';

class Expiredstocks extends StatefulWidget {
  const Expiredstocks({super.key});

  @override
  State<Expiredstocks> createState() => _ExpiredstocksState();
}

class _ExpiredstocksState extends State<Expiredstocks> {
  late Box expiredBox;
  int _rowsPerPage = 20;

  final List<String> fieldNames = [
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

  // ------------------ Add Stock ------------------
  void _addSale() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Expired Stock"),
          content: SizedBox(
            width: 500,
            height: 400,
            child: DynamicForm(
              fieldNames: fieldNames,
              onSubmit: (values) {
                final newStock = {
                  "Batch": values["Batch"] ?? "",
                  "Name": values["Name"] ?? "",
                  "Quantitiy": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                  "Price": double.tryParse(values["Price"] ?? "0") ?? 0.0,
                  "ExpiryDate": values["ExpiryDate"] ?? "",
                  "Distributor": values["Distributor"] ?? "",
                };
                expiredBox.add(newStock);
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  // ------------------ Edit Stock ------------------
  void _editSale(int key, Map sale) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Expired Stock"),
          content: SizedBox(
            width: 500,
            height: 400,
            child: DynamicForm(
              fieldNames: fieldNames,
              initialValues: {
                "Batch": sale["Batch"] ?? "",
                "Name": sale["Name"] ?? "",
                "Quantity": sale["Quantitiy"].toString(),
                "Price": sale["Price"].toString(),
                "ExpiryDate": sale["ExpiryDate"] ?? "",
                "Distributor": sale["Distributor"] ?? "",
              },
              onSubmit: (values) {
                expiredBox.put(key, {
                  "Batch": values["Batch"] ?? "",
                  "Name": values["Name"] ?? "",
                  "Quantitiy": int.tryParse(values["Quantity"] ?? "0") ?? 0,
                  "Price": double.tryParse(values["Price"] ?? "0") ?? 0.0,
                  "ExpiryDate": values["ExpiryDate"] ?? "",
                  "Distributor": values["Distributor"] ?? "",
                });
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  // ------------------ Delete Stock ------------------
  void _deleteSale(int key) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content:
            const Text("Are you sure you want to delete this expired stock?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              expiredBox.delete(key);
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  // ------------------ UI ------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expired Stocks"),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: "Export to Excel",
            onPressed: () {
              ExcelHelper.exportToExcel(
                context: context,
                boxes: [expiredBox],
                sheetName: "Expired Stocks",
                fileName: "Expired_Stocks",
                headers: fieldNames,
              );
            },
            icon: const Icon(Icons.file_upload),
          ),
          IconButton(
            tooltip: "Import from Excel",
            onPressed: () {
              ExcelHelper.importFromExcel(
                context: context,
                boxes: [expiredBox],
                headers: fieldNames,
              );
            },
            icon: const Icon(Icons.file_download),
          ),
        ],
      ),
      body: Column(
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

                final keys = box.keys.toList().reversed.toList();

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final totalWidth = constraints.maxWidth;
                    final fractions = [
                      0.12,
                      0.22,
                      0.12,
                      0.12,
                      0.18,
                      0.16,
                      0.08
                    ];
                    final colWidths =
                        fractions.map((f) => totalWidth * f).toList();

                    return SingleChildScrollView(
                      child: PaginatedDataTable(
                        header: const Text("Expired Stocks"),
                        rowsPerPage: _rowsPerPage,
                        availableRowsPerPage: const [10, 20, 50, 100],
                        onRowsPerPageChanged: (value) {
                          if (value != null) {
                            setState(() => _rowsPerPage = value);
                          }
                        },
                        columns: const [
                          DataColumn(label: Text("Batch")),
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Quantity")),
                          DataColumn(label: Text("Price")),
                          DataColumn(label: Text("Expiry Date")),
                          DataColumn(label: Text("Distributor")),
                          DataColumn(label: Text("Actions")),
                        ],
                        source: _ExpiredStockDataSource(
                          keys,
                          box,
                          _editSale,
                          _deleteSale,
                          colWidths,
                        ),
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

// ------------------ DataTable Source ------------------
class _ExpiredStockDataSource extends DataTableSource {
  final List<dynamic> keys;
  final Box box;
  final Function(int, Map) onEdit;
  final Function(int) onDelete;
  final List<double> colWidths;

  _ExpiredStockDataSource(
      this.keys, this.box, this.onEdit, this.onDelete, this.colWidths);

  String _text(Object? v) => (v ?? "").toString();

  @override
  DataRow? getRow(int index) {
    if (index >= keys.length) return null;
    final key = keys[index];
    final sale = Map<String, dynamic>.from(box.get(key) ?? {});

    return DataRow(
      cells: [
        DataCell(SizedBox(
            width: colWidths[0],
            child:
                Text(_text(sale["Batch"]), overflow: TextOverflow.ellipsis))),
        DataCell(SizedBox(
            width: colWidths[1],
            child: Text(_text(sale["Name"]), overflow: TextOverflow.ellipsis))),
        DataCell(SizedBox(
            width: colWidths[2],
            child: Text(_text(sale["Quantitiy"]),
                overflow: TextOverflow.ellipsis))),
        DataCell(SizedBox(
            width: colWidths[3],
            child: Text(sale["Price"]?.toString() ?? "0.00",
                overflow: TextOverflow.ellipsis))),
        DataCell(SizedBox(
            width: colWidths[4],
            child: Text(_text(sale["ExpiryDate"]),
                overflow: TextOverflow.ellipsis))),
        DataCell(SizedBox(
            width: colWidths[5],
            child: Text(_text(sale["Distributor"]),
                overflow: TextOverflow.ellipsis))),
        DataCell(SizedBox(
          width: colWidths[6],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => onEdit(key, sale)),
              IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => onDelete(key)),
            ],
          ),
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => keys.length;
  @override
  int get selectedRowCount => 0;
}
