// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';
// import 'package:hive/hive.dart';

// class StoreMedicineInvoice extends StatefulWidget {
//   const StoreMedicineInvoice({super.key});

//   @override
//   State<StoreMedicineInvoice> createState() => _StoreMedicineInvoiceState();
// }

// class _StoreMedicineInvoiceState extends State<StoreMedicineInvoice> {
//   final Box medicineInvoiceBox = Hive.box('medicineInvoiceBox');

//   late String currentDate;
//   late String currentDay;

//   List<Map<String, String>> invoices = [];

//   @override
//   void initState() {
//     super.initState();
//     DateTime now = DateTime.now();
//     currentDate = DateFormat('yyyy-MM-dd').format(now);
//     currentDay = DateFormat('EEEE').format(now);

//     _loadInvoices();
//   }

//   void _loadInvoices() {
//     final storedInvoices =
//         medicineInvoiceBox.get('invoices', defaultValue: <Map>[]);
//     setState(() {
//       invoices = List<Map<String, String>>.from(storedInvoices);
//     });
//   }

//   void _saveInvoice(Map<String, String> values) {
//     final invoice = {
//       ...values,
//       'Date': currentDate,
//       'Day': currentDay,
//     };

//     setState(() {
//       invoices.add(invoice);
//       medicineInvoiceBox.put('invoices', invoices);
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Invoice saved successfully!')),
//     );
//   }

//   void _deleteInvoice(int index) {
//     setState(() {
//       invoices.removeAt(index);
//       medicineInvoiceBox.put('invoices', invoices);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Store Medicine Invoice'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DynamicForm(
//               fieldNames: ['Medicine Name', 'Distributor', 'Invoice Number'],
//               onSubmit: _saveInvoice,
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Date: $currentDate',
//                     style: const TextStyle(fontSize: 16)),
//                 Text('Day: $currentDay', style: const TextStyle(fontSize: 16)),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: invoices.isEmpty
//                   ? const Center(child: Text('No invoices yet'))
//                   : ListView.builder(
//                       itemCount: invoices.length,
//                       itemBuilder: (context, index) {
//                         final invoice = invoices[index];
//                         return Card(
//                           margin: const EdgeInsets.symmetric(vertical: 8),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ...invoice.entries
//                                     .map((e) => Text('${e.key}: ${e.value}'))
//                                     .toList(),
//                                 const SizedBox(height: 10),
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: IconButton(
//                                     icon: const Icon(Icons.delete,
//                                         color: Colors.red),
//                                     onPressed: () => _deleteInvoice(index),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';
// import 'package:hive/hive.dart';
// import 'package:software/reuseable_widget/excel.dart';

// class StoreMedicineInvoice extends StatefulWidget {
//   const StoreMedicineInvoice({super.key});

//   @override
//   State<StoreMedicineInvoice> createState() => _StoreMedicineInvoiceState();
// }

// class _StoreMedicineInvoiceState extends State<StoreMedicineInvoice> {
//   final Box medicineInvoiceBox = Hive.box('medicineInvoiceBox');

//   List<Map<String, String>> invoices = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadInvoices();
//   }

//   void _loadInvoices() {
//     final storedInvoices =
//         medicineInvoiceBox.get('invoices', defaultValue: <Map>[]);

//     invoices = storedInvoices.map<Map<String, String>>((invoice) {
//       return Map<String, String>.from(invoice
//           .map((key, value) => MapEntry(key.toString(), value.toString())));
//     }).toList();

//     setState(() {});
//   }

//   void _saveInvoice(Map<String, String> values) {
//     DateTime now = DateTime.now();
//     final currentDate = DateFormat('yyyy-MM-dd').format(now);
//     final currentTime = DateFormat('hh:mm:ss a').format(now);
//     final currentDay = DateFormat('EEEE').format(now);

//     final invoice = {
//       ...values,
//       'Date': currentDate,
//       'Day': currentDay,
//       'Time': currentTime,
//     };

//     setState(() {
//       invoices.add(invoice);
//       medicineInvoiceBox.put('invoices', invoices);
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Invoice saved successfully!')),
//     );
//   }

//   void _deleteInvoice(int index) {
//     setState(() {
//       invoices.removeAt(index);
//       medicineInvoiceBox.put('invoices', invoices);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text('Store Medicine Invoice'),
//           centerTitle: true,
//           backgroundColor: const Color(0xFF008000),
//           actions: [
//             IconButton(
//               tooltip: "Export to Excel",
//               onPressed: () {
//                 ExcelHelper.exportToExcel(
//                   context: context,
//                   boxes: [medicineInvoiceBox],
//                   sheetName: " Medicine Invoice ",
//                   fileName: " Medicine Invoice",
//                   headers: [
//                     "Medicine Name",
//                     "Distributor",
//                     "Invoice Number",
//                     "Date",
//                     "Day",
//                     "Time",
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
//                   boxes: [medicineInvoiceBox],
//                   headers: [
//                     "Medicine Name",
//                     "Distributor",
//                     "Invoice Number",
//                     "Date",
//                     "Day",
//                     "Time",
//                   ],
//                 );
//               },
//               icon: const Icon(Icons.file_download),
//             ),
//           ]),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DynamicForm(
//               fieldNames: ['Medicine Name', 'Distributor', 'Invoice Number'],
//               onSubmit: _saveInvoice,
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: invoices.isEmpty
//                   ? const Center(child: Text('No invoices yet'))
//                   : ListView.builder(
//                       itemCount: invoices.length,
//                       itemBuilder: (context, index) {
//                         final invoice = invoices[index];
//                         return Card(
//                           margin: const EdgeInsets.symmetric(vertical: 8),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ...invoice.entries
//                                     .map((e) => Text('${e.key}: ${e.value}'))
//                                     .toList(),
//                                 const SizedBox(height: 10),
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: IconButton(
//                                     icon: const Icon(Icons.delete,
//                                         color: Colors.red),
//                                     onPressed: () => _deleteInvoice(index),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:software/reuseable_widget/dynamic_form.dart';
import 'package:hive/hive.dart';
import 'package:software/reuseable_widget/excel.dart';

class StoreMedicineInvoice extends StatefulWidget {
  const StoreMedicineInvoice({super.key});

  @override
  State<StoreMedicineInvoice> createState() => _StoreMedicineInvoiceState();
}

class _StoreMedicineInvoiceState extends State<StoreMedicineInvoice> {
  final Box medicineInvoiceBox = Hive.box('medicineInvoiceBox');

  List<Map<String, String>> invoices = [];

  @override
  void initState() {
    super.initState();
    _loadInvoices();
  }

  void _loadInvoices() {
    final storedInvoices =
        medicineInvoiceBox.get('invoices', defaultValue: <Map>[]);

    invoices = storedInvoices.map<Map<String, String>>((invoice) {
      return Map<String, String>.from(invoice
          .map((key, value) => MapEntry(key.toString(), value.toString())));
    }).toList();

    setState(() {});
  }

  void _saveInvoice(Map<String, String> values) {
    DateTime now = DateTime.now();
    final currentDate = DateFormat('yyyy-MM-dd').format(now);
    final currentTime = DateFormat('hh:mm:ss a').format(now);
    final currentDay = DateFormat('EEEE').format(now);

    final invoice = {
      ...values,
      'Date': currentDate,
      'Day': currentDay,
      'Time': currentTime,
    };

    setState(() {
      invoices.insert(0, invoice);
      medicineInvoiceBox.put('invoices', invoices);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invoice saved successfully!')),
    );
  }

  void _deleteInvoice(int index) {
    setState(() {
      invoices.removeAt(index);
      medicineInvoiceBox.put('invoices', invoices);
    });
  }

  void _exportInvoices() {
    ExcelHelper.exportRowsToExcel(
      context: context,
      sheetName: "Medicine Invoice",
      fileName: "Medicine Invoice",
      headers: [
        "Medicine Name",
        "Distributor",
        "Invoice Number",
        "Batch No",
        "Expiry Date",
        "Date",
        "Day",
        "Time",
      ],
      rows: invoices.map((invoice) {
        return [
          invoice["Medicine Name"] ?? "",
          invoice["Distributor"] ?? "",
          invoice["Invoice Number"] ?? "",
          invoice["Batch No"] ?? "",
          invoice["Expiry Date"] ?? "",
          invoice["Date"] ?? "",
          invoice["Day"] ?? "",
          invoice["Time"] ?? "",
        ];
      }).toList(),
    );
  }

  Future<void> _importInvoices() async {
    final imported = await ExcelHelper.importRowsFromExcel(
      context: context,
      headers: [
        "Medicine Name",
        "Distributor",
        "Invoice Number",
        "Batch No",
        "Expiry Date",
        "Date",
        "Day",
        "Time",
      ],
    );

    setState(() {
      invoices = imported.map<Map<String, String>>((invoice) {
        return invoice.map(
            (key, value) => MapEntry(key.toString(), value?.toString() ?? ""));
      }).toList();
      medicineInvoiceBox.put('invoices', invoices);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Medicine Invoice'),
        centerTitle: true,
        backgroundColor: const Color(0xFF008000),
        actions: [
          IconButton(
            tooltip: "Export to Excel",
            onPressed: _exportInvoices,
            icon: const Icon(Icons.file_upload),
          ),
          IconButton(
            tooltip: "Import from Excel",
            onPressed: _importInvoices,
            icon: const Icon(Icons.file_download),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DynamicForm(
              fieldNames: [
                'Medicine Name',
                'Distributor',
                'Invoice Number',
                'Batch No',
                'Expiry Date'
              ],
              onSubmit: _saveInvoice,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: invoices.isEmpty
                  ? const Center(child: Text('No invoices yet'))
                  : ListView.builder(
                      itemCount: invoices.length,
                      itemBuilder: (context, index) {
                        final invoice = invoices[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...invoice.entries
                                    .map((e) => Text('${e.key}: ${e.value}')),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () async {
                                      final confirm = await showDialog<bool>(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text("Confirm Delete"),
                                          content: const Text(
                                              "Are you sure you want to delete this invoice?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(ctx, false),
                                              child: const Text("Cancel"),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red),
                                              onPressed: () =>
                                                  Navigator.pop(ctx, true),
                                              child: const Text("Delete"),
                                            ),
                                          ],
                                        ),
                                      );

                                      if (confirm == true) {
                                        _deleteInvoice(index);
                                      }
                                    },
                                  ),
                                ),
                              ],
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
