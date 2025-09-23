import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';
import 'package:hive/hive.dart';
import 'package:software/screens/global_widgets/excel.dart';

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

  ///  Show the form inside a dialog
  void _showAddInvoiceDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Medicine Invoice"),
        content: SingleChildScrollView(
          child: DynamicForm(
            fieldNames: [
              'Medicine Name',
              'Distributor',
              'Invoice Number',
              'Batch No',
              'Expiry Date'
            ],
            onSubmit: (values) {
              Navigator.pop(ctx); // close dialog
              _saveInvoice(values);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Medicine Invoice',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          ElevatedButton(
              onPressed: _showAddInvoiceDialog,
              child: Text('+Add Medicine invoices',
                  style: TextStyle(
                    color: Colors.black,
                  ))),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _showAddInvoiceDialog,
      //   child: const Icon(Icons.add),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: invoices.isEmpty
                  ? const Center(child: Text('No invoices yet'))
                  : ListView.builder(
                      itemCount: invoices.length,
                      itemBuilder: (context, index) {
                        final invoice = invoices[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          //  color: Colors.white, // ✅ White background
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...invoice.entries.map(
                                  (e) => Text(
                                    '${e.key}: ${e.value}',
                                    style: const TextStyle(
                                        //    color: Colors.black, // ✅ Force black
                                        ),
                                  ),
                                ),
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
